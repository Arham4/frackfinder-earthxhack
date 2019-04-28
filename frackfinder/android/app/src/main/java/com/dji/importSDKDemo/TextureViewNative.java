package com.dji.importSDKDemo;

import android.content.Context;
import android.view.TextureView;
import android.view.View;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.platform.PlatformView;

public class TextureViewNative implements PlatformView, MethodChannel.MethodCallHandler {

    private final Context context;
    private final PluginRegistry.Registrar registrar;
    private final MethodChannel channel;
    private final TextureView textureView;

    TextureViewNative(Context context, PluginRegistry.Registrar registrar) {
        this.context = context;
        this.registrar = registrar;
        textureView = getTextureView(registrar);

        channel = new MethodChannel(registrar.messenger(), "textureview");
        channel.setMethodCallHandler(this);
    }

    private TextureView getTextureView(PluginRegistry.Registrar registrar) {
        TextureView textureView = new TextureView(registrar.context());
        textureView.setSurfaceTextureListener(new SurfaceTextureListener(context));
        return textureView;
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {

    }

    @Override
    public View getView() {
        return textureView;
    }

    @Override
    public void dispose() {

    }
}
