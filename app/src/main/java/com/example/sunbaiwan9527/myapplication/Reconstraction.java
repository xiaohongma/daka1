package com.example.sunbaiwan9527.myapplication;

import android.util.Log;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.List;
import java.util.Map;

/**
 * Created by sunbaiwan9527 on 16-10-5.
 */

public class Reconstraction {

    private static final String TAG = "visualsfm";

    private static final boolean SIFT_ON = true;
    private static final boolean MATCHER_ON = true;
    private static final boolean BUNDLER_ON = true;

    // IO file and format conversion
    private static final boolean BUNDLER2PMVS_ON = true;
    private static final boolean RADIALUNDISTORT_ON = true;
    private static final boolean BUNDLER2VIS_ON = true;

    private static final boolean PMVS_CMVS_ON = true;
    static {
        System.loadLibrary("sift");
        System.loadLibrary("match");
        System.loadLibrary("bundler");
        System.loadLibrary("bundler2pmvs");
        System.loadLibrary("undistort");
        System.loadLibrary("bundler2vis");
        System.loadLibrary("cmvs");
        System.loadLibrary("genOption");
        System.loadLibrary("pmvs2");
    }
    private native void sift(String inpath);
    private native void match(String list_key,String match_init_out);
    private native void bundler(String list_image,String options_txt);
    private native void bundle2pmvs(String list_path,String bundle_read,String out_path);
    private native void radialundistort(String list_path,String bundle_read,String out_path);
    private native void bundle2vis(String bunde_path,String vis_out_path);
    private native void cmvs(String pmvs_path,String max_image,String CPU_number);
    private native void genOption(String pmvs_path);
    private native void pmvs(String pmvs_path,String name);

    private String dir;
    private static Reconstraction reconstraction;

    private Reconstraction(String dir){
        this.dir =dir;
    }
    public static  Reconstraction newInstance(String dir) {
        if(reconstraction==null){
            reconstraction = new Reconstraction(dir);
        }

       // Reconstraction instance = new Reconstraction(dir);
        return reconstraction;
    }

    public void runSift(){
        if(SIFT_ON) {
            Log.i(TAG, "sift start");
            try {
                Util.scanDir(dir, "jpg", dir + "/list_tmp.txt");
                FileInputStream fis = new FileInputStream(dir + "/list_tmp.txt");
                BufferedReader br = new BufferedReader(new InputStreamReader(fis));

                FileOutputStream fos = new FileOutputStream(dir + "/list.txt");
                BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(fos));
                String line = null;
                while ((line = br.readLine()) != null) {
                    String jpg = line.trim();
                    String pgm = Util.jpg2pgm(jpg);
                    sift(pgm);
                   // Map<String,String> map = JHead.getImageInfo(jpg);
                    //String info = jhead(jpg);
                    String focal = 660.80306+"";
                    //String focal = Util.extractInfo(info);
                    bw.write(jpg + " 0 " + focal + "\n");
                }
                br.close();
                bw.close();
                fis.close();
                fos.close();
                Util.scanDir(dir, "key", dir + "/list_keys.txt");
                fis = new FileInputStream(dir + "/list_keys.txt");
                br = new BufferedReader(new InputStreamReader(fis));
                line = null;
                while ((line = br.readLine()) != null) {
                    String key = line.trim();
                    Util.gzipFile(key, key + ".gz");
                }
                br.close();
                fis.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            Log.i(TAG, "sift end");
        }
    }


    public void runbundler(){
        // Matcher - feature matching
        if(MATCHER_ON) {
            Log.d(TAG, "match start");
            match(dir + "/list_keys.txt", dir + "/matches.init.txt");
            Log.d(TAG, "match end");
        }
        // Bundler - bundle adjustment
        // bug : exit abruptly (memory limit?)
        if (BUNDLER_ON) {
            Log.d(TAG, "bundler start");
            Util.mkdir(dir + "/bundle");
            Util.mkdir(dir + "/prepare");
            Util.createOption(dir + "/options.txt",dir);
            bundler(dir+"/list.txt",dir+"/options.txt");//bundler
            Log.d(TAG, "bundler end");
        }

        // Bundler2PMVS
        if(BUNDLER2PMVS_ON) {
            Util.mkdir(dir + "/pmvs");
            Log.d(TAG, "bundle2pmvs start");
            bundle2pmvs(dir + "/list.txt", dir + "/bundle/bundle.out",dir+"/pmvs");
            Log.d(TAG, "bundle2pmvs end");
        }

        if(RADIALUNDISTORT_ON) {
            Log.d(TAG, "radiaundistort start");
            radialundistort(dir + "/list.txt", dir + "/bundle/bundle.out",dir+"/pmvs");
        }
        Log.d(TAG, "radiaundistort end");
        if(BUNDLER2VIS_ON)  {
            Log.d(TAG, "bundle2vis start");
            Util.mkdir(dir + "/pmvs/txt");
            Util.mkdir(dir + "/pmvs/visualize");
            Util.mkdir(dir + "/pmvs/models");


            List<String> jpgList =Util.ReadListFile(dir+"/pmvs/pre_pmvs.list");
            int count =0;
            for(String jpg:jpgList){
                Util.mv(jpg, dir + "/pmvs/visualize/"+String.format("%08d.jpg", count));
                count = count+1;
            }
            File directory = new File(dir + "/pmvs");
            File[] files = directory.listFiles();
            for (File file : files) {
                if (file.getName().length() == 12 && file.getName().contains(".txt")) {
                    Util.mv(file.getAbsolutePath(), dir + "/pmvs/txt/" + file.getName());

                }
            }
            // bug : memory limit
            bundle2vis(dir + "/pmvs/bundle.rd.out", dir + "/pmvs/vis.dat");
            Log.d(TAG, "bundle2vis end");
        }

    }


    public void runPmvsCmvs() {
        if (PMVS_CMVS_ON) {
            Log.d(TAG, "pmvs-cmvs start");
            cmvs(dir + "/pmvs/", "100", "8");
            genOption(dir + "/pmvs/");
            for (int i = 0; i < 1; i++) {
                String name = String.format("option-%04d", i);
                String path = dir + "/pmvs/" + name;
                pmvs(dir + "/pmvs/", name);
            }
            Log.d(TAG, "pmvs-cmvs end");
        }

    }


    public void getVolume(){

    }
    public void congradulations(){
        Log.i(TAG,"Well Done,Sun! You Have do a greate Job!");
    }
}
