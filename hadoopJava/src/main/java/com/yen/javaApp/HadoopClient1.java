package com.yen.javaApp;

// https://www.youtube.com/watch?v=GjS7zIQq9Mc&list=PLmOn9nNkQxJEs3ixNOLlilPnNarGtywL9&index=56

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

import java.io.IOException;

public class HadoopClient1 {
    public static void main(String[] args) throws IOException {

        System.out.println("app start");

        // init config
        Configuration conf = new Configuration();

        // get the
        FileSystem fs = FileSystem.get(conf );

        // create a path in HDFS
        fs.mkdirs(new Path("/myDevPath"));

        // close the resource
        fs.close();

        System.out.println("app end");
    }
}
