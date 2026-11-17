package net.quantum.net.mixin;

import com.mojang.blaze3d.platform.Window;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.ModifyVariable;

/** El título de la ventana siempre es el de la network, lo cambie quien lo cambie. */
@Mixin(Window.class)
public class TituloVentanaMixin {
    @ModifyVariable(method = "setTitle", at = @At("HEAD"), argsOnly = true)
    private String quantum$titulo(String titulo) {
        return "Quantum Network";
    }
}
