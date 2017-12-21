package com.ten.ParkNShop.service;

import com.ten.ParkNShop.entity.Buyer;
import com.ten.ParkNShop.entity.Order;

import java.util.List;

/**
 * Created by cxh on 17/12/16.
 */
public interface BuyerPurchaseService {
    //生成订单
    public Order createOrderSer(Order order);
    //查询订单
    public List<Order> findBuyerOrdersSer(Buyer buyer);
    //查询特定订单
    public Order findOrderSer(Integer orderId);
    //批量生成订单
    public boolean createOrders(List<Order> orders);



}
