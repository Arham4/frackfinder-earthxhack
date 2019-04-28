package com.dji.importSDKDemo;

import android.content.Context;

import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class TextureViewFactory extends PlatformViewFactory {

    private final PluginRegistry.Registrar mPluginRegistrar;

    public TextureViewFactory(PluginRegistry.Registrar registrar) {
        super(StandardMessageCodec.INSTANCE);
        mPluginRegistrar = registrar;
    }

    @Override
    public PlatformView create(Context context, int i, Object o) {
        return new TextureViewNative(context, mPluginRegistrar);
    }

}