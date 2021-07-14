package com.yen.javaApp;

// https://www.youtube.com/watch?v=GjS7zIQq9Mc&list=PLmOn9nNkQxJEs3ixNOLlilPnNarGtywL9&index=56

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

import java.io.IOException;
import java.net.URI;

public class HadoopClient1 {
    public static void main(String[] args) throws Exception {

        System.out.println("app start");

        // init config
        Configuration conf = new Configuration();
        conf.set("fs.hdfs.impl",org.apache.hadoop.hdfs.DistributedFileSystem.class.getName());
        conf.set("fs.file.impl",org.apache.hadoop.fs.LocalFileSystem.class.getName());

        FileSystem fs = FileSystem.get(new URI("hdfs://localhost:9000"), conf);

        System.out.println("list files : ");
        // https://stackoverflow.com/questions/33807394/list-folder-and-files-of-hdfs-using-java/33807711
        FileStatus[] fileStatus = fs.listStatus(new Path("/"));
        for(FileStatus status : fileStatus){
            System.out.println(status.getPath().toString());
        }

        System.out.println("create a path in HDFS: ");
        try {fs.mkdirs(new Path("/myDevPath2"));} catch (Exception e){
            System.out.println("create path start ...");
            e.printStackTrace();
            System.out.println("create path end ...");
            throw new Exception(e);
        }

        fs.close();

        System.out.println("app end");
    }
}
