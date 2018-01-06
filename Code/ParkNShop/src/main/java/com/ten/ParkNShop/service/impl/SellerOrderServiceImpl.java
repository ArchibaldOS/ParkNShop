package com.ten.ParkNShop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ten.ParkNShop.mapper.BuyerMapper;
import com.ten.ParkNShop.mapper.OrderMapper;
import com.ten.ParkNShop.mapper.ProductMapper;
import com.ten.ParkNShop.service.SellerOrderService;
import com.ten.ParkNShop.util.Page;
import com.ten.ParkNShop.entity.Buyer;
import com.ten.ParkNShop.entity.Order;
import com.ten.ParkNShop.entity.OrderItem;
import com.ten.ParkNShop.entity.Product;

@Service
public class SellerOrderServiceImpl implements SellerOrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private BuyerMapper buyerMapper;

	public Page getCompletedOrders(int sellerId, int cur) {
		Page page = new Page(cur);
		
		int count = orderMapper.countCompleted(sellerId);
		
		List<Order> orders = orderMapper.findCompleted(sellerId,page.getOffset(), page.getSize());
		
		List<OrderItem> orderItems = new ArrayList<OrderItem>();
		
		for(Order o : orders){
			Product product = productMapper.findByProductId(o.getProductId());
			Buyer buyer = buyerMapper.selectByPrimaryKey(o.getBuyerId());
			OrderItem orderItem = new OrderItem();
			orderItem.setBuyer(buyer);
			orderItem.setProduct(product);
			orderItem.setOrder(o);
			orderItems.add(orderItem);
		}
		
		page.setCount(count);
		page.setList(orderItems);
		
		return page;
	}

	public Page getUncompletedOrders(int sellerId, int cur) {
		Page page = new Page(cur);
		
		int count = orderMapper.countUncompleted(sellerId);
		
		List<Order> orders = orderMapper.findUncompleted(sellerId,page.getOffset(), page.getSize());
		
		List<OrderItem> orderItems = new ArrayList<OrderItem>();
		
		for(Order o : orders){
			Product product = productMapper.findByProductId(o.getProductId());
			Buyer buyer = buyerMapper.selectByPrimaryKey(o.getBuyerId());
			OrderItem orderItem = new OrderItem();
			orderItem.setBuyer(buyer);
			orderItem.setProduct(product);
			orderItem.setOrder(o);
			orderItems.add(orderItem);
		}
		
		page.setCount(count);
		page.setList(orderItems);
		
		return page;
	}

	public int changeToShip(int orderId) {
		
		return orderMapper.changeToShip(orderId);
	}

	public int changeToRefundSucceed(int orderId) {
		
		return orderMapper.changeToRefundSucceed(orderId);
	}

	public int changeToRefundFailed(int orderId) {
		
		return orderMapper.changeToRefundFailed(orderId);
	}

	 public List<Order> selectAllOrdersBetweenTime(String startTime, String endTime, int sellerId, int type) {
        List<Order> orders = null;
        if(type == 1){
            orders = orderMapper.sellerSelectOrdersBetweenTime(startTime + " 0:00", endTime + " 23:59", sellerId);
        }else{
            orders = orderMapper.sellerSelectOrdersBetweenTime(startTime, endTime, sellerId);
        }
        return orders;
    }

	@Override
	public float countIncome(int sellerId) {
		List<Order> orders = orderMapper.findCompletedNoPage(sellerId);
		float totalIncome = 0;
		for(Order o : orders){
			totalIncome += (o.getTotalPrice())*0.98;
		}
		return totalIncome;
	}

}
