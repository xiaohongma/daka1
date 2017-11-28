LOCAL_PATH := $(call my-dir)
export MAINDIR:= $(LOCAL_PATH)

include $(CLEAR_VARS)
include $(MAINDIR)/clapack/Android.mk
LOCAL_PATH := $(MAINDIR)

include $(CLEAR_VARS)
LOCAL_MODULE := blas
LOCAL_SRC_FILES := libblas.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := blas_nowrap
LOCAL_SRC_FILES := libblas_nowrap.a
include $(PREBUILT_STATIC_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE:= clapack
LOCAL_STATIC_LIBRARIES := tmglib clapack1 clapack2 clapack3 blas f2c
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_C_INCLUDES)
LOCAL_EXPORT_LDLIBS := $(LOCAL_LDLIBS)
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := cminpack
LOCAL_MODULE_FILENAME := libcminpack
LOCAL_CFLAGS := -O2 -fPIC -w
LOCAL_SRC_FILES := \
./cminpack/chkder.c ./cminpack/enorm.c ./cminpack/hybrd1.c ./cminpack/hybrj.c \
./cminpack/lmdif1.c ./cminpack/lmstr1.c ./cminpack/qrfac.c ./cminpack/r1updt.c \
./cminpack/dogleg.c ./cminpack/fdjac1.c ./cminpack/hybrd.c ./cminpack/lmder1.c \
./cminpack/lmdif.c ./cminpack/lmstr.c ./cminpack/qrsolv.c ./cminpack/rwupdt.c \
./cminpack/dpmpar.c ./cminpack/fdjac2.c ./cminpack/hybrj1.c ./cminpack/lmder.c \
./cminpack/lmpar.c ./cminpack/qform.c ./cminpack/r1mpyq.c
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := cblas
LOCAL_MODULE_FILENAME := libcblas
LOCAL_CFLAGS := -O3 -fPIC -w -DADD_
LOCAL_SRC_FILES := \
./cblas/src/cblas_srotg.c ./cblas/src/cblas_srotmg.c ./cblas/src/cblas_srot.c ./cblas/src/cblas_srotm.c \
./cblas/src/cblas_sswap.c ./cblas/src/cblas_sscal.c ./cblas/src/cblas_scopy.c ./cblas/src/cblas_saxpy.c \
./cblas/src/cblas_sdot.c ./cblas/src/cblas_sdsdot.c ./cblas/src/cblas_snrm2.c ./cblas/src/cblas_sasum.c \
./cblas/src/cblas_isamax.c \
./cblas/src/cblas_drotg.c ./cblas/src/cblas_drotmg.c ./cblas/src/cblas_drot.c ./cblas/src/cblas_drotm.c \
./cblas/src/cblas_dswap.c ./cblas/src/cblas_dscal.c  ./cblas/src/cblas_dcopy.c ./cblas/src/cblas_daxpy.c \
./cblas/src/cblas_ddot.c  ./cblas/src/cblas_dsdot.c ./cblas/src/cblas_dnrm2.c ./cblas/src/cblas_dasum.c \
./cblas/src/cblas_idamax.c \
./cblas/src/cblas_cswap.c ./cblas/src/cblas_cscal.c ./cblas/src/cblas_csscal.c ./cblas/src/cblas_ccopy.c \
./cblas/src/cblas_caxpy.c ./cblas/src/cblas_cdotu_sub.c ./cblas/src/cblas_cdotc_sub.c \
./cblas/src/cblas_icamax.c \
./cblas/src/cblas_zswap.c ./cblas/src/cblas_zscal.c ./cblas/src/cblas_zdscal.c ./cblas/src/cblas_zcopy.c \
./cblas/src/cblas_zaxpy.c ./cblas/src/cblas_zdotu_sub.c ./cblas/src/cblas_zdotc_sub.c ./cblas/src/cblas_dznrm2.c \
./cblas/src/cblas_dzasum.c ./cblas/src/cblas_izamax.c \
./cblas/src/cblas_scasum.c ./cblas/src/cblas_scnrm2.c \
./cblas/src/cblas_sgemv.c ./cblas/src/cblas_sgbmv.c ./cblas/src/cblas_sger.c ./cblas/src/cblas_ssbmv.c ./cblas/src/cblas_sspmv.c \
./cblas/src/cblas_sspr.c ./cblas/src/cblas_sspr2.c ./cblas/src/cblas_ssymv.c ./cblas/src/cblas_ssyr.c ./cblas/src/cblas_ssyr2.c \
./cblas/src/cblas_stbmv.c ./cblas/src/cblas_stbsv.c ./cblas/src/cblas_stpmv.c ./cblas/src/cblas_stpsv.c ./cblas/src/cblas_strmv.c \
./cblas/src/cblas_strsv.c \
./cblas/src/cblas_dgemv.c ./cblas/src/cblas_dgbmv.c ./cblas/src/cblas_dger.c ./cblas/src/cblas_dsbmv.c ./cblas/src/cblas_dspmv.c \
./cblas/src/cblas_dspr.c ./cblas/src/cblas_dspr2.c ./cblas/src/cblas_dsymv.c ./cblas/src/cblas_dsyr.c ./cblas/src/cblas_dsyr2.c \
./cblas/src/cblas_dtbmv.c ./cblas/src/cblas_dtbsv.c ./cblas/src/cblas_dtpmv.c ./cblas/src/cblas_dtpsv.c ./cblas/src/cblas_dtrmv.c \
./cblas/src/cblas_dtrsv.c \
./cblas/src/cblas_cgemv.c ./cblas/src/cblas_cgbmv.c ./cblas/src/cblas_chemv.c ./cblas/src/cblas_chbmv.c ./cblas/src/cblas_chpmv.c \
./cblas/src/cblas_ctrmv.c ./cblas/src/cblas_ctbmv.c ./cblas/src/cblas_ctpmv.c ./cblas/src/cblas_ctrsv.c ./cblas/src/cblas_ctbsv.c \
./cblas/src/cblas_ctpsv.c ./cblas/src/cblas_cgeru.c ./cblas/src/cblas_cgerc.c ./cblas/src/cblas_cher.c ./cblas/src/cblas_cher2.c \
./cblas/src/cblas_chpr.c ./cblas/src/cblas_chpr2.c \
./cblas/src/cblas_zgemv.c ./cblas/src/cblas_zgbmv.c ./cblas/src/cblas_zhemv.c ./cblas/src/cblas_zhbmv.c ./cblas/src/cblas_zhpmv.c \
./cblas/src/cblas_ztrmv.c ./cblas/src/cblas_ztbmv.c ./cblas/src/cblas_ztpmv.c ./cblas/src/cblas_ztrsv.c ./cblas/src/cblas_ztbsv.c \
./cblas/src/cblas_ztpsv.c ./cblas/src/cblas_zgeru.c ./cblas/src/cblas_zgerc.c ./cblas/src/cblas_zher.c ./cblas/src/cblas_zher2.c \
./cblas/src/cblas_zhpr.c ./cblas/src/cblas_zhpr2.c \
./cblas/src/cblas_sgemm.c ./cblas/src/cblas_ssymm.c ./cblas/src/cblas_ssyrk.c ./cblas/src/cblas_ssyr2k.c ./cblas/src/cblas_strmm.c \
./cblas/src/cblas_strsm.c \
./cblas/src/cblas_dgemm.c ./cblas/src/cblas_dsymm.c ./cblas/src/cblas_dsyrk.c ./cblas/src/cblas_dsyr2k.c ./cblas/src/cblas_dtrmm.c \
./cblas/src/cblas_dtrsm.c \
./cblas/src/cblas_cgemm.c ./cblas/src/cblas_csymm.c ./cblas/src/cblas_chemm.c ./cblas/src/cblas_cherk.c \
./cblas/src/cblas_cher2k.c ./cblas/src/cblas_ctrmm.c ./cblas/src/cblas_ctrsm.c ./cblas/src/cblas_csyrk.c \
./cblas/src/cblas_csyr2k.c \
./cblas/src/cblas_zgemm.c ./cblas/src/cblas_zsymm.c ./cblas/src/cblas_zhemm.c ./cblas/src/cblas_zherk.c \
./cblas/src/cblas_zher2k.c ./cblas/src/cblas_ztrmm.c ./cblas/src/cblas_ztrsm.c ./cblas/src/cblas_zsyrk.c \
./cblas/src/cblas_zsyr2k.c ./cblas/src/cblas_xerbla.c ./cblas/src/xerbla.c ./cblas/src/cblas_globals.c
LOCAL_STATIC_LIBRARIES := blas_nowrap
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := matrix
LOCAL_MODULE_FILENAME := libmatrix
LOCAL_CFLAGS := -O2 -fPIC -w -D__NO_MKL__
LOCAL_SRC_FILES := ./matrix/matrix.c ./matrix/svd.c ./matrix/vector.c
LOCAL_C_INCLUDES := $(LOCAL_PATH)/imagelib $(LOCAL_PATH)/include
LOCAL_STATIC_LIBRARIES := clapack cminpack cblas
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := image
LOCAL_MODULE_FILENAME := libimage
LOCAL_CFLAGS := -O2 -fPIC -w
LOCAL_SRC_FILES := ./imagelib/affine.c ./imagelib/bmp.c ./imagelib/canny.c ./imagelib/color.c \
                   ./imagelib/fileio.c ./imagelib/filter.c ./imagelib/fit.c \
                   ./imagelib/fmatrix.c ./imagelib/homography.c ./imagelib/horn.c \
                   ./imagelib/image.c ./imagelib/lerp.c ./imagelib/morphology.c \
                   ./imagelib/pgm.c	./imagelib/poly.c ./imagelib/qsort.c ./imagelib/resample.c \
                   ./imagelib/tps.c ./imagelib/transform.c ./imagelib/triangle.c ./imagelib/triangulate.c \
                   ./imagelib/util.c				   
