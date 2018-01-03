package com.ten.ParkNShop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ten.ParkNShop.entity.Seller;
import com.ten.ParkNShop.service.SellerIndexService;
import com.ten.ParkNShop.service.SellerProductService;

@Controller
public class SellerIndexController {
	
	@Autowired
	private SellerIndexService sellerIndexService;
	
	@Autowired
	private SellerProductService sellerProductService;
	
	@RequestMapping(value="/sellerLogin",method=RequestMethod.GET)
	public String seller(){
		return "Seller/sellerLogin";
	}
	
	@RequestMapping(value="/sellerRegister",method=RequestMethod.GET)
	public String sell(){
		return "Seller/sellerRegister";
	}
	
	@RequestMapping(value="/sellerUpdate",method=RequestMethod.GET)
	public String sellupdate(HttpSession session,Model model){
		model.addAttribute("seller", session.getAttribute("seller"));
		return "Seller/sellerInfoUpdate";
	}
	
	@RequestMapping(value="/sellerLogout",method=RequestMethod.GET)
	public String sellLogout(HttpSession session){
		session.setAttribute("seller", null);
		return "redirect:index.jsp";
	}

	@RequestMapping(value="/registSeller",method=RequestMethod.POST)
	public String regSeller(String sellerName, String shopName, String sellerPassword, String sellerPhone,String sellerEmail, String sellerAddress, String shopIntroduction,Model model){
		
		Seller seller = new Seller();
		
		seller.setSellerName(sellerName);
		seller.setShopName(shopName);
		seller.setSellerPassword(sellerPassword);
		seller.setSellerEmail(sellerEmail);
		seller.setSellerPhone(sellerPhone);
		seller.setSellerAddress(sellerAddress);
		seller.setShopIntroduction(shopIntroduction);
		int resultEmail = sellerIndexService.validation(sellerEmail);
		if(resultEmail!=0){
			model.addAttribute("emailUsed", 1);
			return "Seller/sellerRegister";
		}
		int result = sellerIndexService.sellerRegister(seller);
		if(result == 1){
			model.addAttribute("emailUsed", null);
			return "Seller/sellerLogin";
		}else{
			return "Seller/sellerRegister";
		}
	}
	
	@RequestMapping(value="/updateSeller",method=RequestMethod.POST)
	public String updateSeller(String sellerName, String shopName, String sellerPhone,String sellerEmail,String sellerAddress,String shopIntroduction,Model model,HttpSession session){
		
		Seller seller = (Seller)session.getAttribute("seller");
		seller.setSellerName(sellerName);
		seller.setShopName(shopName);
		seller.setSellerPhone(sellerPhone);
		seller.setSellerAddress(sellerAddress);
		seller.setShopIntroduction(shopIntroduction);
		int resultEmail = sellerIndexService.validation(sellerEmail);
		if(resultEmail!=0 && !seller.getSellerEmail().equals(sellerEmail)){
			model.addAttribute("emailUsed", 1);
			model.addAttribute("seller",session.getAttribute("seller"));
			return "Seller/sellerInfoUpdate";
		}
		seller.setSellerEmail(sellerEmail);
		int result = sellerIndexService.sellerUpdate(seller);
		if(result == 1){
			model.addAttribute("emailUsed", null);
			session.setAttribute("seller", seller);
			return "Seller/sellerhome";
		}else{
			return "Seller/sellerInfoUpdate";
		}
	}
	
	@RequestMapping(value="/loginSeller",method=RequestMethod.POST)
	public String loginSeller(String sellerEmail,String sellerPassword,HttpSession session,Model model){
		
		Seller seller = sellerIndexService.login(sellerEmail, sellerPassword);
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
	public String sellHome(HttpSession session){
		session.setAttribute("seller", session.getAttribute("seller"));
		return "Seller/sellerhome";
	}
	
	@RequestMapping(value="/sellerFontHome",method=RequestMethod.GET)
	public String sellFontHome(int sellerId,Model model){
		model.addAttribute("shop", sellerIndexService.getSellerById(sellerId));
		model.addAttribute("products",sellerProductService.getProducts(sellerId));
		return "Seller/sellerFontHome";
	}
	
	
	
}
