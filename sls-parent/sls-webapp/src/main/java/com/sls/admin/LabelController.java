package com.sls.admin;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.system.entity.Label;
import com.sls.system.service.LabelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin/label/")
public class LabelController {
    @Autowired
    LabelService labelService;

    @RequestMapping(value = "listAllLabelTreeDo", method = RequestMethod.GET)
    public String listAllLabelTreeDo(HttpServletRequest request) {
        return "scormadmin/label/listAllLabelTreeDo";
    }

    @RequestMapping(value = "listAllLabel", method = RequestMethod.POST)
    @ResponseBody
    public Page<Label> listAllLabel(PageParameter pageParameter, Label label) {
        return labelService.getAllLabelPageList(pageParameter, label);
    }
}