LOCAL_STATIC_LIBRARIES := matrix
LOCAL_C_INCLUDES := $(LOCAL_PATH)/matrix
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := 5point
LOCAL_MODULE_FILENAME := lib5point
LOCAL_CFLAGS := -O2 -fPIC -w
LOCAL_SRC_FILES := ./5point/5point.c ./5point/poly1.c ./5point/poly3.c
LOCAL_STATIC_LIBRARIES := matrix image
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include $(LOCAL_PATH)/matrix $(LOCAL_PATH)/imagelib
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := sba
LOCAL_MODULE_FILENAME := libsba
LOCAL_CFLAGS := -O2 -fPIC -w
LOCAL_SRC_FILES := ./sba-1.5/sba_chkjac.c ./sba-1.5/sba_crsm.c ./sba-1.5/sba_lapack.c \
                   ./sba-1.5/sba_levmar.c ./sba-1.5/sba_levmar_wrap.c
LOCAL_STATIC_LIBRARIES := matrix
LOCAL_C_INCLUDES := $(LOCAL_PATH)/matrix
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := sfmdriver
LOCAL_MODULE_FILENAME := libsfmdriver
LOCAL_CFLAGS := -O2 -fPIC -w
LOCAL_SRC_FILES := ./sfm-driver/sfm.c
LOCAL_STATIC_LIBRARIES := matrix image sba
LOCAL_C_INCLUDES := $(LOCAL_PATH)/sba-1.5 $(LOCAL_PATH)/matrix $(LOCAL_PATH)/imagelib
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := ann
LOCAL_MODULE_FILENAME := ann
LOCAL_CFLAGS := -O2 -fPIC -w
LOCAL_SRC_FILES := ./ann_1.1_char/src/ANN.cpp ./ann_1.1_char/src/brute.cpp \
    ./ann_1.1_char/src/kd_tree.cpp ./ann_1.1_char/src/kd_util.cpp \
	./ann_1.1_char/src/kd_split.cpp ./ann_1.1_char/src/kd_dump.cpp \
	./ann_1.1_char/src/kd_search.cpp ./ann_1.1_char/src/kd_pr_search.cpp \
	./ann_1.1_char/src/kd_fix_rad_search.cpp ./ann_1.1_char/src/bd_tree.cpp \
	./ann_1.1_char/src/bd_search.cpp ./ann_1.1_char/src/bd_pr_search.cpp \
	./ann_1.1_char/src/bd_fix_rad_search.cpp ./ann_1.1_char/src/perf.cpp
