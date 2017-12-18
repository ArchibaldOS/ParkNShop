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
     * @Description 通过 orderID  查找出一个 Order
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
     * @Description: 通过 BuyerID 查找该用户的从 start 开始的 pageSize 个 Order
     *
     * @params [id, start, pageSize]
     * @return java.util.List<com.ten.ParkNShop.entity.Order>
     */
    public List<Order> selectOrderByBuyerID(int buyerID, int start, int pageSize) {

        List<Order> orders = orderMapper.selectOrderByBuyerID(buyerID, start, pageSize);
        return orders;
    }

    /**
     * @Author: tad
     * @Date: created in 11:04 AM 12/15/2017
     * @Description: 通过 SellerID 查找该用户的从 start 开始的 pageSize 个 Order
     *
     * @params [id, start, pageSize]  
     * @return java.util.List<com.ten.ParkNShop.entity.Order>
     */
    public List<Order> selectOrderBySellerID(int sellerID, int start, int pageSize) {
        List<Order> orders = orderMapper.selectOrderBySellerID(sellerID, start, pageSize);
        return orders;
    }

    /**
     * @Author: tad
     * @Date: created in 11:05 AM 12/15/2017
     * @Description: 通过 ProductID 查找该产品的从 start 开始的 pageSize 个 Order
     *
     * @params [id, start, pageSize]  
     * @return java.util.List<com.ten.ParkNShop.entity.Order>
     */
    public List<Order> selectOrderByProductID(int productID, int start, int pageSize) {
        List<Order> orders = orderMapper.selectOrderByProductID(productID, start, pageSize);
        return orders;
    }

    /**
     * 获取一段时间之内的所有的成功订单
     * @param startTime
     * @param endTime
     * @param type type 为获取的类型，1 ：最小单位是 一天 ；2 最小单位是 秒
     * @return
     */
    public List<Order> selectAllOrdersBetweenTime(String startTime, String endTime, int type) {
        List<Order> orders = null;
        if(type == 1){
            orders = orderMapper.selectAllOrdersBetweenTime(startTime + " 0:00", endTime + " 24:00");
        }else{
            orders = orderMapper.selectAllOrdersBetweenTime(startTime, endTime);
        }

        return orders;
    }
}
