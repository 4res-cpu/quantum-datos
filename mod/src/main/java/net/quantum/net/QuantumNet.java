package net.quantum.net;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import net.fabricmc.api.ModInitializer;
import net.fabricmc.fabric.api.command.v2.CommandRegistrationCallback;
import net.fabricmc.fabric.api.event.lifecycle.v1.ServerLifecycleEvents;
import net.fabricmc.fabric.api.event.lifecycle.v1.ServerTickEvents;
import net.fabricmc.fabric.api.message.v1.ServerMessageEvents;
import net.fabricmc.fabric.api.networking.v1.ServerPlayConnectionEvents;
import net.fabricmc.loader.api.FabricLoader;
import net.minecraft.ChatFormatting;
import net.minecraft.commands.Commands;
import net.minecraft.core.component.DataComponents;
import net.minecraft.core.particles.ParticleOptions;
import net.minecraft.core.particles.ParticleTypes;
import net.minecraft.core.registries.BuiltInRegistries;
import net.minecraft.network.chat.Component;
import net.minecraft.network.chat.MutableComponent;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.server.players.UserBanListEntry;
import net.minecraft.world.SimpleContainer;
import net.minecraft.world.SimpleMenuProvider;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.player.Inventory;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.inventory.ChestMenu;
import net.minecraft.world.inventory.ClickType;
import net.minecraft.world.inventory.MenuType;
import net.minecraft.world.item.Item;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.Items;
import net.minecraft.world.item.component.ItemLore;
import net.minecraft.world.item.component.ResolvableProfile;
import net.minecraft.world.phys.Vec3;

import java.io.Reader;
import java.io.Writer;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.function.BiConsumer;

public class QuantumNet implements ModInitializer {
    static final Gson GSON = new GsonBuilder().setPrettyPrinting().create();
    static final String LOBBY = "quantum:lobby";

    public static class Sancion { public String tipo, staff, motivo, fecha; public long hasta; }
    public static class Datos { public String idioma; public String cosmetico; public long muteHasta; public List<Sancion> sanciones = new ArrayList<>(); public String nombre; }

    static Map<String, Datos> DATOS = new HashMap<>();
    static final Map<UUID, Vec3> CONGELADOS = new HashMap<>();
    static final Map<UUID, Integer> PEDIR_IDIOMA = new HashMap<>();
    static int tick = 0;

    // ---------- cosmeticos: id, icono, nivel minimo de rango, particula
    record Cosmetico(String id, String es, String en, String pt, Item icono, int nivel, ParticleOptions p, int n, double dy) {}
    static final List<Cosmetico> COSMETICOS = List.of(
        new Cosmetico("corazones", "Corazones", "Hearts", "Corações", Items.RED_DYE, 1, ParticleTypes.HEART, 1, 2.2),
        new Cosmetico("notas", "Notas musicales", "Music notes", "Notas musicais", Items.NOTE_BLOCK, 1, ParticleTypes.NOTE, 1, 2.2),
        new Cosmetico("llamas", "Llamas", "Flames", "Chamas", Items.BLAZE_POWDER, 2, ParticleTypes.FLAME, 3, 0.2),
        new Cosmetico("cerezo", "Pétalos de cerezo", "Cherry petals", "Pétalas de cerejeira", Items.PINK_PETALS, 2, ParticleTypes.CHERRY_LEAVES, 3, 2.0),
        new Cosmetico("encanto", "Runas", "Runes", "Runas", Items.ENCHANTING_TABLE, 3, ParticleTypes.ENCHANT, 8, 1.6),
        new Cosmetico("alma", "Almas", "Souls", "Almas", Items.SOUL_LANTERN, 3, ParticleTypes.SOUL_FIRE_FLAME, 3, 0.2),
        new Cosmetico("estela", "Estela de luz", "Light trail", "Rastro de luz", Items.END_ROD, 4, ParticleTypes.END_ROD, 3, 0.9),
        new Cosmetico("fractura", "Fractura", "Fracture", "Fratura", Items.AMETHYST_SHARD, 4, ParticleTypes.REVERSE_PORTAL, 10, 1.0),
        new Cosmetico("totem", "Tótem", "Totem", "Totem", Items.TOTEM_OF_UNDYING, 5, ParticleTypes.TOTEM_OF_UNDYING, 4, 1.0),
        new Cosmetico("dragon", "Aliento de dragón", "Dragon breath", "Sopro de dragão", Items.DRAGON_BREATH, 5, ParticleTypes.DRAGON_BREATH, 5, 0.3)
    );
    // nivel: 0 usuario, 1 vip, 2 vip+, 3 mvp, 4 mvp+, 5 staff (soporte en adelante)
    static final String[] NIVEL_NOMBRE = {"USUARIO", "VIP", "VIP+", "MVP", "MVP+", "STAFF"};

