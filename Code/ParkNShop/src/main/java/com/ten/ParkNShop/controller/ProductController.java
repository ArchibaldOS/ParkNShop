package com.ten.ParkNShop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.ten.ParkNShop.dto.FileUtil;
import com.ten.ParkNShop.dto.Page;
import com.ten.ParkNShop.entity.Product;
import com.ten.ParkNShop.entity.Seller;
import com.ten.ParkNShop.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/addProduct",method=RequestMethod.GET)
	public String add(){
		return "productAdd";
	}
	
	
	@RequestMapping(value = "/productAdd", method = RequestMethod.POST)
	public String addProduct(String productName, int productType, float productPrice, int storeCount,
			String productIntroduction,@RequestParam(required = false) CommonsMultipartFile file, HttpSession session) throws Exception {

		if (file.getSize() > 0) {
			String path = session.getServletContext().getRealPath("upload\\productPicture\\");
			System.out.println(path);
			String filePath = FileUtil.uploadFile(file, path);
			Product product = new Product();
			int sellerId = ((Seller)session.getAttribute("seller")).getSellerId();
			product.setSellerId(sellerId);
			product.setProductName(productName);
			product.setProductType(productType);
			product.setProductPrice(productPrice);
			product.setStoreCount(storeCount);
			product.setProductIntroduction(productIntroduction);
			product.setProductPicture(filePath);
			if (productName != null && !"".equals(productName) && filePath != null && !"".equals(filePath)
					&& ( productService.addProduct(product)) != 0) {

				return "redirect:/productList";
			}
		}
		return "sellerTestFaild";
	}
	
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String listProduct(HttpSession session,Model model){
		
		int sellerId = ((Seller)session.getAttribute("seller")).getSellerId();
		
		Page page = productService.getProducts(sellerId);
		
		
		model.addAttribute("page", page);
		
		return "sellershop";
		
	}
	
	
	
	/*@RequestMapping(value = "/modifyProduct", method = RequestMethod.POST)
	public String updateProduct(int productId,String productName, int productType, float productPrice, int storeCount,
			String productIntroduction, CommonsMultipartFile file, HttpServletRequest request) throws Exception {

		if (file.getSize() > 0) {
			String path = request.getSession().getServletContext().getRealPath("upload\\head\\");
			System.out.println(path);
			String filePath = FileUtil.uploadFile(file, path);
			Product product = new Product();
			product.setProductName(productName);
			product.setProductType(productType);
			product.setProductPrice(productPrice);
			product.setStoreCount(storeCount);
			product.setProductIntroduction(productIntroduction);
			product.setProductPicture(filePath);
			if (productName != null && !"".equals(productName) && filePath != null && !"".equals(filePath)
					&& ( productService.addProduct(product)) != 0) {

				return "SuccessUploadingProduct";
			}
		}
		return "UploadingProduct";
	}*/
	
	
}
