package com.dji.importSDKDemo;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.SurfaceTexture;
import android.os.Environment;
import android.util.Log;
import android.view.TextureView;
import android.widget.Toast;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import dji.common.camera.SystemState;
import dji.common.product.Model;
import dji.sdk.base.BaseProduct;
import dji.sdk.camera.Camera;
import dji.sdk.camera.VideoFeeder;
import dji.sdk.codec.DJICodecManager;

public class SurfaceTextureListener implements TextureView.SurfaceTextureListener {
    private static final String TAG = SurfaceTextureListener.class.getName();

    private final Context context;
    private DJICodecManager mCodecManager = null;
    private VideoFeeder.VideoDataListener mReceivedVideoDataListener;
    private long[] counter = {0};

    SurfaceTextureListener(Context context) {
        this.context = context;
        init();
    }

    private void init() {
        mReceivedVideoDataListener = new VideoFeeder.VideoDataListener() {
            @Override
            public void onReceive(byte[] videoBuffer, int size) {
                if (mCodecManager != null) {
                    mCodecManager.sendDataToDecoder(videoBuffer, size);
                }
            }
        };

        Camera camera = MApplication.getCameraInstance();

        if (camera != null) {
            camera.setSystemStateCallback(new SystemState.Callback() {
                @Override
                public void onUpdate(SystemState cameraSystemState) {
                }
            });
        }

        BaseProduct product = MApplication.getProductInstance();

        if (!product.getModel().equals(Model.UNKNOWN_AIRCRAFT)) {
            VideoFeeder.getInstance().getPrimaryVideoFeed().addVideoDataListener(mReceivedVideoDataListener);
        }
    }

    private void saveScreenshot(String name, Bitmap bitmap) {
//        saveImage(mVideoSurface.getBitmap());
        saveImage(bitmap, name);
//        Toast.makeText(context, saveImage(bitmap).getAbsolutePath(), Toast.LENGTH_LONG).show();
    }

    private void saveImage(Bitmap screenshot, String name) {
        FileOutputStream fileOutputStream;
        File path = new File(Environment.getExternalStorageDirectory(), "Pictures");
//        String uniqueID = UUID.randomUUID().toString();
        File file = new File(path, name + ".jpg");
        if (file.exists()) {
            Toast.makeText(context, "The file exists.", Toast.LENGTH_LONG).show();
            return;
        }
        try {
            fileOutputStream = new FileOutputStream(file);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return;
        }
        screenshot.compress(Bitmap.CompressFormat.JPEG, 30, fileOutputStream);
        try {
            fileOutputStream.flush();
            fileOutputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void onSurfaceTextureAvailable(SurfaceTexture surface, int width, int height) {
        Log.e(TAG, "onSurfaceTextureAvailable");
        if (mCodecManager == null) {
            mCodecManager = new DJICodecManager(context, surface, width, height);
        }
    }

    @Override
    public void onSurfaceTextureSizeChanged(SurfaceTexture surface, int width, int height) {
        Log.e(TAG, "onSurfaceTextureSizeChanged");
    }

    @Override
    public boolean onSurfaceTextureDestroyed(SurfaceTexture surface) {
        Log.e(TAG, "onSurfaceTextureDestroyed");
        if (mCodecManager != null) {
            mCodecManager.cleanSurface();
            mCodecManager = null;
        }
        return false;
    }

    @Override
    public void onSurfaceTextureUpdated(SurfaceTexture surface) {
    }
}
