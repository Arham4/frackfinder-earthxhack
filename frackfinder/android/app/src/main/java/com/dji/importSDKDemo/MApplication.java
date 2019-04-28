package com.dji.importSDKDemo;

import android.content.Context;

import com.secneo.sdk.Helper;

import dji.sdk.base.BaseProduct;
import dji.sdk.camera.Camera;
import dji.sdk.sdkmanager.DJISDKManager;
import io.flutter.app.FlutterApplication;

public class MApplication extends FlutterApplication {

    private static BaseProduct baseProduct;

    @Override
    protected void attachBaseContext(Context paramContext) {
        super.attachBaseContext(paramContext);
        Helper.install(MApplication.this);
    }

    public static synchronized Camera getCameraInstance() {
        if (getProductInstance() == null) {
            return null;
        }
        return getProductInstance().getCamera();
    }

    public static synchronized BaseProduct getProductInstance() {
        if (baseProduct == null) {
            baseProduct = DJISDKManager.getInstance().getProduct();
        }
        return baseProduct;
    }
}