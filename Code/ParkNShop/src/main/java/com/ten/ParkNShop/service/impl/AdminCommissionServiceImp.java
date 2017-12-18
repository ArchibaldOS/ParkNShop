package com.ten.ParkNShop.service.impl;

import com.ten.ParkNShop.entity.Commission;
import com.ten.ParkNShop.mapper.CommissionMapper;
import com.ten.ParkNShop.service.AdminCommissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

/**
 * @Author tad
 * @Date create in 3:36 PM 12/16/2017
 * @Description
 * @Modify By
 **/
@Service
public class AdminCommissionServiceImp implements AdminCommissionService{

    @Autowired
    private CommissionMapper commissionMapper;

    public int insert(Commission commission) {
        return commissionMapper.insert(commission);
    }

    public int insertLast(float commission, String operatorAccount, Date time) {
        int i = commissionMapper.insertLast(commission, operatorAccount, time);
        return i;
    }

    public List<Commission> selectSomneCommission(int start, int pageSize) {
        List<Commission> commissions = commissionMapper.selectSomeCommission(start, pageSize);
        return commissions;
    }
    /**
     * @Author tad
     * @Date created in 3:43 PM 12/16/2017
     * @Description 找出最近的一个佣金比例的值
     *
     * @params []
     * @return float
     */
    public float selectLastCommission(){
        return Float.valueOf(commissionMapper.selectLastCommission().getCommission());
    }
}
