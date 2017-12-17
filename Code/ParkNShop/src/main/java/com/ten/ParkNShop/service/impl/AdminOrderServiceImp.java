package com.ten.ParkNShop.service.impl;

import com.ten.ParkNShop.entity.Order;
import com.ten.ParkNShop.mapper.OrderMapper;
import com.ten.ParkNShop.service.AdminOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ Author tad
 * @Date created in 11:06 AM 12/15/2017
 * @Description Order 有关的数据库操作
 *
 * @Modify By
 */

@Service
public class AdminOrderServiceImp implements AdminOrderService{

    @Autowired
    private OrderMapper orderMapper;

    /**
     * @Description 插入一个Order
     * @param order
     * @return int
     */
    public int insertOrder(Order order) {
        int i = orderMapper.insert(order);
        return i;
    }

    /**
     * @Description update 一个 order
     * @param order
     * @return int
     */
    public int updateOrder(Order order) {
        int i = orderMapper.updateByPrimaryKey(order);
        return i;
    }

    /**
     * @Description 通过 ID 删除一个 Order
     * @param id
     * @return int
     */
    public int deleteOrder(int id) {
        int i = orderMapper.deleteByPrimaryKey(id);
        return i;
    }

    /**
     * @Author tad
     * @Date created in 11:06 AM 12/15/2017
     * @Description 通过 orderId  查找出一个 Order
     *
     * @params [id]  
     * @return com.ten.ParkNShop.entity.Order
     */
    public Order selectOrderById(int id) {
        Order order = orderMapper.selectByPrimaryKey(id);
        return order;
    }

    /**
     * @Author tad
     * @Date created in 5:00 PM 12/15/2017
     * @Description 选择所有的 Order 并从结果集中截取 start 开始的 pageSize 个结果
     *
     * @params [start, pageSize]
     * @return java.util.List<com.ten.ParkNShop.entity.Order>
     */
    public List<Order> selectAllOrder(int start, int pageSize) {
        List<Order> orders = orderMapper.selectAllOrder(start, pageSize);
        return orders;
    }

    /**
     * @Author: tad
     * @Date: created in 11:04 AM 12/15/2017
     * @Description: 通过 buyerId 查找该用户的从 start 开始的 pageSize 个 Order
     *
     * @params [id, start, pageSize]
     * @return java.util.List<com.ten.ParkNShop.entity.Order>
     */
    public List<Order> selectOrderBybuyerId(int buyerId, int start, int pageSize) {

        List<Order> orders = orderMapper.selectOrderBybuyerId(buyerId, start, pageSize);
        return orders;
    }

    /**
     * @Author: tad
     * @Date: created in 11:04 AM 12/15/2017
     * @Description: 通过 sellerId 查找该用户的从 start 开始的 pageSize 个 Order
     *
     * @params [id, start, pageSize]  
     * @return java.util.List<com.ten.ParkNShop.entity.Order>
     */
    public List<Order> selectOrderBysellerId(int sellerId, int start, int pageSize) {
        List<Order> orders = orderMapper.selectOrderBysellerId(sellerId, start, pageSize);
        return orders;
    }

    /**
     * @Author: tad
     * @Date: created in 11:05 AM 12/15/2017
     * @Description: 通过 productId 查找该产品的从 start 开始的 pageSize 个 Order
     *
     * @params [id, start, pageSize]  
     * @return java.util.List<com.ten.ParkNShop.entity.Order>
     */
    public List<Order> selectOrderByproductId(int productId, int start, int pageSize) {
        List<Order> orders = orderMapper.selectOrderByproductId(productId, start, pageSize);
        return orders;
    }
}
