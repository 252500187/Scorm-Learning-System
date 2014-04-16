package com.genghis.core.autocomplete.service;

import com.genghis.core.autocomplete.entity.AutoCompleteParam;
import com.genghis.core.autocomplete.entity.AutoCompleteVO;

import java.util.List;

/**
 * 自动提示的抽象类
 *
 * @author gaoxinyu
 * @version 1.0.1
 */
public interface AutoCompleteService {

    void initAutoComplete();

    List<AutoCompleteVO> getAutoCompleteResultList(AutoCompleteParam autoCompleteParam);

}
