package com.sls.admin;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.scorm.entity.Scorm;
import com.sls.scorm.service.ScormService;
import com.sls.util.DictConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@Transactional
@RequestMapping("/admin/scorm/")
public class ScormManageController {
    @Autowired
    private ScormService scormService;

    @RequestMapping(value = "listNotAuditScormInfoDo", method = {RequestMethod.GET})
    public String listAllScormInfoDo() {
        return "scormadmin/scorm/listNotAuditScormInfoDo";
    }

    @RequestMapping(value = "listNotAuditScormInfo", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public Page<Scorm> listNotAuditScormInfo(PageParameter pageParameter, Scorm scorm) {
        return scormService.listNotAuditScormPageList(pageParameter, scorm);
    }

    @RequestMapping(value = "listAuditScormInfoDo", method = {RequestMethod.GET})
    public String listAuditScormInfoDo() {
        return "scormadmin/scorm/listAuditScormInfoDo";
    }

    @RequestMapping(value = "listAuditScormInfo", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public Page<Scorm> listAuditScormInfo(PageParameter pageParameter, Scorm scorm) {
        return scormService.listAuditScormPageList(pageParameter, scorm);
    }

    @RequestMapping(value = "scormInfo", method = {RequestMethod.GET})
    public String scormInfo(HttpServletRequest request, @RequestParam("scormId") String scormId) {
        scormService.checkScormInfo(request, Integer.parseInt(scormId));
        return "scormadmin/scorm/scormInfo";
    }

    @RequestMapping(value = "approveScorm", method = {RequestMethod.POST})
    @ResponseBody
    public void approveScorm(@RequestParam("scormId") String scormId) {
        scormService.changeScormInUse(Integer.parseInt(scormId), DictConstant.IN_USE);
    }

    @RequestMapping(value = "forbiddenScorm", method = {RequestMethod.POST})
    @ResponseBody
    public void forbiddenScorm(@RequestParam("scormId") String scormId) {
        scormService.changeScormInUse(Integer.parseInt(scormId), DictConstant.NO_USE);
    }

    @RequestMapping(value = "changScormRecommend", method = {RequestMethod.POST})
    @ResponseBody
    public String[] changScormRecommend(@RequestParam("scormId") String scormId, @RequestParam("level") String level) {
        String str[] = {scormService.changeScormRecommend(Integer.parseInt(scormId), Integer.parseInt(level))};
        return str;
    }
}
