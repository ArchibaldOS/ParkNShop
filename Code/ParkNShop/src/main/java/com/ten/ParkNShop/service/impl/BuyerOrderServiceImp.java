package com.ten.ParkNShop.service.impl;

import com.ten.ParkNShop.entity.Order;
import com.ten.ParkNShop.entity.OrderItem;
import com.ten.ParkNShop.mapper.OrderMapper;
import com.ten.ParkNShop.mapper.ProductMapper;
import com.ten.ParkNShop.mapper.SellerMapper;
import com.ten.ParkNShop.service.BuyerOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by cxh on 17/12/30.
 */
@Service
public class BuyerOrderServiceImp implements BuyerOrderService{
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private SellerMapper sellerMapper;

    public List<OrderItem> selectBuyerOrdersBetweenTime(String startTime, String endTime, int BuyerId) {


        List<OrderItem> result = new LinkedList<OrderItem>();
        List<Order> orders = orders = orderMapper.buyerSelectOrdersBetweenTime(startTime + " 0:00", endTime + " 23:59",BuyerId);

        //找到规定时间区间的用户订单
        for(Order temp : orders)
        {
            OrderItem item = new OrderItem();
            item.setOrder(temp);
            item.setProduct(productMapper.findByProductId(temp.getProductId()));
            item.setSeller(sellerMapper.selectByPrimaryKey(temp.getSellerId()));
            result.add(item);
        }
        //查找这些订单的详细信息，并封装到OrderItem
        return result;

    }
}
