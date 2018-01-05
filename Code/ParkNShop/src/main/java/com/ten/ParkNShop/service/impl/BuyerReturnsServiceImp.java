package com.ten.ParkNShop.service.impl;

import com.ten.ParkNShop.entity.Order;
import com.ten.ParkNShop.mapper.OrderMapper;
import com.ten.ParkNShop.service.BuyerReturnsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BuyerReturnsServiceImp implements BuyerReturnsService {
    @Autowired
    private OrderMapper orderMapper;

    public void refundOnly(int orderId) {
        orderMapper.changeToRefunding(orderId);
    }

    public void refundAndReturn(int orderId) {
        orderMapper.changeToRefundAndReturning(orderId);
    }

}
