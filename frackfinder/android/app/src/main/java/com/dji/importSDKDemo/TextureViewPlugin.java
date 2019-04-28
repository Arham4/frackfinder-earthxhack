package com.dji.importSDKDemo;

import io.flutter.plugin.common.PluginRegistry;

public final class TextureViewPlugin {
    public static void registerWith(PluginRegistry registry) {
        if (alreadyRegisteredWith(registry)) {
            return;
        }
    }

    private static boolean alreadyRegisteredWith(PluginRegistry registry) {
        final String key = TextureViewPlugin.class.getCanonicalName();
        if (registry.hasPlugin(key)) {
            return true;
        }
        PluginRegistry.Registrar registrar = registry.registrarFor(key);
        registrar.platformViewRegistry()
                .registerViewFactory(
                        "textureview", new TextureViewFactory(registrar));
        return false;
    }
}

