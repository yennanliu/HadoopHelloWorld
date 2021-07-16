package com.yen.javaApp.utils;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.URI;
import java.net.URISyntaxException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.*;

public class HdfsUtils {

    // attr
    private Configuration config = null;
    private FileSystem fs = null;
    private String uriString = null;

    // constructor
    public HdfsUtils(){

    }

    public HdfsUtils(Configuration config, String uriString) throws URISyntaxException, IOException {
        this.config = config;
        this.uriString = uriString;
        this.fs = FileSystem.get(new URI(this.uriString), config);
    }

    // method

    // https://stackoverflow.com/questions/16000840/write-a-file-in-hdfs-with-java
    // https://www.edureka.co/community/22410/how-to-write-a-file-in-hdfs-with-java
    public void writeFile(String content, String filePath) throws IOException {
        Path _filePath = new Path(filePath);
        if (! this.fs.exists(_filePath)){
            System.out.println("file already exist, will delete : " + filePath);
            fs.delete(_filePath, true);
        }

        //BufferedWriter br = new BufferedWriter( new OutputStreamWriter( os, "UTF-8" ) );
        FSDataOutputStream fsDataOutputStream = this.fs.create(_filePath,true);
        BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(fsDataOutputStream,"UTF-8"));

        try {
            bufferedWriter.write(content);
            bufferedWriter.newLine();
            System.out.println("write file OK");
        } catch (Exception e){
            System.out.println("write file failed");
        } finally {
            bufferedWriter.close();
        }
        //this.fs.close();
    }

    public Boolean makeDir(String dirPath) throws IOException {
        try {
            this.fs.mkdirs(new Path(dirPath));
            return true;
        } catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public void listFile(String dirPath) throws IOException {
        // https://stackoverflow.com/questions/33807394/list-folder-and-files-of-hdfs-using-java/33807711
        FileStatus[] fileStatus = this.fs.listStatus(new Path(dirPath));
        for(FileStatus status : fileStatus){
            System.out.println(status.getPath().toString());
        }
    }
}
