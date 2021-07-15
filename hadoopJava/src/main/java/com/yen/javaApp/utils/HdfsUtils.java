package com.yen.javaApp.utils;

import java.io.IOException;
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
