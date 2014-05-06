package com.sls.system.service;

import com.core.page.entity.PageParameter;
import com.sls.user.service.DictService;
import com.sls.util.DictConstant;
import com.sls.user.entity.DictDefine;
import com.sls.user.entity.DictValues;
import edu.jostutor.spring.test.SpringTransactionalTestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import static org.junit.Assert.assertEquals;

/**
 * 字典单元测试
 *
 * @author chenl
 * @version 1.0.1
 */

@ContextConfiguration("/applicationContext-dev-test.xml")
public class DictServiceTest extends SpringTransactionalTestCase {
    @Autowired
    private DictService dictService;

    public PageParameter getPageParameter() {
        PageParameter pageParameter = new PageParameter();
        pageParameter.setPageSize(10);
        pageParameter.setPageNumber(0);
        pageParameter.setSortColumn("");
        pageParameter.setSortDirection("ASC");
        return pageParameter;
    }

    public DictDefine getDictDefine() {
        DictDefine dictDefine = new DictDefine();
        dictDefine.setDictName("dictName");
        dictDefine.setDictDescription("dictDescription");
        return dictDefine;
    }

    public DictValues getDictValues() {
        DictValues dictValues = new DictValues();
        dictValues.setDictName("dictName");
        dictValues.setDictCode(0);
        dictValues.setDictValue("dictValue");
        return dictValues;
    }

    @Test
    public void testDictDefine() throws Exception {
        DictDefine dictDefine = getDictDefine();
        dictService.addDictDefine(dictDefine);
        PageParameter pageParameter = getPageParameter();
        dictService.findDictDefinePageList(pageParameter, dictDefine);
        dictDefine.setOldDictName(dictDefine.getDictName());
        dictDefine.setDictName("newDefineName");
        assertEquals(true, dictService.checkRepeatDictDefineName(dictDefine.getDictName(), dictDefine.getOldDictName()));
        dictService.editDictDefine(dictDefine, dictDefine.getOldDictName());
        assertEquals(true, dictService.checkRepeatDictDefineName(dictDefine.getDictName(), dictDefine.getDictName()));
        assertEquals("newDefineName", dictService.findDictDefineByDictName(dictDefine.getDictName()).getDictName());
        DictValues dictValues = getDictValues();
        dictValues.setDictName("newDefineName");
        dictService.addDictValues(dictValues);
        dictService.delDictDefine(dictDefine.getDictName());
    }

    @Test
    public void testFindAllDictDefine() throws Exception {
        dictService.findAllDictDefine();
    }

    @Test
    public void testDictValues() throws Exception {
        DictValues dictValues = getDictValues();
        dictService.addDictValues(dictValues);
        PageParameter pageParameter = getPageParameter();
        dictService.findDictValuesPageList(pageParameter, dictValues);
        assertEquals("dictValue", dictService.findDictValuesByNameAndCode(dictValues).getDictValue());
        dictValues.setDictValue("dictValueNew");
        assertEquals(false, dictService.checkRepeatDictValuesCode(dictValues));
        dictService.editDictValues(dictValues);
        assertEquals("0", dictService.findDictValuesByNameAndValue(dictValues).getDictCode());
        dictService.delDictValues(dictValues);
    }

    @Test
    public void testFindAllDictValues() throws Exception {
        dictService.findAllDictValues();
    }

    @Test
    public void testChangeDictValues() throws Exception {
        DictDefine dictDefine = getDictDefine();
        dictService.addDictDefine(dictDefine);
        DictValues dictValues = getDictValues();
        dictService.addDictValues(dictValues);
        assertEquals("", dictService.changeDictCodeToValue(DictConstant.VOID_VALUE, "dictName"));
        assertEquals("dictValue", dictService.changeDictCodeToValue(0, "dictName"));
        assertEquals(DictConstant.VOID_VALUE, dictService.changeDictValueToCode("", "dictName"));
        assertEquals(DictConstant.VOID_VALUE, dictService.changeDictValueToCode(null, "dictName"));
        assertEquals(0, dictService.changeDictValueToCode("dictValue", "dictName"));
    }
}