LOCAL_C_INCLUDES := $(LOCAL_PATH)/ann_1.1_char/include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := jpeg
LOCAL_SRC_FILES := libjpeg.a
include $(PREBUILT_STATIC_LIBRARY)



###############################bundler###################################

include $(CLEAR_VARS)
LOCAL_MODULE    := bundler
LOCAL_CFLAGS := -O2 -fPIC -w -D__NO_UI__ -D__BUNDLER__ -D__BUNDLER_DISTR__
LOCAL_SRC_FILES := ./bundler/BaseApp.cpp ./bundler/BundlerApp.cpp ./bundler/keys.cpp \
                   ./bundler/Register.cpp ./bundler/Epipolar.cpp ./bundler/Bundle.cpp \
				   ./bundler/BundleFast.cpp ./bundler/MatchTracks.cpp ./bundler/Camera.cpp \
				   ./bundler/Geometry.cpp ./bundler/ImageData.cpp ./bundler/SifterUtil.cpp \
				   ./bundler/BaseGeometry.cpp ./bundler/BundlerGeometry.cpp \
				   ./bundler/BoundingBox.cpp ./bundler/BundleAdd.cpp ./bundler/ComputeTracks.cpp \
				   ./bundler/BruteForceSearch.cpp ./bundler/BundleIO.cpp ./bundler/ProcessBundle.cpp \
				   ./bundler/BundleTwo.cpp ./bundler/Decompose.cpp ./bundler/RelativePose.cpp \
				   ./bundler/Distortion.cpp ./bundler/TwoFrameModel.cpp ./bundler/LoadJPEG.cpp \
				   bundler.cpp
				   
                   #./bundler/Bundle2PMVS.cpp \
				   #./bundler/Bundle2Vis.cpp \
				   #./bundler/BundlerYaba.cpp \
				   #./bundler/CreateMatchScript.cpp \
				   #./bundler/KeyMatch.cpp \
				   #./bundler/KeyMatchFull.cpp \
				   #./bundler/keys2a.cpp \
				   #./bundler/RadialUndistort.cpp
				   
