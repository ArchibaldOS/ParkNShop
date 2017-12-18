package com.ten.ParkNShop.mapper;

import com.ten.ParkNShop.entity.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {

    int deleteByPrimaryKey(Integer orderid);

    int countOrdersByBuyerId(Integer buyerId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orders
     *
     * @mbggenerated
     */
    int insert(Order record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orders
     *
     * @mbggenerated
     */
    int insertSelective(Order record);

    int countOrdersByBuyerId(int buyerId);
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orders
     *
     * @mbggenerated
     */
    Order selectByPrimaryKey(Integer orderid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orders
     *
     * @mbggenerated
     */

    int updateByPrimaryKeySelective(Order record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table orders
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Order record);

    /**
     * @Author tad
     * @Date created in 4:53 PM 12/15/2017
     * @Description 选择所有的 Order 并从结果集中截取 start 开始的 pageSize 个结果
     *
     * @params [start, pageSize]
     * @return java.util.List<com.ten.ParkNShop.entity.Order>
     */
    List<Order> selectAllOrder(@Param("start") int start, @Param("pageSize")int pageSize);
    /**
     * @Author: tad
     * @Date: created in 11:04 AM 12/15/2017
     * @Description: 通过 BuyerID 查找该用户的从 start 开始的 pageSize 个 Order
     *
     * @params [id, start, pageSize]
     * @return java.util.List<com.ten.ParkNShop.entity.Order>
     */
    List<Order> selectOrderByBuyerID(@Param("buyerID")int buyerID, @Param("start") int start, @Param("pageSize")int pageSize);

    /**
     * @Author: tad
     * @Date: created in 11:04 AM 12/15/2017
     * @Description: 通过 SellerID 查找该用户的从 start 开始的 pageSize 个 Order
     *
     * @params [id, start, pageSize]
     * @return java.util.List<com.ten.ParkNShop.entity.Order>
     */
    List<Order> selectOrderBySellerID(@Param("sellerID")int buyerID, @Param("start") int start, @Param("pageSize")int pageSize);

    /**
     * @Author: tad
     * @Date: created in 11:05 AM 12/15/2017
     * @Description: 通过 ProductID 查找该产品的从 start 开始的 pageSize 个 Order
     *
     * @params [id, start, pageSize]
     * @return java.util.List<com.ten.ParkNShop.entity.Order>
     */
    List<Order> selectOrderByProductID(@Param("productID")int buyerID, @Param("start") int start, @Param("pageSize")int pageSize);
}