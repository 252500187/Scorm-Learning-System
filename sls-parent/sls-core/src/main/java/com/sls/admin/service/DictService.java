package com.sls.admin.service;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.admin.entity.DictDefine;
import com.sls.admin.entity.DictValues;

import java.util.List;

/**
 * 字典service接口
 *
 * @author chenl
 * @version 1.0.1
 */

public interface DictService {

    Page<DictDefine> findDictDefinePageList(PageParameter pageParameter, DictDefine dictDefine);

    void addDictDefine(DictDefine dictDefine);

    void editDictDefine(DictDefine dictDefine, String oldDictName);

    void delDictDefine(String dictName);

    DictDefine findDictDefineByDictName(String dictName);

    Boolean checkRepeatDictDefineName(String dictName, String oldDictName);

    Page<DictValues> findDictValuesPageList(PageParameter pageParameter, DictValues dictValues);

    void addDictValues(DictValues dictValues);

    void editDictValues(DictValues dictValues);

    void delDictValues(DictValues dictValues);

    DictValues findDictValuesByNameAndCode(DictValues dictValues);

    DictValues findDictValuesByNameAndValue(DictValues dictValues);

    Boolean checkRepeatDictValuesCode(DictValues dictValues);

    List<DictDefine> findAllDictDefine();

    List<DictValues> findAllDictValues();

    String changeDictCodeToValue(int dictCode, String dictName);

    int changeDictValueToCode(String dictValue, String dictName);
}
