package com.ten.ParkNShop.service;

import com.ten.ParkNShop.util.Page;
import com.ten.ParkNShop.entity.Product;

public interface SellerProductService {
	
	public int addProduct(Product product);

	public Page getProducts(int sellerId);
	

}
