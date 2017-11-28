/*
 * Copyright (C) 2009 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
#include <string.h>
#include <jni.h>
#include <android/log.h>
#include "bundle2vis.h"
//#include "bundle2pmvs.h"
//#include "RadialUndistort.h"

/* This is a trivial JNI example where we use a native method
 * to return a new VM String. See  the corresponding Java source
 * file located at:
 *
 *   apps/samples/hello-jni/project/src/com/example/hellojni/HelloJni.java
 */
#ifndef JNIEXPORT
#define JNIEXPORT
#endif
#ifndef JNICALL
#define JNICALL
#endif
#define  LOG_TAG    "com.example.finalsift"
#define  LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG,LOG_TAG,__VA_ARGS__)
#define  LOGI(...)  __android_log_print(ANDROID_LOG_INFO,LOG_TAG,__VA_ARGS__)
#define  LOGW(...)  __android_log_print(ANDROID_LOG_WARN,LOG_TAG,__VA_ARGS__)
#define  LOGE(...)  __android_log_print(ANDROID_LOG_ERROR,LOG_TAG,__VA_ARGS__)
extern "C"{

void Java_com_example_sunbaiwan9527_myapplication_Reconstraction_bundle2vis
        (JNIEnv* env, jobject thiz, jstring bundle_read, jstring vis_out){
    const char* infile;
    const char* outfile;
    infile = env->GetStringUTFChars(bundle_read, false);
    outfile = env->GetStringUTFChars(vis_out, false);
    char* infile2 = new char[strlen(infile)+1];
    char* outfile2 =new char[strlen(outfile)+1];
    strcpy(infile2,infile);
    strcpy(outfile2,outfile);
    int argc = 3;
    char **argv = new char*[argc];
    argv[0] = "Bundle2Vis";
    argv[1] =infile2;//dir/bundle.out
    argv[2] = outfile2;//dir/vis_out
    bundle2vis(argc,argv);
    LOGI("Bundle2Vis SuCCESS");

}
}
