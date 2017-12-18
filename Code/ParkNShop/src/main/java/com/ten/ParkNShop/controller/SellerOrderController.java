package com.ten.ParkNShop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ten.ParkNShop.entity.Seller;
import com.ten.ParkNShop.service.SellerOrderService;
import com.ten.ParkNShop.util.Page;

@Controller
public class SellerOrderController {
	
	@Autowired
	private SellerOrderService sellerOrderService; 
	
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
		System.out.println(page.getList());
		model.addAttribute("page",page);
		
		return "Seller/listCompletedOrders";
	}
	
	@RequestMapping(value="/sellerListCompletedOrder",method=RequestMethod.GET)
	public @ResponseBody Page listCompletedOrder(@RequestParam(name="cur", defaultValue="1") int cur,HttpSession session){
		
		int sellerId = ((Seller)session.getAttribute("seller")).getsellerId();
		Page page = sellerOrderService.getCompletedOrders(sellerId,cur);
	
		return page;
	}
	
}
