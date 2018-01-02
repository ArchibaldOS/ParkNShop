package com.ten.ParkNShop.service.impl;

import com.ten.ParkNShop.entity.Order;
import com.ten.ParkNShop.mapper.OrderMapper;
import com.ten.ParkNShop.service.BuyerReturnsService;
import org.springframework.beans.factory.annotation.Autowired;

public class BuyerReturnsServiceImp implements BuyerReturnsService {
    @Autowired
    private OrderMapper orderMapper;

    public void refundOnly(int orderId) {
        Order order = orderMapper.selectByPrimaryKey(orderId);
        order.setOrderStatus(6);
    }

    public void returnAndRefund(int orderId) {
        Order order = orderMapper.selectByPrimaryKey(orderId);
        order.setOrderStatus(6);
    }
}
