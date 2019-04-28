package com.dji.importSDKDemo;

import io.flutter.plugin.common.PluginRegistry;

final class DroneViewPlugin {
    static void registerWith(PluginRegistry registry) {
        if (alreadyRegisteredWith(registry)) {
            return;
        }
    }

    private static boolean alreadyRegisteredWith(PluginRegistry registry) {
        final String key = DroneViewPlugin.class.getCanonicalName();
        if (registry.hasPlugin(key)) {
            return true;
        }
        PluginRegistry.Registrar registrar = registry.registrarFor(key);
        registrar.platformViewRegistry()
                .registerViewFactory(
                        "droneview", new DroneViewFactory(registrar));
        return false;
    }
}