    static int nivel(ServerPlayer p) {
        if (p.hasPermissions(2)) return 5;
        var t = p.getTeam();
        if (t == null) return 0;
        String n = t.getName();
        if (n.endsWith("_vip")) return 1;
        if (n.endsWith("_vipplus")) return 2;
        if (n.endsWith("_mvp")) return 3;
        if (n.endsWith("_mvpplus")) return 4;
        if (n.endsWith("_usuario")) return 0;
        return 5;
    }
    static boolean esStaff(ServerPlayer p) {
        if (p.hasPermissions(2)) return true;
        var t = p.getTeam();
        if (t == null) return false;
        String n = t.getName();
        return n.endsWith("_owner") || n.endsWith("_coowner") || n.endsWith("_manager") || n.endsWith("_admin") || n.endsWith("_mod") || n.endsWith("_helper") || n.endsWith("_soporte");
    }

    static Datos datos(ServerPlayer p) {
        Datos d = DATOS.computeIfAbsent(p.getStringUUID(), k -> new Datos());
        d.nombre = p.getGameProfile().getName();
        return d;
    }
    static String idioma(ServerPlayer p) { String i = datos(p).idioma; return i == null ? "es" : i; }
    static String tr(ServerPlayer p, String es, String en, String pt) { return switch (idioma(p)) { case "en" -> en; case "pt" -> pt; default -> es; }; }
    static MutableComponent pre() { return Component.literal("[Quantum] ").withStyle(ChatFormatting.LIGHT_PURPLE, ChatFormatting.BOLD); }
    static void decir(ServerPlayer p, String es, String en, String pt) { p.sendSystemMessage(pre().append(Component.literal(tr(p, es, en, pt)).withStyle(s -> s.withColor(ChatFormatting.WHITE).withBold(false)))); }

    static Path archivo() { return FabricLoader.getInstance().getConfigDir().resolve("quantumnet").resolve("jugadores.json"); }
    static void cargar() {
        try {
            Path f = archivo();
            if (Files.exists(f)) try (Reader r = Files.newBufferedReader(f, StandardCharsets.UTF_8)) {
                Map<String, Datos> m = GSON.fromJson(r, new TypeToken<Map<String, Datos>>() {}.getType());
                if (m != null) DATOS = m;
            }
        } catch (Exception e) { e.printStackTrace(); }
    }
    static void guardar() {
        try {
            Path f = archivo();
            Files.createDirectories(f.getParent());
            try (Writer w = Files.newBufferedWriter(f, StandardCharsets.UTF_8)) { GSON.toJson(DATOS, w); }
        } catch (Exception e) { e.printStackTrace(); }
    }

