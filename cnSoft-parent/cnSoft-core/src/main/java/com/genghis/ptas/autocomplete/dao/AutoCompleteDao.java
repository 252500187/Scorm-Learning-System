package com.genghis.ptas.autocomplete.dao;

import com.genghis.core.autocomplete.entity.AutoCompleteVO;

import java.util.List;

/**
 * google框dao层接口
 *
 * @author gaoxinyu
 * @version 1.0.1
 */
public interface AutoCompleteDao {

    List<AutoCompleteVO> getDictValues(String dictName);

    List<AutoCompleteVO> findAllRoles();

    List<AutoCompleteVO> findGroupJudges();

    List<AutoCompleteVO> findCandidateGroupList();

    List<AutoCompleteVO> findPermissionList();

    List<AutoCompleteVO> findAllPaperGrade();

    List<AutoCompleteVO> findGroupJudgesValue();

    List<AutoCompleteVO> findGroupCandidateValue();

    List<AutoCompleteVO> findGroupDepartmentVote();

    List<AutoCompleteVO> findPerformanceContent();

    List<AutoCompleteVO> findPerformanceGrade();

    List<AutoCompleteVO> findPerformanceRank();
}