LOCAL_STATIC_LIBRARIES := matrix image sfmdriver ann sba 5point jpeg clapack cminpack cblas
LOCAL_C_INCLUDES := $(LOCAL_PATH)/sba-1.5 $(LOCAL_PATH)/matrix $(LOCAL_PATH)/imagelib \
                    $(LOCAL_PATH)/5point $(LOCAL_PATH)/ann_1.1_char/include $(LOCAL_PATH)/sfm-driver \
					$(LOCAL_PATH)/include
LOCAL_LDLIBS += -llog -ldl -lz
include $(BUILD_SHARED_LIBRARY)


##############################KeyMatchFull#########################################
include $(CLEAR_VARS)
LOCAL_MODULE := match
LOCAL_SRC_FILES := ./bundler/KeyMatchFull.cpp ./bundler/keys2a.cpp match.cpp
LOCAL_STATIC_LIBRARIES := ann
LOCAL_LDLIBS := -llog -lz
LOCAL_C_INCLUDES += $(LOCAL_PATH)/sba-1.5 $(LOCAL_PATH)/matrix $(LOCAL_PATH)/imagelib \
                    $(LOCAL_PATH)/5point $(LOCAL_PATH)/ann_1.1_char/include $(LOCAL_PATH)/sfm-driver \
                    $(LOCAL_PATH)/include
include $(BUILD_SHARED_LIBRARY)


################################Undistort###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := undistort
LOCAL_SRC_FILES := ./bundler/LoadJPEG.cpp ./bundler/RadialUndistort.cpp undistort.cpp
LOCAL_CFLAGS := -O2 -fPIC -w -D__NO_UI__ -D__BUNDLER__ -D__BUNDLER_DISTR__
LOCAL_STATIC_LIBRARIES =  matrix image sfmdriver ann sba 5point jpeg clapack cminpack cblas
LOCAL_LDLIBS +=  -lz -llog -lm -lc
LOCAL_C_INCLUDES += $(LOCAL_PATH)/sba-1.5 $(LOCAL_PATH)/matrix $(LOCAL_PATH)/imagelib \
                    $(LOCAL_PATH)/5point $(LOCAL_PATH)/ann_1.1_char/include $(LOCAL_PATH)/sfm-driver \
                    $(LOCAL_PATH)/include
#LOCAL_EXPORT_C_INCLUDES := $(PROJECT_ROOT)/export
include $(BUILD_SHARED_LIBRARY)
#############################bundle2vis#############################################
##LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := bundler2vis
LOCAL_SRC_FILES := ./bundler/Bundle2Vis.cpp bundler2vis.cpp
LOCAL_LDLIBS := -llog -lz
#LD = arm-none-eabi-g++
LOCAL_CFLAGS += -D__NO_UI__ -D__BUNDLER__ -D__BUNDLER_DISTR__ -g
LOCAL_C_INCLUDES += $(LOCAL_PATH)/sba-1.5 $(LOCAL_PATH)/matrix $(LOCAL_PATH)/imagelib \
                    $(LOCAL_PATH)/5point $(LOCAL_PATH)/ann_1.1_char/include $(LOCAL_PATH)/sfm-driver \
                    $(LOCAL_PATH)/include
##LOCAL_EXPORT_C_INCLUDES := $(PROJECT_ROOT)/export
include $(BUILD_SHARED_LIBRARY)
###############################bundle2pmvs##########################################
##LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := bundler2pmvs
LOCAL_SRC_FILES := ./bundler/Bundle2PMVS.cpp ./bundler/LoadJPEG.cpp bundler2pmvs.cpp
LOCAL_CFLAGS := -O2 -fPIC -w  -g
LOCAL_LDLIBS += -lz -llog -ldl
LOCAL_STATIC_LIBRARIES =  matrix image sfmdriver ann sba 5point jpeg clapack cminpack cblas
LOCAL_C_INCLUDES += $(LOCAL_PATH)/sba-1.5 $(LOCAL_PATH)/matrix $(LOCAL_PATH)/imagelib \
                    $(LOCAL_PATH)/5point $(LOCAL_PATH)/ann_1.1_char/include $(LOCAL_PATH)/sfm-driver \
                    $(LOCAL_PATH)/include
##LOCAL_EXPORT_C_INCLUDES := $(PROJECT_ROOT)/export
include $(BUILD_SHARED_LIBRARY)





