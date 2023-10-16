/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 *
 * @author pankaj-13162
 */
public class ProfilePicHelper {

    public static boolean deleteFile(String path) {
        boolean deleted = false;
        try {
            //create new file
            File file = new File(path);
            deleted = file.delete();
        } catch (Exception e) {

        }
        return deleted;
    }

    public static boolean saveFile(InputStream is, String path) {
        boolean saved = false;
        try {
            //read data from inputstream
            byte[] buffer = new byte[is.available()];
            is.read(buffer);

            try ( //Write new file
                    FileOutputStream fos = new FileOutputStream(path)) {
                fos.write(buffer);
                fos.flush();
                fos.close();
            }
            saved = true;

        } catch (IOException e) {

        }
        return saved;
    }
}
