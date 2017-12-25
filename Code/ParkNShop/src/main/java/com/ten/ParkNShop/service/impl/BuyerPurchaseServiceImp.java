package com.ten.ParkNShop.service.impl;

import com.ten.ParkNShop.entity.Buyer;
import com.ten.ParkNShop.entity.Order;
import com.ten.ParkNShop.entity.OrderItem;
import com.ten.ParkNShop.mapper.OrderMapper;
import com.ten.ParkNShop.mapper.ProductMapper;
import com.ten.ParkNShop.mapper.SellerMapper;
import com.ten.ParkNShop.service.BuyerPurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by cxh on 17/12/16.
 */
@Service
public class BuyerPurchaseServiceImp implements BuyerPurchaseService {
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    ProductMapper productMapper;
    @Autowired
    SellerMapper sellerMapper;
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

    public List<OrderItem> findBuyerOrdersSer(Buyer buyer) {
        int buyerId = buyer.getbuyerId();
       // int startNum = orderMapper.countOrdersByBuyerId(buyerId);
        //startNum-= 5;
        //startNum = startNum < 0 ? 0:startNum;

        List<Order> orders  = orderMapper.selectOrderByBuyerId(buyer.getbuyerId(),0,20);
        List<OrderItem> results = new ArrayList<OrderItem>();
        for(Order temp : orders)
        {
            OrderItem item = new OrderItem();
            item.setOrder(temp);
            item.setProduct(productMapper.findByProductId(temp.getProductId()));
            item.setSeller(sellerMapper.selectByPrimaryKey(temp.getSellerId()));
            results.add(item);
        }
        return results;
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

    public void changeOrderToPaid(int orderId) {
        orderMapper.changeToPaid(orderId);
    }

    public void changeOrderToReceived(int orderId) {
        orderMapper.changeToReceived(orderId);
    }
}
