package com.sls.scorm.service;

import com.sls.scorm.entity.Scorm;
import org.xml.sax.SAXException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPathExpressionException;
import java.io.IOException;

public interface ScormService {
    void upScorm(HttpServletRequest request, String upFile, String upImg, Scorm scorm) throws ServletException, IOException, ParserConfigurationException, SAXException,
            XPathExpressionException;
}
