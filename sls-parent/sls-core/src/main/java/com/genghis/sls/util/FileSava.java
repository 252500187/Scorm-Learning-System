package com.genghis.sls.util;

import java.io.*;
import java.util.StringTokenizer;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import sun.net.TelnetInputStream;
import sun.net.TelnetOutputStream;
import sun.net.ftp.FtpClient;

public class FileSava {

    public void uploadFile(InputStream input, String remoteFile) {
        try {
            //将远程文件加入输出流中
            FileOutputStream os = new FileOutputStream(remoteFile);
            //创建一个缓冲区
            byte[] bytes = new byte[1024];
            int c;
            while ((c = input.read(bytes)) != -1) {
                os.write(bytes, 0, c);
            }
            System.out.println("upload success");
            os.close();
            input.close();
        } catch (IOException ex) {
            System.out.println("not upload");
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    public static InputStream getInputStream(MultipartHttpServletRequest request, String photoId) throws IOException {
        MultipartFile file = request.getFile(photoId);
        return file.getInputStream();
    }
}