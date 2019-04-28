package com.dji.importSDKDemo;

import android.content.Context;
import android.widget.Toast;

import com.secneo.sdk.Helper;

import dji.sdk.base.BaseProduct;
import dji.sdk.camera.Camera;
import dji.sdk.products.Aircraft;
import dji.sdk.products.HandHeld;
import dji.sdk.sdkmanager.DJISDKManager;
import io.flutter.app.FlutterApplication;

public class MApplication extends FlutterApplication {

    private static BaseProduct mProduct;

    @Override
    protected void attachBaseContext(Context paramContext) {
        super.attachBaseContext(paramContext);
        Helper.install(MApplication.this);
    }

    public static synchronized Camera getCameraInstance() {

        if (getProductInstance() == null) return null;

        Camera camera = null;

        if (getProductInstance() instanceof Aircraft){
            camera = getProductInstance().getCamera();
        } else if (getProductInstance() instanceof HandHeld) {
            camera = getProductInstance().getCamera();
        }

        return camera;
    }

    public static synchronized BaseProduct getProductInstance() {
        if (null == mProduct) {
            mProduct = DJISDKManager.getInstance().getProduct();
        }
        return mProduct;
    }
}