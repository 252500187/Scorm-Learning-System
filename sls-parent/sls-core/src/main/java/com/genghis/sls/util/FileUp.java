package com.genghis.sls.util;

import java.io.*;
import java.util.Enumeration;
import java.util.LinkedList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import com.genghis.sls.constant.DictConstant;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import sun.net.TelnetInputStream;
import sun.net.TelnetOutputStream;
import sun.net.ftp.FtpClient;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.*;

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
        //返回路径 0图片引用路径 1文件路径
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

    public List<XmalInfo> analyzeXml(String url) throws ParserConfigurationException, SAXException, IOException, XPathExpressionException {
        //得到一个Xpath对象
        XPathFactory factory = XPathFactory.newInstance();
        XPath xpath = factory.newXPath();
        XPathExpression expression = xpath.compile("/manifest/organizations/organization");
        //得到一个输入对象
        DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder = builderFactory.newDocumentBuilder();
        Document document = documentBuilder.parse(new File(url));
        NodeList nodeChapterList = (NodeList) expression.evaluate(document, XPathConstants.NODESET);
        //获得课件章路径
        List<XmalInfo> xmalInfos = new LinkedList<XmalInfo>();
        xmalInfos.add(new XmalInfo(0,"1","scorm","scorm","0",""));
        for (int i = 0; i < nodeChapterList.getLength(); i++) {
            XmalInfo xmalInfo = new XmalInfo();
            Element element = (Element) nodeChapterList.item(i);
            xmalInfo.setXmalId(element.getAttribute("identifier"));
            NodeList nodeList = element.getElementsByTagName("title");
            xmalInfo.setTitle(nodeList.item(0).getTextContent());
            xmalInfo.setType(element.getTagName());
            xmalInfo.setParentId("1");
            xmalInfo.setUrl("");
            xmalInfos.add(xmalInfo);
            //获得课件节路径
            getElement(element, xmalInfos, url, document);
        }
        return xmalInfos;
    }


    private void getElement(Element element, List<XmalInfo> xmalInfos, String url, Document document) throws ParserConfigurationException, SAXException, IOException, XPathExpressionException {
        NodeList nodes = element.getChildNodes();
        String scoPath=url.substring(url.indexOf(DictConstant.TOP_SCORM_FILE_NAME));
        scoPath=scoPath.substring(0,scoPath.indexOf(DictConstant.IMSMANIFEST));
        for (int i = 0; i < nodes.getLength(); i++) {
            String b = nodes.item(i).getNodeName();
            if (nodes.item(i).getNodeName().equals("item")) {
                getElement((Element) nodes.item(i), xmalInfos, url, document);
                Element element1 = (Element) nodes.item(i);
                XmalInfo xmalInfo = new XmalInfo();
                NodeList nodeList = element1.getElementsByTagName("title");
                xmalInfo.setTitle(nodeList.item(0).getTextContent());
                xmalInfo.setType(element1.getTagName());
                xmalInfo.setParentId(element.getAttribute("identifier"));
                xmalInfo.setXmalId(element1.getAttribute("identifier"));
                xmalInfo.setUrl(scoPath+ getUrl(element1.getAttribute("identifierref"), document));
                xmalInfos.add(xmalInfo);
            }
        }
    }


//    private void getElement(Element element, List<XmalInfo> xmalInfos, String url, Document document) throws ParserConfigurationException, SAXException, IOException, XPathExpressionException {
//        NodeList nodes = element.getElementsByTagName("item");
//        if (element.hasAttribute("item")) {
//            for (int i = 0; i < nodes.getLength(); i++) {
//                getElement((Element)nodes.item(i), xmalInfos, url, document);
//            }
//        } else {
//            for (int i = 0; i < nodes.getLength(); i++) {
//                Element element1 = (Element) nodes.item(i);
//                XmalInfo xmalInfo = new XmalInfo();
//                NodeList nodeList = element1.getElementsByTagName("title");
//                xmalInfo.setTitle(nodeList.item(0).getTextContent());
//                xmalInfo.setType(element1.getTagName());
//                xmalInfo.setParentId(element.getAttribute("identifier"));
//                xmalInfo.setXmalId(element1.getAttribute("identifier"));
//                xmalInfo.setUrl(url.substring(url.length() - 15) + getUrl(element1.getAttribute("identifierref"), document));
//                xmalInfos.add(xmalInfo);
//            }
//        }
//    }

    //获取路径
    private String getUrl(String identifier, Document document) throws ParserConfigurationException, SAXException, IOException, XPathExpressionException {
        //得到一个Xpath对象
        XPathFactory factory = XPathFactory.newInstance();
        XPath xpath = factory.newXPath();
        XPathExpression expression = xpath.compile("/manifest/resources/resource[@identifier='" + identifier + "']");
        //得到一个输入对象
        Element element = (Element) expression.evaluate(document, XPathConstants.NODE);
        //获取路径
        return element.getAttribute("href");
    }

}