    // ---------- menus de cofre
    static ItemStack icono(Item item, String nombre, ChatFormatting color, String... lore) {
        ItemStack s = new ItemStack(item);
        s.set(DataComponents.CUSTOM_NAME, Component.literal(nombre).withStyle(st -> st.withItalic(false).withColor(color).withBold(true)));
        List<Component> l = new ArrayList<>();
        for (String x : lore) l.add(Component.literal(x).withStyle(st -> st.withItalic(false).withColor(ChatFormatting.GRAY)));
        if (!l.isEmpty()) s.set(DataComponents.LORE, new ItemLore(l));
        return s;
    }
    static class Gui extends ChestMenu {
        final Map<Integer, BiConsumer<ServerPlayer, Integer>> acciones = new HashMap<>();
        Gui(MenuType<ChestMenu> tipo, int id, Inventory inv, SimpleContainer c, int filas) { super(tipo, id, inv, c, filas); }
        @Override public void clicked(int slot, int boton, ClickType tipo, Player jugador) {
            if (jugador instanceof ServerPlayer sp) {
                var a = acciones.get(slot);
                if (a != null) a.accept(sp, boton);
            }
        }
        @Override public ItemStack quickMoveStack(Player p, int i) { return ItemStack.EMPTY; }
        @Override public boolean stillValid(Player p) { return true; }
    }
    interface Relleno { void llenar(SimpleContainer c, Map<Integer, BiConsumer<ServerPlayer, Integer>> acciones); }
    static void abrir(ServerPlayer p, String titulo, int filas, Relleno r) {
        MenuType<ChestMenu> tipo = filas == 6 ? MenuType.GENERIC_9x6 : (filas == 3 ? MenuType.GENERIC_9x3 : MenuType.GENERIC_9x1);
        p.openMenu(new SimpleMenuProvider((id, inv, pl) -> {
            SimpleContainer c = new SimpleContainer(filas * 9);
            Gui g = new Gui(tipo, id, inv, c, filas);
            r.llenar(c, g.acciones);
            return g;
        }, Component.literal(titulo)));
    }

    // ---------- idioma
    static void aplicarIdioma(ServerPlayer p, String id) {
        datos(p).idioma = id;
        for (String t : List.of("qn_es", "qn_en", "qn_pt")) p.removeTag(t);
        p.addTag("qn_" + id);
        guardar();
        p.closeContainer();
        decir(p, "Idioma: Español. Cámbialo cuando quieras con /idioma.", "Language: English. Change it anytime with /language.", "Idioma: Português. Mude quando quiser com /idioma.");
    }
    static void menuIdioma(ServerPlayer p) {
        abrir(p, "Idioma · Language · Idioma", 1, (c, a) -> {
            c.setItem(2, icono(Items.YELLOW_BANNER, "Español", ChatFormatting.YELLOW, "Todo el servidor en español"));
            c.setItem(4, icono(Items.BLUE_BANNER, "English", ChatFormatting.AQUA, "The whole server in English"));
            c.setItem(6, icono(Items.GREEN_BANNER, "Português", ChatFormatting.GREEN, "Todo o servidor em português"));
            a.put(2, (pl, b) -> aplicarIdioma(pl, "es"));
            a.put(4, (pl, b) -> aplicarIdioma(pl, "en"));
            a.put(6, (pl, b) -> aplicarIdioma(pl, "pt"));
        });
    }

    // ---------- cosmeticos
    static void menuCosmeticos(ServerPlayer p) {
        int niv = nivel(p);
        String actual = datos(p).cosmetico;
        abrir(p, tr(p, "Cosméticos", "Cosmetics", "Cosméticos"), 3, (c, a) -> {
            int i = 0;
            for (Cosmetico k : COSMETICOS) {
                int slot = 1 + i + (i >= 7 ? 2 : 0) + (i >= 7 ? 0 : 0);
                slot = i < 7 ? 1 + i : 9 + 3 + (i - 7) * 2 - 2 + 9 - 9;
                slot = i < 7 ? 1 + i : 12 + (i - 7);
                boolean puede = niv >= k.nivel();
                boolean puesto = k.id().equals(actual);
                String nombre = tr(p, k.es(), k.en(), k.pt());
                String estado = puesto ? tr(p, "Equipado", "Equipped", "Equipado") : (puede ? tr(p, "Clic para equipar", "Click to equip", "Clique para equipar") : tr(p, "Requiere rango ", "Requires rank ", "Requer rank ") + NIVEL_NOMBRE[k.nivel()]);
                c.setItem(slot, icono(puede ? k.icono() : Items.GRAY_DYE, nombre, puede ? ChatFormatting.LIGHT_PURPLE : ChatFormatting.DARK_GRAY, estado));
                a.put(slot, (pl, b) -> {
                    if (nivel(pl) < k.nivel()) { decir(pl, "Ese cosmético es para rango " + NIVEL_NOMBRE[k.nivel()] + " o superior.", "That cosmetic needs rank " + NIVEL_NOMBRE[k.nivel()] + " or higher.", "Esse cosmético requer rank " + NIVEL_NOMBRE[k.nivel()] + " ou superior."); return; }
                    datos(pl).cosmetico = k.id(); guardar(); pl.closeContainer();
                    decir(pl, "Cosmético equipado: " + k.es(), "Cosmetic equipped: " + k.en(), "Cosmético equipado: " + k.pt());
                });
                i++;
            }
            c.setItem(22, icono(Items.BARRIER, tr(p, "Quitar cosmético", "Remove cosmetic", "Remover cosmético"), ChatFormatting.RED));
            a.put(22, (pl, b) -> { datos(pl).cosmetico = null; guardar(); pl.closeContainer(); });
        });
    }

