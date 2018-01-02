package com.ten.ParkNShop.service;

import com.ten.ParkNShop.entity.Order;
import com.ten.ParkNShop.entity.OrderItem;

import java.util.List;

/**
 * Created by cxh on 17/12/30.
 */
public interface BuyerOrderService {
    List<OrderItem> selectBuyerOrdersBetweenTime(String startTime, String endTime, int BuyerId);

}
