package com.genghis.sls.util;

import java.io.*;
import java.util.Enumeration;
import java.util.StringTokenizer;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import com.genghis.sls.constant.DictConstant;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import sun.net.TelnetInputStream;
import sun.net.TelnetOutputStream;
import sun.net.ftp.FtpClient;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

public class FileUp {

    public void uploadFile(InputStream input, String filePath, String fileName) {
        try {
            //将远程文件加入输出流中
            FileOutputStream os = new FileOutputStream(filePath + fileName);
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

    public InputStream getInputStream(MultipartHttpServletRequest request, String photoId) throws IOException {
        MultipartFile file = request.getFile(photoId);
        return file.getInputStream();
    }

    public String[] upScorm(HttpServletRequest request, String scormPath, String upFile, String img) throws ServletException, IOException {
        String path = request.getSession().getServletContext().getRealPath("/" + DictConstant.TOP_SCORM_FILE_NAME + "/");
        String scormImgPath = path + "/" + scormPath + "/";
        String scormFilePath = path + "/" + scormPath + "/" + DictConstant.SCORM_FILE_NAME + "/";
        //创建文件，防文件夹不存在
        File file = new File(scormFilePath);
        file.mkdirs();
        //接受页面流文件
        InputStream input = getInputStream((MultipartHttpServletRequest) request, upFile);
        uploadFile(input, scormFilePath, DictConstant.SCORM_NAME);
        input = getInputStream((MultipartHttpServletRequest) request, img);
        uploadFile(input, scormImgPath, DictConstant.SCORM_IMG);
        //返回路径 0文件路径 1图片引用路径
        String scormFile[] = {"", ""};
        scormFile[0] = scormImgPath + DictConstant.SCORM_IMG;
        scormFile[0] = scormFile[0].substring(scormFile[0].indexOf(DictConstant.SCORM_FILE_NAME));
        scormFile[1] = scormFilePath;
        unzip(scormFile[1] + DictConstant.SCORM_NAME);
        return scormFile;
    }

    public void unzip(String fileName) {
        try {
            String filePath = fileName.substring(0, fileName.lastIndexOf("/") + 1);
            ZipFile zipFile = new ZipFile(fileName);
            Enumeration emu = zipFile.entries();
            while (emu.hasMoreElements()) {
                ZipEntry entry = (ZipEntry) emu.nextElement();
                if (entry.isDirectory()) {
                    new File(filePath + entry.getName()).mkdirs();
                    continue;
                }
                BufferedInputStream bis = new BufferedInputStream(zipFile.getInputStream(entry));
                File file = new File(filePath + entry.getName());
                File parent = file.getParentFile();
                if (parent != null && (!parent.exists())) {
                    parent.mkdirs();
                }
                FileOutputStream fos = new FileOutputStream(file);
                BufferedOutputStream bos = new BufferedOutputStream(fos);
                int count;
                byte data[] = new byte[1024];
                while ((count = bis.read(data, 0, 1024)) != -1) {
                    bos.write(data, 0, count);
                }
                bos.flush();
                bos.close();
                bis.close();
            }
            zipFile.close();
        } catch (Exception e) {

        }
    }

}