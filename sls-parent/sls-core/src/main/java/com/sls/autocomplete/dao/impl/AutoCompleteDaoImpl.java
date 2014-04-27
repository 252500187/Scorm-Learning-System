package com.sls.autocomplete.dao.impl;

import com.core.autocomplete.dao.AutoCompleteBaseDao;
import com.core.autocomplete.entity.AutoCompleteVO;
import com.sls.autocomplete.dao.AutoCompleteDao;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * google框dao实现层
 *
 * @author gaoxinyu
 * @version 1.0.1
 */
@Repository("autoCompleteDao")
public class AutoCompleteDaoImpl extends AutoCompleteBaseDao implements AutoCompleteDao {
    @Override
    public List<AutoCompleteVO> getDictValues(String dictName) {
        return findAutoCompleteList("select dict_code id,dict_value name from dict_values " +
                "where dict_name='" + dictName + "'order by dict_code"   );
    }

    @Override
    public List<AutoCompleteVO> findAllRoles() {
        return findAutoCompleteList("select id,role_name name from sys_role");
    }

    @Override
    public List<AutoCompleteVO> findGroupJudges() {
        return findAutoCompleteList("select id,judges_group_name name from group_judges");
    }


    @Override
    public List<AutoCompleteVO> findCandidateGroupList() {
        return findAutoCompleteList("select id, candidate_group_name name FROM group_candidate");
    }

    @Override
    public List<AutoCompleteVO> findPermissionList() {
        return findAutoCompleteList("select permission_token name from sys_permission");
    }

    @Override
    public List<AutoCompleteVO> findAllPaperGrade() {
        return findAutoCompleteList("SELECT paper_grade name FROM rule_paper");
    }

    @Override
    public List<AutoCompleteVO> findGroupJudgesValue() {
        return findAutoCompleteList("select id, judges_group_name name FROM group_judges");
    }

    @Override
    public List<AutoCompleteVO> findGroupCandidateValue() {
        return findAutoCompleteList("select id, candidate_group_name name from group_candidate");
    }

    @Override
    public List<AutoCompleteVO> findGroupDepartmentVote() {
        return findAutoCompleteList("select id, candidate_group_name name from group_candidate");
    }

    @Override
    public List<AutoCompleteVO> findPerformanceContent() {
        return findAutoCompleteList("select id, performance_content name from rule_performance");
    }

    @Override
    public List<AutoCompleteVO> findPerformanceGrade() {
        return findAutoCompleteList("select id, performance_grade_id name from rule_performance");
    }

    @Override
    public List<AutoCompleteVO> findPerformanceRank() {
        return findAutoCompleteList("SELECT  id,performance_rank NAME, COUNT(DISTINCT performance_rank) FROM rule_performance GROUP BY performance_rank");
    }
}
