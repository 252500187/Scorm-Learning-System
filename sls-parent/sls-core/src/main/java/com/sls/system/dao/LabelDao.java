package com.sls.system.dao;

import com.sls.system.entity.Label;

import java.util.List;

public interface LabelDao {
    List<Label> getAllUserLabel();

    void delAllUserLabelsByUserId(int userId);

    void addUserLabel(Label label);

    List<Label> getLabelsByUserId(int userId);

    List<Label> getAllLabel();

    void addScormLabel(Label label);
}
