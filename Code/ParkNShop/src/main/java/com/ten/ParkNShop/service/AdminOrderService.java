package com.ten.ParkNShop.service;

import com.ten.ParkNShop.entity.Order;

import java.util.List;


public interface AdminOrderService {
    /**
     * @Description: 插入一个 order
     * @param order
     * @return int
     */
    int insertOrder(Order order);

    /**
     * @Description: 更新一个Order的信息
     * @param order
     * @return int
     */
    int updateOrder(Order order);

    /**
     * @Description 删除一个 Order
     * @param id
     * @return int
     */
    int deleteOrder(int id);


    /**
     * @Description 通过 orderId 选择一个 Order
     * @param id
     * @return Order
     */
    Order selectOrderById(int id);

   /**
    * @Author tad
    * @Date created in 4:58 PM 12/15/2017
    * @Description 选择所有的 Order 并从结果集中截取 start 开始的 pageSize 个结果
    *
    * @params [start, pageSize]
    * @return java.util.List<com.ten.ParkNShop.entity.Order>
    */
    List<Order> selectAllOrder(int start, int pageSize);

    /**
     * @Description 通过一个buyerId 查找这个买家的所有 Order，并从返回的结果集中截取一部分，从 start 开始， 大小为 pageSize
     * @param id
     * @param start
     * @param pageSize
     * @return
     */
    List<Order> selectOrderBybuyerId(int buyerId, int start, int pageSize);


    /**
     * @Description 通过一个sellerId 查找这个卖家的所有 Order，并从返回的结果集中截取一部分，从 start 开始， 大小为 pageSize
     * @param id
     * @param start
     * @param pageSize
     * @return
     */
    List<Order> selectOrderBysellerId(int sellerId, int start, int pageSize);

    /**
     * @Description 通过一个productId 查找这个产品的所有 Order，并从返回的结果集中截取一部分，从 start 开始， 大小为 pageSize
     * @param id
     * @param start
     * @param pageSize
     * @return
     */
    List<Order> selectOrderByproductId(int productId, int start, int pageSize);



}
