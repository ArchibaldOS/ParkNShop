package com.ten.ParkNShop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ten.ParkNShop.mapper.OrderMapper;
import com.ten.ParkNShop.service.SellerOrderService;
import com.ten.ParkNShop.util.Page;
import com.ten.ParkNShop.entity.Order;

@Service
public class SellerOrderServiceImpl implements SellerOrderService {

	@Autowired
	private OrderMapper orderMapper;

	public Page getCompletedOrders(int sellerId, int cur) {
		Page page = new Page(cur);
		
		int count = orderMapper.countCompleted(sellerId);
		
		List<Order> orders = orderMapper.findCompleted(sellerId,page.getOffset(), page.getSize());
		
		page.setCount(count);
		page.setList(orders);
		
		return page;
	}

	@Override
	public Page getUncompletedOrders(int sellerId, int cur) {
		Page page = new Page(cur);
		
		int count = orderMapper.countUncompleted(sellerId);
		
		List<Order> orders = orderMapper.findUncompleted(sellerId,page.getOffset(), page.getSize());
		
		page.setCount(count);
		page.setList(orders);
		
		return page;
	}

}
