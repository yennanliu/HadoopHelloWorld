package com.yen.javaApp.dev;

import com.yen.javaApp.utils.HdfsUtils;
import org.apache.hadoop.conf.Configuration;

import java.io.IOException;
import java.net.URISyntaxException;

public class TestHdfsUtils {
    public static void main(String[] args) throws IOException, URISyntaxException {
        // run

        // init config
        Configuration conf = new Configuration();
        conf.set("fs.hdfs.impl",org.apache.hadoop.hdfs.DistributedFileSystem.class.getName());
        conf.set("fs.file.impl",org.apache.hadoop.fs.LocalFileSystem.class.getName());

        String uriString = "hdfs://localhost:9000";

        HdfsUtils hdfsUtils = new HdfsUtils(conf, uriString);

        System.out.println("hdfsUtils = " + hdfsUtils.toString());

        // mkdir 
        Boolean makeDir_result =  hdfsUtils.makeDir("/TestHdfsUtils1");
        System.out.println("makeDir_result = " + makeDir_result);
    }
}
