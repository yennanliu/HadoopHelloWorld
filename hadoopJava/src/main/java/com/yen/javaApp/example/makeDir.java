package com.yen.javaApp.example;

// https://www.youtube.com/watch?v=GjS7zIQq9Mc&list=PLmOn9nNkQxJEs3ixNOLlilPnNarGtywL9&index=57

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

import java.net.URI;

public class makeDir {
    public static void main(String[] args) throws Exception {

        System.out.println("app start");

        // init config
        Configuration conf = new Configuration();
        conf.set("fs.hdfs.impl",org.apache.hadoop.hdfs.DistributedFileSystem.class.getName());
        conf.set("fs.file.impl",org.apache.hadoop.fs.LocalFileSystem.class.getName());

        FileSystem fs = FileSystem.get(new URI("hdfs://localhost:9000"), conf);

        // mkdir
        fs.mkdirs(new Path("/myDevPath3"));

        fs.close();

        System.out.println("app end");
    }
}