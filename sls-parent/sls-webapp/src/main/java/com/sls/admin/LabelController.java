package com.sls.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin/label/")
public class LabelController {

    @RequestMapping(value = "listAllLabelTreeDo", method = RequestMethod.GET)
    public String listAllLabelTreeDo(HttpServletRequest request) {
        return "scormadmin/label/listAllLabelTreeDo";
    }

    @RequestMapping(value = "listAllLabelDo", method = RequestMethod.GET)
    @ResponseBody
    public void listAllLabelDo(HttpServletRequest request) {
//        tagService.getAllLabel(request);
    }
}
