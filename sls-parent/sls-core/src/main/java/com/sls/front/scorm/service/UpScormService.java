package com.sls.front.scorm.service;

import org.xml.sax.SAXException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPathExpressionException;
import java.io.IOException;

public interface UpScormService {
    void upScorm(HttpServletRequest request, String upFile, String upImg) throws ServletException, IOException, ParserConfigurationException, SAXException,
            XPathExpressionException;
}