    // ---------- staff
    static String ahora() { return new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()); }
    static void registrar(ServerPlayer staff, String uuid, String nombre, String tipo, long hasta) {
        Datos d = DATOS.computeIfAbsent(uuid, k -> new Datos());
        d.nombre = nombre;
        Sancion s = new Sancion(); s.tipo = tipo; s.staff = staff.getGameProfile().getName(); s.motivo = "Panel de staff"; s.fecha = ahora(); s.hasta = hasta;
        d.sanciones.add(s); guardar();
        for (ServerPlayer o : staff.server.getPlayerList().getPlayers())
            if (esStaff(o)) o.sendSystemMessage(Component.literal("[Staff] ").withStyle(ChatFormatting.RED, ChatFormatting.BOLD).append(Component.literal(s.staff + " → " + nombre + ": " + tipo).withStyle(st -> st.withColor(ChatFormatting.GRAY).withBold(false))));
    }
    static void menuStaff(ServerPlayer p) {
        abrir(p, "Panel de staff", 6, (c, a) -> {
            int i = 0;
            for (ServerPlayer o : p.server.getPlayerList().getPlayers()) {
                if (i >= 54) break;
                ItemStack h = icono(Items.PLAYER_HEAD, o.getGameProfile().getName(), ChatFormatting.YELLOW, "Sanciones: " + datos(o).sanciones.size(), "Clic para gestionar");
                h.set(DataComponents.PROFILE, new ResolvableProfile(o.getGameProfile()));
                c.setItem(i, h);
                final UUID id = o.getUUID();
                a.put(i, (pl, b) -> { ServerPlayer t = pl.server.getPlayerList().getPlayer(id); if (t != null) menuJugador(pl, t); else pl.closeContainer(); });
                i++;
            }
        });
    }
    static void menuJugador(ServerPlayer st, ServerPlayer t) {
        final UUID id = t.getUUID(); final String nombre = t.getGameProfile().getName(); final String uuid = t.getStringUUID();
        abrir(st, "Staff · " + nombre, 3, (c, a) -> {
            c.setItem(10, icono(Items.ENDER_PEARL, "Ir a su posición", ChatFormatting.AQUA));
            c.setItem(11, icono(Items.ICE, CONGELADOS.containsKey(id) ? "Descongelar" : "Congelar", ChatFormatting.AQUA, "No podrá moverse"));
            c.setItem(12, icono(Items.PAPER, "Silenciar 10 min", ChatFormatting.YELLOW));
            c.setItem(13, icono(Items.BOOK, "Silenciar 1 hora", ChatFormatting.YELLOW));
            c.setItem(14, icono(Items.LEATHER_BOOTS, "Expulsar", ChatFormatting.GOLD));
            c.setItem(15, icono(Items.IRON_BARS, "Banear 1 día", ChatFormatting.RED));
            c.setItem(16, icono(Items.BEDROCK, "Banear permanente", ChatFormatting.DARK_RED, "Solo admin o superior"));
            c.setItem(22, icono(Items.WRITABLE_BOOK, "Ver historial", ChatFormatting.LIGHT_PURPLE));
            c.setItem(26, icono(Items.ARROW, "Volver", ChatFormatting.GRAY));
            a.put(26, (pl, b) -> menuStaff(pl));
            a.put(10, (pl, b) -> { ServerPlayer x = pl.server.getPlayerList().getPlayer(id); if (x != null) pl.teleportTo(x.serverLevel(), x.getX(), x.getY(), x.getZ(), x.getYRot(), x.getXRot()); pl.closeContainer(); });
            a.put(11, (pl, b) -> { ServerPlayer x = pl.server.getPlayerList().getPlayer(id); if (x == null) return;
                if (CONGELADOS.remove(id) == null) { CONGELADOS.put(id, x.position()); registrar(pl, uuid, nombre, "congelado", 0); } else registrar(pl, uuid, nombre, "descongelado", 0);
                pl.closeContainer(); });
            a.put(12, (pl, b) -> silenciar(pl, uuid, nombre, 10));
            a.put(13, (pl, b) -> silenciar(pl, uuid, nombre, 60));
            a.put(14, (pl, b) -> { ServerPlayer x = pl.server.getPlayerList().getPlayer(id); if (x != null) x.connection.disconnect(Component.literal("Expulsado por el staff de Quantum Network")); registrar(pl, uuid, nombre, "expulsión", 0); pl.closeContainer(); });
            a.put(15, (pl, b) -> banear(pl, id, uuid, nombre, 1));
            a.put(16, (pl, b) -> { if (!pl.hasPermissions(2)) { pl.closeContainer(); return; } banear(pl, id, uuid, nombre, 0); });
            a.put(22, (pl, b) -> { pl.closeContainer(); Datos d = DATOS.get(uuid);
                pl.sendSystemMessage(Component.literal("Historial de " + nombre + ":").withStyle(ChatFormatting.LIGHT_PURPLE));
                if (d == null || d.sanciones.isEmpty()) pl.sendSystemMessage(Component.literal("  Sin sanciones").withStyle(ChatFormatting.GRAY));
                else for (Sancion s : d.sanciones) pl.sendSystemMessage(Component.literal("  " + s.fecha + " · " + s.tipo + " · por " + s.staff).withStyle(ChatFormatting.GRAY)); });
        });
    }
    static void silenciar(ServerPlayer st, String uuid, String nombre, int minutos) {
        Datos d = DATOS.computeIfAbsent(uuid, k -> new Datos());
        d.muteHasta = System.currentTimeMillis() + minutos * 60000L;
        registrar(st, uuid, nombre, "silencio " + minutos + " min", d.muteHasta); st.closeContainer();
    }
    static void banear(ServerPlayer st, UUID id, String uuid, String nombre, int dias) {
        ServerPlayer x = st.server.getPlayerList().getPlayer(id);
        Date hasta = dias > 0 ? new Date(System.currentTimeMillis() + dias * 86400000L) : null;
        if (x != null) {
            st.server.getPlayerList().getBans().add(new UserBanListEntry(x.getGameProfile(), new Date(), st.getGameProfile().getName(), hasta, "Sancionado por el staff de Quantum Network"));
            x.connection.disconnect(Component.literal("Has sido baneado de Quantum Network" + (dias > 0 ? " por " + dias + " día(s)" : "")));
        }
        registrar(st, uuid, nombre, dias > 0 ? "ban " + dias + " día(s)" : "ban permanente", hasta == null ? -1 : hasta.getTime()); st.closeContainer();
    }

    // ---------- bucle
    static void cadaTick(MinecraftServer server) {
        tick++;
        for (var e : CONGELADOS.entrySet()) {
            ServerPlayer p = server.getPlayerList().getPlayer(e.getKey());
            if (p != null && p.position().distanceToSqr(e.getValue()) > 0.04) p.teleportTo(p.serverLevel(), e.getValue().x, e.getValue().y, e.getValue().z, p.getYRot(), p.getXRot());
        }
        if (tick % 4 == 0) for (ServerPlayer p : server.getPlayerList().getPlayers()) {
            String id = datos(p).cosmetico;
            if (id == null || p.isSpectator() || p.isInvisible()) continue;
            for (Cosmetico k : COSMETICOS) if (k.id().equals(id)) {
                if (nivel(p) < k.nivel()) { datos(p).cosmetico = null; break; }
                p.serverLevel().sendParticles(k.p(), p.getX(), p.getY() + k.dy(), p.getZ(), k.n(), 0.25, 0.15, 0.25, 0.01);
                break;
            }
        }
        if (tick % 10 == 0) for (ServerLevel lvl : server.getAllLevels()) {
            if (!lvl.dimension().location().toString().equals(LOBBY)) continue;
            List<Entity> fuera = new ArrayList<>();
            for (Entity e : lvl.getAllEntities()) {
                ResourceLocation k = BuiltInRegistries.ENTITY_TYPE.getKey(e.getType());
                if (k.getNamespace().equals("cobblemon") && k.getPath().equals("pokemon")) fuera.add(e);
            }
            for (Entity e : fuera) {
                for (ServerPlayer p : lvl.players()) if (p.distanceToSqr(e) < 100) p.displayClientMessage(Component.literal(tr(p, "Aquí no se pueden usar Pokémon. Entra a Cobblemon desde el lobby.", "Pokémon can't be used here. Enter Cobblemon from the lobby.", "Não é possível usar Pokémon aqui. Entre no Cobblemon pelo lobby.")).withStyle(ChatFormatting.RED), true);
                e.discard();
            }
        }
        if (!PEDIR_IDIOMA.isEmpty()) {
            List<UUID> listos = new ArrayList<>();
            for (var e : PEDIR_IDIOMA.entrySet()) { e.setValue(e.getValue() - 1); if (e.getValue() <= 0) listos.add(e.getKey()); }
            for (UUID u : listos) { PEDIR_IDIOMA.remove(u); ServerPlayer p = server.getPlayerList().getPlayer(u); if (p != null && datos(p).idioma == null) menuIdioma(p); }
        }
    }

    @Override public void onInitialize() {
        ServerLifecycleEvents.SERVER_STARTED.register(s -> cargar());
        ServerLifecycleEvents.SERVER_STOPPING.register(s -> guardar());
        ServerTickEvents.END_SERVER_TICK.register(QuantumNet::cadaTick);
        ServerPlayConnectionEvents.JOIN.register((handler, sender, server) -> {
            ServerPlayer p = handler.getPlayer();
            Datos d = datos(p);
            if (d.idioma == null) PEDIR_IDIOMA.put(p.getUUID(), 100);
            else { for (String t : List.of("qn_es", "qn_en", "qn_pt")) p.removeTag(t); p.addTag("qn_" + d.idioma); }
        });
        ServerMessageEvents.ALLOW_CHAT_MESSAGE.register((mensaje, p, params) -> {
            Datos d = datos(p);
            if (d.muteHasta > System.currentTimeMillis()) {
                long min = (d.muteHasta - System.currentTimeMillis()) / 60000 + 1;
                decir(p, "Estás silenciado. Faltan " + min + " min.", "You are muted. " + min + " min left.", "Você está silenciado. Faltam " + min + " min.");
                return false;
            }
            return true;
        });
        CommandRegistrationCallback.EVENT.register((dispatcher, registro, entorno) -> {
            for (String n : List.of("idioma", "language", "lang"))
                dispatcher.register(Commands.literal(n).executes(c -> { menuIdioma(c.getSource().getPlayerOrException()); return 1; }));
            for (String n : List.of("cosmeticos", "cosmetics"))
                dispatcher.register(Commands.literal(n).executes(c -> { menuCosmeticos(c.getSource().getPlayerOrException()); return 1; }));
            dispatcher.register(Commands.literal("staff").executes(c -> {
                ServerPlayer p = c.getSource().getPlayerOrException();
                if (!esStaff(p)) { decir(p, "Este panel es solo para el staff.", "This panel is staff only.", "Este painel é só para a staff."); return 0; }
                menuStaff(p); return 1;
            }));
        });
    }
}
