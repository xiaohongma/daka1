package com.example.sunbaiwan9527.myapplication;

import java.io.IOException;
import java.util.Map;

public class JHead {

    public static synchronized native Map<String, String> getImageInfo(
            String filename) throws IOException;

    public static synchronized native byte[] getThumbnail(String filename)
            throws IOException;

    public static synchronized native String getVersion()
            throws IOException;

    static {
        System.loadLibrary("jhead");
    }
}