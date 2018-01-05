package com.ten.ParkNShop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ten.ParkNShop.entity.Buyer;
import com.ten.ParkNShop.entity.Order;
import com.ten.ParkNShop.entity.Seller;
import com.ten.ParkNShop.mapper.BuyerMapper;
import com.ten.ParkNShop.mapper.CommissionMapper;
import com.ten.ParkNShop.mapper.SellerMapper;
import com.ten.ParkNShop.service.AdminBuyerService;
import com.ten.ParkNShop.service.AdminOrderService;
import com.ten.ParkNShop.service.SellerOrderService;
import com.ten.ParkNShop.util.Page;

@Controller
public class SellerOrderController {
	
	@Autowired
	private SellerOrderService sellerOrderService; 
	@Autowired
	private AdminBuyerService adminBuyerService;
	@Autowired
	private AdminOrderService adminOrderService;
	@Autowired
	private BuyerMapper buyerMapper;
	@Autowired
	private SellerMapper sellerMapper;
	
	@RequestMapping(value = "/sellerOrderPage")
	public String orderPage(HttpSession session,Model model){
		
		Seller seller = (Seller)session.getAttribute("seller");
		
		int status = seller.getShopStatus();
		if(status == 1){
			model.addAttribute("status", null);
			return "forward:/sellerOrderManagement";
		}else if(status == 0){
			model.addAttribute("status", 0);
			return "Seller/sellerhome";
		}else if(status == 2){
			model.addAttribute("status", 2);
			return "Seller/sellerhome";
		}else{
			model.addAttribute("status", 3);
			return "Seller/sellerhome";
		}
		
	}
	
	@RequestMapping(value = "/sellerOrderManagement", method = RequestMethod.GET)
	public String listOrder(@RequestParam(name="cur", defaultValue="1")int cur,HttpSession session,Model model){
		
		int sellerId = ((Seller)session.getAttribute("seller")).getsellerId();
        
		Page page = sellerOrderService.getCompletedOrders(sellerId,cur);
		model.addAttribute("page",page);
		return "Seller/listCompletedOrders";
	}
	
	@RequestMapping(value="/sellerListCompletedOrder",method=RequestMethod.GET)
	public @ResponseBody Page listCompletedOrder(@RequestParam(name="cur", defaultValue="1") int cur,HttpSession session){
		
		int sellerId = ((Seller)session.getAttribute("seller")).getsellerId();
		Page page = sellerOrderService.getCompletedOrders(sellerId,cur);
	
		return page;
	}
	
	@RequestMapping(value = "/sellerUncompletedOrder", method = RequestMethod.GET)
	public String listUncompletedOrder(@RequestParam(name="cur", defaultValue="1")int cur,HttpSession session,Model model){
		
		int sellerId = ((Seller)session.getAttribute("seller")).getsellerId();
        
		Page page = sellerOrderService.getUncompletedOrders(sellerId,cur);
		System.out.println(page.getList());
		model.addAttribute("page",page);
		return "Seller/listUncompletedOrders";
	}
	
	@RequestMapping(value="/sellerListUncompletedOrder",method=RequestMethod.GET)
	public @ResponseBody Page listUncompletedOrder(@RequestParam(name="cur", defaultValue="1") int cur,HttpSession session){
		
		int sellerId = ((Seller)session.getAttribute("seller")).getsellerId();
		Page page = sellerOrderService.getUncompletedOrders(sellerId,cur);
	
		return page;
	}
	
	@RequestMapping(value = "/sellerShip", method = RequestMethod.GET)
	public String ship(int orderId){
		
		sellerOrderService.changeToShip(orderId);
		return "forward:/sellerUncompletedOrder";
	}
	
	@RequestMapping(value = "/sellerRefundSucceed", method = RequestMethod.GET)
	public String refundSucceed(int orderId){
		Order order = adminOrderService.selectOrderById(orderId);
		int result = sellerOrderService.changeToRefundSucceed(orderId);
		
		Buyer buyer = adminBuyerService.selectBuyerById(order.getBuyerId());
		buyerMapper.addBalance(order.getSellerId(), order.getTotalPrice());
		sellerMapper.deleteBalance(order.getSellerId(),order.getTotalPrice());
		return "forward:/sellerUncompletedOrder";
	}
	
	@RequestMapping(value = "/sellerRefundFailed", method = RequestMethod.GET)
	public String refundFailed(int orderId){
		
		int result = sellerOrderService.changeToRefundFailed(orderId);
		
		return "forward:/sellerUncompletedOrder";
	}
	
	
}
