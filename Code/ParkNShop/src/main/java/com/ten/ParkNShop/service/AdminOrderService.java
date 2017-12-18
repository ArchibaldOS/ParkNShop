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
     * @Description 通过 OrderID 选择一个 Order
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
     * @Description 通过一个BuyerID 查找这个买家的所有 Order，并从返回的结果集中截取一部分，从 start 开始， 大小为 pageSize
     * @param buyerID
     * @param start
     * @param pageSize
     * @return
     */
    List<Order> selectOrderByBuyerID(int buyerID, int start, int pageSize);


    /**
     * @Description 通过一个SellerID 查找这个卖家的所有 Order，并从返回的结果集中截取一部分，从 start 开始， 大小为 pageSize
     * @param sellerID
     * @param start
     * @param pageSize
     * @return
     */
    List<Order> selectOrderBySellerID(int sellerID, int start, int pageSize);

    /**
     * @Description 通过一个ProductID 查找这个产品的所有 Order，并从返回的结果集中截取一部分，从 start 开始， 大小为 pageSize
     * @param productID
     * @param start
     * @param pageSize
     * @return
     */
    List<Order> selectOrderByProductID(int productID, int start, int pageSize);

    /**
     * 获取一段时间之内的所有的成功订单
     * @param startTime
     * @param endTime
     * @param type type 为获取的类型，1 ：最小单位是 一天 ；2 最小单位是 秒
     * @return
     */


    List<Order> selectAllOrdersBetweenTime(String startTime, String endTime, int type);


}
