package com.ten.ParkNShop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ten.ParkNShop.entity.Seller;
import com.ten.ParkNShop.service.SellerIndexService;

@Controller
public class SellerIndexController {
	
	@Autowired
	private SellerIndexService sellerService;
	
	@RequestMapping(value="/sellerLogin",method=RequestMethod.GET)
	public String seller(){
		return "Seller/sellerLogin";
	}
	
	@RequestMapping(value="/sellerRegister",method=RequestMethod.GET)
	public String sell(){
		return "Seller/sellerRegister";
	}
	
	@RequestMapping(value="/sellerLogout",method=RequestMethod.GET)
	public String sellLogout(HttpSession session){
		session.setAttribute("seller", null);
		return "redirect:index.jsp";
	}

	@RequestMapping(value="/registSeller",method=RequestMethod.POST)
	public String regSeller(String sellerName, String shopName, String sellerPassword, String sellerPhone,String sellerEmail,String shopIntroduction,Model model){
		
		Seller seller = new Seller();
		
		seller.setSellerName(sellerName);
		seller.setShopName(shopName);
		seller.setSellerPassword(sellerPassword);
		seller.setSellerEmail(sellerEmail);
		seller.setSellerPhone(sellerPhone);
		seller.setShopIntroduction(shopIntroduction);
		int resultEmail = sellerService.validation(sellerEmail);
		if(resultEmail!=0){
			model.addAttribute("emailUsed", 1);
			return "Seller/sellerRegister";
		}
		int result = sellerService.sellerRegister(seller);
		if(result == 1){
			model.addAttribute("emailUsed", null);
			return "Seller/sellerLogin";
		}else{
			return "Seller/sellerTestFaild";
		}
	}
	
	@RequestMapping(value="/loginSeller",method=RequestMethod.POST)
	public String loginSeller(String sellerEmail,String sellerPassword,HttpSession session,Model model){
		
		Seller seller = sellerService.login(sellerEmail, sellerPassword);
		 if(seller == null){
			 model.addAttribute("logfail", 1);
			 return "Seller/sellerLogin";
		 }else{
			 model.addAttribute("logfail", null);
			 session.setAttribute("seller", seller);
			 return "Seller/sellerhome";
		 }
	}
	
	@RequestMapping(value="/sellerHome",method=RequestMethod.GET)
	public String sellHome(){
		return "Seller/sellerhome";
	}
	
	
	
	@RequestMapping(value="/test",method=RequestMethod.GET)
	public String sellwe(){
		return "Seller/sellerTestSucceed";
	}
	
	@RequestMapping(value="/testSellerEmail",method=RequestMethod.GET)
	public @ResponseBody int testSellerEmail(String sellerEmail){
		
		int result = sellerService.validation(sellerEmail);
		
		return result;
		
	}
}
