#include <jni.h>
#include <iostream>
#include <vector>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <android/log.h>
#include "ezsift.h"
//#include "test.h"

#ifndef JNIEXPORT
#define JNIEXPORT
#endif

#ifndef JNICALL
#define JNICALL
#endif

#define  LOG_TAG    "ezsift"
#define  LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG,LOG_TAG,__VA_ARGS__)
#define  LOGI(...)  __android_log_print(ANDROID_LOG_INFO,LOG_TAG,__VA_ARGS__)
#define  LOGW(...)  __android_log_print(ANDROID_LOG_WARN,LOG_TAG,__VA_ARGS__)
#define  LOGE(...)  __android_log_print(ANDROID_LOG_ERROR,LOG_TAG,__VA_ARGS__)

extern "C"{

    void myReplace(const char*oldstr, char*newstr);
	void test(JNIEnv* env, jobject thiz,jstring infile ){
		 const char* file;
		file = env->GetStringUTFChars(infile, false);
		//char *file = "sdcard/Atest/kermit001.pgm";
		 if(file == NULL) {
		        //return NULL; /* OutOfMemoryError already thrown */
		        LOGI("Invaliad file!\n");
		    }

		ImageObj<unsigned char> image;	
		if(read_pgm(file, image.data, image.w, image.h)!=0)
		{
			LOGI("Failed to open input image!\n");
			return;
		}
		LOGI("image size: %d x %d\n", image.w, image.h);

		bool bExtractDescriptor = true;
		std::list<SiftKeypoint> kpt_list;

		// Double the original image as the first octive.
		double_original_image(true);

		// Perform SIFT computation on CPU.
		LOGI("Start SIFT detection ...\n");
		sift_cpu(image, kpt_list, bExtractDescriptor);

		// Generate output image with keypoints drawing
		//char filename[255];
		//sprintf(filename, "%s_psift_output.ppm", file);
		//draw_keypoints_to_ppm_file(filename, image, kpt_list);

		// Generate keypoints list
		char origin_outfile[255];
		myReplace(file,origin_outfile);
		export_kpt_list_to_file(origin_outfile, kpt_list, bExtractDescriptor);
		/*sprintf(origin_outfile, "%s_key", file);
		export_kpt_list_to_file(origin_outfile, kpt_list, bExtractDescriptor);
		char outfile[255];
		myReplace(file,outfile);
		format_transform(origin_outfile,outfile);*/

		LOGI("\n");
		LOGI("Total keypoints number: \t\t %d\n", kpt_list.size());
	}

	void Java_com_example_sunbaiwan9527_myapplication_Reconstraction_sift(JNIEnv* env, jobject thiz,jstring infile )
	{
		test(env,thiz,infile);
	}
	void myReplace(const char*oldstr, char*newstr)
	{
		int len = strlen(oldstr);
		memcpy(newstr,oldstr,len+1);
		newstr[len - 1] = 'y';
		newstr[len - 2] = 'e';
		newstr[len - 3] = 'k';
	}
}
