package com.sls.admin;

import com.sls.system.service.DictService;
import com.sls.system.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin/label/")
public class LabelController {

    @Autowired
    TagService tagService;

    @Autowired
    DictService dictService;

    @RequestMapping(value = "listAllLabelTreeDo", method = RequestMethod.GET)
    public String listAllLabelTreeDo(HttpServletRequest request) {
        return "scormadmin/label/listAllLabelTreeDo";
    }
}
