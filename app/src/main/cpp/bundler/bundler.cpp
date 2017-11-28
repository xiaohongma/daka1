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
#include "bundler.h"

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
#define  LOG_TAG    "com.example.sunbaiwan9527.myapplication"
#define  LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG,LOG_TAG,__VA_ARGS__)
#define  LOGI(...)  __android_log_print(ANDROID_LOG_INFO,LOG_TAG,__VA_ARGS__)
#define  LOGW(...)  __android_log_print(ANDROID_LOG_WARN,LOG_TAG,__VA_ARGS__)
#define  LOGE(...)  __android_log_print(ANDROID_LOG_ERROR,LOG_TAG,__VA_ARGS__)
extern "C"{
     void Java_com_example_sunbaiwan9527_myapplication_Reconstraction_bundler
  (JNIEnv* env, jobject thiz, jstring in_key_list, jstring option_txt){
	const char* infile;
         const char* outfile;
	 infile = env->GetStringUTFChars(in_key_list, false);
	 outfile = env->GetStringUTFChars(option_txt, false);
	 char* infile2 = new char[strlen(infile)+1];
	 char* outfile2 =new char[strlen(outfile)+1];
	 strcpy(infile2,infile);
	 strcpy(outfile2,outfile);


    // memcpy(infile2,infile,strlen(infile)+1);
     //memcpy(outfile2,outfile,strlen(outfile)+1);
	 //int argc = 3;
    //char *argv2[] ={"bundler","/storage/sdcard1/Atest/kermit/list.txt","--options_file""/storage/sdcard1/Atest/kermit/options.txt"};
	// char *argv2[] ={"bundler",infile2,outfile2};
	/* char **argv = new char* [4];
	 	argv[0] = "bundler";
	 	argv[1] =infile2 ;
	 	argv[2] = "--options_file";
	 	argv[3] = outfile2;*/
	// LOGI(LOG_TAG"input  %s %d ",infile2,4);
	 //LOGI(LOG_TAG"input  %s %d ",outfile2,argc);
	    int argc = 4;
	 	char **argv = new char*[argc];
	 	argv[0] = "Bundler";///storage/sdcard1
	 	argv[1] =infile2 ;
	 	//argv[1] = "/mnt/sdcard/Atest/kermit/list.txt";
	 	argv[2] = "--options_file";
	 	argv[3] = outfile2;
	 	//argv[3] = "/mnt/sdcard/Atest/kermit/options.txt";


	 bundler(argc,argv);
	// int i = match(infile2,outfile2);
	// LOGI(LOG_TAG"input  %s %d ",outfile2,argc);
	 LOGI("jpeg SuCCESS");
	// return env->NewStringUTF(env,infile);
	//return  env->NewStringUTF(infile);
	//return (*(*env)).NewStringUTF(env,"fuck the world");

  }
}
