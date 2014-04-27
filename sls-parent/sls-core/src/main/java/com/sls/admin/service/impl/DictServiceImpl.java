package com.sls.admin.service.impl;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.util.DictConstant;
import com.sls.admin.dao.DictDao;
import com.sls.admin.entity.DictDefine;
import com.sls.admin.entity.DictValues;
import com.sls.admin.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 字典service实现
 *
 * @author chenl
 * @version 1.0.1
 */
@Transactional
@Service("dictService")
public class DictServiceImpl implements DictService {

    @Autowired
    private DictDao dictDao;

    @Override
    public Page<DictDefine> findDictDefinePageList(PageParameter pageParameter, DictDefine dictDefine) {
        return dictDao.findDictDefinePageList(pageParameter, dictDefine);
    }

    @Override
    public void addDictDefine(DictDefine dictDefine) {
        dictDao.addDictDefine(dictDefine);
    }

    @Override
    public void editDictDefine(DictDefine dictDefine, String oldDictName) {
        dictDao.delDictDefine(oldDictName);
        dictDao.addDictDefine(dictDefine);
        dictDefine.setOldDictName(oldDictName);
        dictDao.changeDictNameOfDictValues(dictDefine);
    }

    @Override
    public void delDictDefine(String dictName) {
        dictDao.delDictDefine(dictName);
        List<DictValues> dictValuesList = dictDao.findDictValuesByDictName(dictName);
        //todo 字典定义有字典值校验不能删除
        for (DictValues dictValues : dictValuesList) {
            dictDao.delDictValues(dictValues);
        }
    }

    @Override
    public DictDefine findDictDefineByDictName(String dictName) {
        return dictDao.findDictDefineByDictName(dictName);
    }

    @Override
    public Boolean checkRepeatDictDefineName(String dictName, String oldDictName) {
        Boolean notHasRepeatName = dictDao.checkRepeatDictDefineName(dictName);
        Boolean notEquOldName = !(dictName.equals(oldDictName));
        return !(!notHasRepeatName && notEquOldName);
    }

    @Override
    public Page<DictValues> findDictValuesPageList(PageParameter pageParameter, DictValues dictValues) {
        return dictDao.findDictValuesPageList(pageParameter, dictValues);
    }

    @Override
    public void addDictValues(DictValues dictValues) {
        dictDao.addDictValues(dictValues);
    }

    @Override
    public void editDictValues(DictValues dictValues) {
        dictDao.editDictValues(dictValues);
    }

    @Override
    public void delDictValues(DictValues dictValues) {
        dictDao.delDictValues(dictValues);
    }

    @Override
    public DictValues findDictValuesByNameAndCode(DictValues dictValues) {
        return dictDao.findDictValuesByNameAndCode(dictValues);
    }

    @Override
    public DictValues findDictValuesByNameAndValue(DictValues dictValues) {
        return dictDao.findDictValuesByNameAndValue(dictValues);
    }

    @Override
    public Boolean checkRepeatDictValuesCode(DictValues dictValues) {
        return dictDao.checkRepeatDictValuesCode(dictValues);
    }

    @Override
    public List<DictDefine> findAllDictDefine() {
        return dictDao.findAllDictDefine();
    }

    @Override
    public List<DictValues> findAllDictValues() {
        return dictDao.findAllDictValues();
    }

    public String changeDictCodeToValue(int dictCode, String dictName) {
        if (dictCode == DictConstant.VOID_VALUE) {
            return "";
        }
        DictValues dictValues = new DictValues();
        dictValues.setDictName(dictName);
        dictValues.setDictCode(Integer.toString(dictCode));
        return dictDao.findDictValuesByNameAndCode(dictValues).getDictValue();
    }

    public int changeDictValueToCode(String dictValue, String dictName) {
        if ("".equals(dictValue) || dictValue == null) {
            return DictConstant.VOID_VALUE;
        }
        DictValues dictValues = new DictValues();
        dictValues.setDictName(dictName);
        dictValues.setDictValue(dictValue);
        return Integer.parseInt(dictDao.findDictValuesByNameAndValue(dictValues).getDictCode());
    }
}