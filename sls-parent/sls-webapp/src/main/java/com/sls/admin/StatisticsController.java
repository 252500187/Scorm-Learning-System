package com.sls.admin;

import com.core.autocomplete.service.AutoCompleteService;
import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.scorm.entity.Scorm;
import com.sls.scorm.service.StatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Transactional
@RequestMapping("/admin/statistics/")
public class StatisticsController {
    @Autowired
    private AutoCompleteService autoCompleteService;

    @Autowired
    private StatisticsService statisticsService;

    @RequestMapping(value = "listAllScormInfoDo", method = {RequestMethod.GET, RequestMethod.POST})
    public String listAllScormInfoDo(){
        return "scormadmin/statistics/listAllScormInfoDo";
    }

    @RequestMapping(value = "listAllScormInfo", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public Page<Scorm> listAllScormInfo(PageParameter pageParameter, Scorm scorm){
        return statisticsService.findScormPageList(pageParameter, scorm);
    }


}
