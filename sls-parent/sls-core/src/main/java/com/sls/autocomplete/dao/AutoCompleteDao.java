package com.sls.autocomplete.dao;

import com.core.autocomplete.entity.AutoCompleteVO;

import java.util.List;

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
