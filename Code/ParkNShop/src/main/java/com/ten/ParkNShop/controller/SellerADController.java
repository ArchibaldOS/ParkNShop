package com.ten.ParkNShop.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.ten.ParkNShop.entity.AD;
import com.ten.ParkNShop.entity.Seller;
import com.ten.ParkNShop.service.AdminADService;
import com.ten.ParkNShop.service.SellerADService;
import com.ten.ParkNShop.service.SellerProductService;
import com.ten.ParkNShop.util.FileUtil;
import com.ten.ParkNShop.util.Page;


@Controller
public class SellerADController {
	
	@Autowired
	private SellerProductService sellerProductService;
	
	@Autowired
	private SellerADService sellerADService;
	
	@Autowired
	private AdminADService adminADService;
	
	@RequestMapping(value="/sellerADPage", method=RequestMethod.GET)
	public String sellerADPage(HttpSession session,Model model){
		Seller seller = (Seller)session.getAttribute("seller");
		model.addAttribute("seller", seller);
		model.addAttribute("shopAD", sellerADService.selectShopAD(seller.getsellerId()));
		return "Seller/sellerShopAD";
	}
	
	@RequestMapping(value="/sellerAD", method=RequestMethod.POST)
	public String sellerAD(int otherId,String ADName,@RequestParam(required = false) CommonsMultipartFile file,String ADDescription,int ADTime,HttpSession session,Model model) throws Exception{
		AD ad = new AD();
		Seller seller = (Seller)session.getAttribute("seller");
		ad.setADDescription(ADDescription);
		ad.setAdminId(1);
		ad.setADName(ADName);
		ad.setADStartDate(new Date());
		ad.setADPrice((float)ADTime * 200);
		ad.setADStatus(1);
		ad.setADTime(ADTime);
		ad.setADType(2);
		ad.setOtherId(seller.getsellerId());
		if(file.getSize() > 0){
			String path = session.getServletContext().getRealPath("/upload/productPicture");
			String filePath = FileUtil.uploadFile(file, path);
			ad.setADPhotoUrl(filePath);
			adminADService.insertAD(ad);
			
		}
		return "forward:/sellerADPage";
	}
	
	@RequestMapping(value="/sellerProductADPage",method=RequestMethod.GET)
	public String sellerProductADPage(HttpSession session,Model model){
		Seller seller = (Seller)session.getAttribute("seller");
		Page page = sellerProductService.getProducts(seller.getsellerId());
		model.addAttribute("products", page);
		return "Seller/sellerShopAD";
	}
	
}
