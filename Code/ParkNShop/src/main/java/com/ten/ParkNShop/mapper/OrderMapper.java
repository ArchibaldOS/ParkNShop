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
     *
     * @params [start, pageSize]
     * @return java.util.List<com.ten.ParkNShop.entity.Order>
     */
    List<Order> selectAllOrder(@Param("start") int start, @Param("pageSize")int pageSize);
    /**
     * @Author: tad
     * @Date: created in 11:04 AM 12/15/2017
     *
     * @params [id, start, pageSize]
     * @return java.util.List<com.ten.ParkNShop.entity.Order>
     */
    List<Order> selectOrderByBuyerId(@Param("buyerId")int buyerID, @Param("start") int start, @Param("pageSize")int pageSize);

    /**
     * @Author: tad
     * @Date: created in 11:04 AM 12/15/2017
     *
     * @params [id, start, pageSize]
     * @return java.util.List<com.ten.ParkNShop.entity.Order>
     */
    List<Order> selectOrderBySellerId(@Param("sellerId")int buyerID, @Param("start") int start, @Param("pageSize")int pageSize);

    /**
     * @Author: tad
     * @Date: created in 11:05 AM 12/15/2017
     *
     * @params [id, start, pageSize]
     * @return java.util.List<com.ten.ParkNShop.entity.Order>
     */

    List<Order> selectOrderByProductId(@Param("productId")int buyerId, @Param("start") int start, @Param("pageSize")int pageSize);

    /**
     * @Author tad
     * @Date created in 9:15 PM 12/18/2017
     * @Description 获取一段时间之内的所有的成功订单
     *
     * @params [startTime, endTime, type]
     * @return java.util.List<com.ten.ParkNShop.entity.Order>
     */
    List<Order> selectAllOrdersBetweenTime(@Param("startTime") String startTime, @Param("endTime") String endTime);
    

	int countCompleted(@Param("sellerId")int sellerId);

	List<Order> findCompleted(@Param("sellerId")int sellerId,@Param("start") int start, @Param("pageSize")int pageSize);

	int countUncompleted(@Param("sellerId")int sellerId);

	List<Order> findUncompleted(@Param("sellerId")int sellerId, @Param("start") int start, @Param("pageSize")int pageSize);

	int changeToShip(@Param("orderId")int orderId);

	int changeToRefundSucceed(@Param("orderId") int orderId);

	int changeToRefundFailed(@Param("orderId") int orderId);


    
}