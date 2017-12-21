package com.ten.ParkNShop.service.impl;

import com.ten.ParkNShop.entity.Buyer;
import com.ten.ParkNShop.entity.Order;
import com.ten.ParkNShop.mapper.OrderMapper;
import com.ten.ParkNShop.service.BuyerPurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by cxh on 17/12/16.
 */
@Service
public class BuyerPurchaseServiceImp implements BuyerPurchaseService {
    @Autowired
    private OrderMapper orderMapper;
    public Order createOrderSer(Order order) {
        if(order != null) {
            orderMapper.insert(order);
        }
        else
        {
            System.out.println("生成订单服务未取得正确的order对象");
        }
        return order;
        //返回null说明插入不成功
    }

    public List<Order> findBuyerOrdersSer(Buyer buyer) {
        int startNum = orderMapper.countOrdersByBuyerId(buyer.getbuyerId()) - 5;
        startNum = startNum < 0 ? 0:startNum;

        List<Order> orders  = orderMapper.selectOrderByBuyerId(buyer.getbuyerId(),startNum,5);
        return orders;
    }

    public Order findOrderSer(Integer orderId) {

        return orderMapper.selectByPrimaryKey(orderId);
    }

    public boolean createOrders(List<Order> orders) {
        try {
            for (Order temp : orders) {
                createOrderSer(temp);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
            System.out.println("批量生成订单失败");
            return  false;
        }
        return true;
    }
}
