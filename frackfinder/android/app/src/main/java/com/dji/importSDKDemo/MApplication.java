package com.dji.importSDKDemo;

import android.content.Context;
import android.widget.Toast;

import com.secneo.sdk.Helper;
import io.flutter.app.FlutterApplication;

public class MApplication extends FlutterApplication {

    @Override
    protected void attachBaseContext(Context paramContext) {
        super.attachBaseContext(paramContext);
        Helper.install(MApplication.this);
    }

}