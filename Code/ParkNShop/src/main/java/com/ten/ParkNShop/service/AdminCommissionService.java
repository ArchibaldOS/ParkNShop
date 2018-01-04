package com.ten.ParkNShop.service;

import com.ten.ParkNShop.entity.Commission;

import java.util.List;

/**
 * @Author tad
 * @Date create in 3:35 PM 12/16/2017
 * @Description
 * @Modify By
 **/
public interface AdminCommissionService {

    int insert(Commission commission);

    int insertLast(float commission, String operatorAccount, java.sql.Date time);

    float selectLastCommission();

    List<Commission> selectSomeCommission(int start, int pageSize);

    float getCommissionById(int commissionId);

}
