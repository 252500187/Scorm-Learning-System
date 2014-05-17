package com.sls.system.dao;

import com.sls.system.entity.Label;

import java.util.List;

public interface LabelDao {
    List<Label> getAllUserLabel();

    void delAllUserLabelsByUserId(int userId);

    void addUserLabel(Label label);
}
