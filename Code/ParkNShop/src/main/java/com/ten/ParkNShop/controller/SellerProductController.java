package com.ten.ParkNShop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.ten.ParkNShop.util.FileUtil;
import com.ten.ParkNShop.util.Page;
import com.ten.ParkNShop.entity.Product;
import com.ten.ParkNShop.entity.Seller;
import com.ten.ParkNShop.service.SellerProductService;

@Controller
public class SellerProductController {

	@Autowired
	private SellerProductService sellerProductService;
	
	@RequestMapping(value="/addProduct",method=RequestMethod.GET)
	public String add(){
		return "Seller/productAdd";
	}
	
	@RequestMapping(value="/productUpdate",method=RequestMethod.GET)
	public String update(int productId,Model model){
		model.addAttribute("product", sellerProductService.getProductById(productId));
		return "Seller/productUpdate";
	}
	
	@RequestMapping(value = "/productAdd", method = RequestMethod.POST)
	public String addProduct(String productName, int productType, float productPrice, int storeCount,
			String productIntroduction,@RequestParam(required = false) CommonsMultipartFile file, HttpSession session) throws Exception {

		if (file.getSize() > 0) {
			String path = session.getServletContext().getRealPath("/upload/productPicture");
			String filePath = FileUtil.uploadFile(file, path);
			Product product = new Product();
			int sellerId = ((Seller)session.getAttribute("seller")).getsellerId();
			product.setSellerId(sellerId);
			product.setProductName(productName);
			product.setProductType(productType);
			product.setProductPrice(productPrice);
			product.setStoreCount(storeCount);
			product.setProductIntroduction(productIntroduction);
			product.setProductPicture(filePath);
			if (productName != null && !"".equals(productName) && filePath != null && !"".equals(filePath)
					&& ( sellerProductService.addProduct(product)) != 0) {

				return "redirect:/sellerProductList";
			}
		}
		return "Seller/sellerTestFaild";
	}
	
	@RequestMapping(value = "/sellerProductList", method = RequestMethod.GET)
	public String listProduct(HttpSession session,Model model){
		
		int sellerId = ((Seller)session.getAttribute("seller")).getsellerId();
		
		Page page = sellerProductService.getProducts(sellerId);
		
		model.addAttribute("seller",session.getAttribute("seller"));
		if(page.getList().size()>0)
			model.addAttribute("page", page);
		else
			model.addAttribute("page", null);
		
		return "Seller/sellershop";
		
	}
	
	@RequestMapping(value = "/sellerShopHome", method = RequestMethod.GET)
	public String shopHome(HttpSession session,Model model,@RequestParam("sellerId") int sellerId,@RequestParam(name="cur", defaultValue="1") int cur){
		
		Page page = sellerProductService.getProductsByPage(sellerId,cur);
		
		model.addAttribute("page", page);
		model.addAttribute("sellerId", sellerId);
		
		return "Seller/shopHome";
		
	}
	
	@RequestMapping(value="/shopProductsList",method=RequestMethod.GET)
	public @ResponseBody Page listProducts(@RequestParam(name="cur", defaultValue="1") int cur,@RequestParam("sellerId") int sellerId){
		
		
		Page page = sellerProductService.getProductsByPage(sellerId,cur);
	
		return page;
	}
	
	@RequestMapping(value = "/sellerProduct")
	public String product(HttpSession session,Model model){
		
		Seller seller = (Seller)session.getAttribute("seller");
		
		int status = seller.getShopStatus();
		if(status == 1){
			model.addAttribute("status", null);
			return "forward:/sellerProductList";
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
	
	@RequestMapping(value = "/deleteProduct", method = RequestMethod.GET)
	public String deleteProduct(@RequestParam("productId") int productId){
		
		sellerProductService.deleteProduct(productId);
		
		return "forward:/sellerProductList";
		
	}
	
	
	@RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
	public String updateProduct(int productId,String productName, int productType, float productPrice, int storeCount,
			String productIntroduction,@RequestParam(required = false) CommonsMultipartFile file, HttpSession session) throws Exception {

		if (file.getSize() > 0) {
			String path = session.getServletContext().getRealPath("/upload/productPicture");
			String filePath = FileUtil.uploadFile(file, path);
			Product product = sellerProductService.getProductById(productId);
			product.setProductName(productName);
			product.setProductType(productType);
			product.setProductPrice(productPrice);
			product.setStoreCount(storeCount);
			product.setProductIntroduction(productIntroduction);
			product.setProductPicture(filePath);
			if (productName != null && !"".equals(productName) && filePath != null && !"".equals(filePath)
					&& ( sellerProductService.updateProduct1(product)) != 0) {

				return "redirect:/sellerProductList";
			}
		}else{
			Product product2 = sellerProductService.getProductById(productId);
			product2.setProductName(productName);
			product2.setProductType(productType);
			product2.setProductPrice(productPrice);
			product2.setStoreCount(storeCount);
			product2.setProductIntroduction(productIntroduction);
			if(sellerProductService.updateProduct2(product2) != 0 )
				return "redirect:/sellerProductList";
		}
		
		return "Seller/UploadingProduct";
	}
	
	
}
