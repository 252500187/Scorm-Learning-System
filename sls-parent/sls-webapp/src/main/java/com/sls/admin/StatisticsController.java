package com.sls.admin;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Transactional
@RequestMapping("/admin/statistics/")
public class StatisticsController {
    @RequestMapping(value = "listAllScormInfoDo", method = {RequestMethod.GET})
    public String listAllScormInfoDo(){
        return "scormadmin/statistics/listAllScormInfoDo";
    }


}
