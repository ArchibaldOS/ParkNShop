package com.ten.ParkNShop.service;

import java.util.List;

import com.ten.ParkNShop.entity.Order;
import com.ten.ParkNShop.util.Page;

public interface SellerOrderService {

	Page getCompletedOrders(int sellerId, int cur);

	Page getUncompletedOrders(int sellerId, int cur);

	int changeToShip(int orderId);

	int changeToRefundSucceed(int orderId);

	int changeToRefundFailed(int orderId);

	List<Order> selectAllOrdersBetweenTime(String startTime, String endTime, int sellerId, int type);

	float countIncome(int sellerId);
}
