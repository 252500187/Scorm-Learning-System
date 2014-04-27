package com.sls.system.dao;

import com.core.page.entity.PageParameter;
import com.sls.admin.dao.DictDao;
import com.sls.admin.entity.DictDefine;
import com.sls.admin.entity.DictValues;
import edu.jostutor.spring.test.SpringTransactionalTestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import static org.junit.Assert.assertEquals;

/**
 * @author chenl
 * @version 1.0.1
 */
@ContextConfiguration("/applicationContext-dev-test.xml")
public class DictDaoTest extends SpringTransactionalTestCase {

    @Autowired
    private DictDao dictDao;

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
        dictDefine.setOldDictName("oldDefineName");
        dictDefine.setDictDescription("defineDescription");
        return dictDefine;
    }

    public DictValues getDictValues() {
        DictValues dictValues = new DictValues();
        dictValues.setDictName("dictName");
        dictValues.setDictCode("0");
        dictValues.setDictValue("dictValue");
        return dictValues;
    }

    @Test
    public void testDictDefine() throws Exception {
        DictDefine dictDefine = getDictDefine();
        dictDao.addDictDefine(dictDefine);
        assertEquals(false, dictDao.checkRepeatDictDefineName(dictDefine.getDictName()));
        assertEquals("dictName", dictDao.findDictDefineByDictName(dictDefine.getDictName()).getDictName());
        PageParameter pageParameter = getPageParameter();
        dictDao.findDictDefinePageList(pageParameter, dictDefine);
        dictDefine.setDictName(null);
        dictDao.findDictDefinePageList(pageParameter, dictDefine);
        dictDefine.setDictName("");
        dictDao.findDictDefinePageList(pageParameter, dictDefine);
        dictDefine.setDictDescription(null);
        dictDao.findDictDefinePageList(pageParameter, dictDefine);
        dictDefine.setDictDescription("");
        dictDao.findDictDefinePageList(pageParameter, dictDefine);
        dictDao.findAllDictDefine();
        dictDao.delDictDefine(dictDefine.getDictName());
    }

    @Test
    public void testDictValues() throws Exception {
        DictValues dictValues = getDictValues();
        dictDao.addDictValues(dictValues);
        PageParameter pageParameter = getPageParameter();
        dictDao.findDictValuesPageList(pageParameter, dictValues);
        dictValues.setDictValue("");
        dictDao.findDictValuesPageList(pageParameter, dictValues);
        dictValues.setDictValue(null);
        dictDao.findDictValuesPageList(pageParameter, dictValues);
        assertEquals("dictValue", dictDao.findDictValuesByNameAndCode(dictValues).getDictValue());
        dictValues.setDictValue("dictValueNew");
        assertEquals(false, dictDao.checkRepeatDictValuesCode(dictValues));
        dictDao.editDictValues(dictValues);
        assertEquals("0", dictDao.findDictValuesByNameAndValue(dictValues).getDictCode());
        dictDao.delDictValues(dictValues);
        dictDao.findAllDictValues();
    }

    @Test
    public void testFindDictValuesByDictName() throws Exception {
        DictDefine dictDefine = getDictDefine();
        dictDao.addDictDefine(dictDefine);
        DictValues dictValues = getDictValues();
        dictDao.addDictValues(dictValues);
        assertEquals("0", dictDao.findDictValuesByDictName(dictDefine.getDictName()).get(0).getDictCode());
        dictDefine.setOldDictName(dictDefine.getDictName());
        dictDefine.setDictName("newDictName");
        dictDao.changeDictNameOfDictValues(dictDefine);
        assertEquals("newDictName", dictDao.findDictValuesByDictName(dictDefine.getDictName()).get(0).getDictName());
    }
}


