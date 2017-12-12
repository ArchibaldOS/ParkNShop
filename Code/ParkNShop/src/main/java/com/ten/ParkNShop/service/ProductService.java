package com.ten.ParkNShop.service;

import com.ten.ParkNShop.dto.Page;
import com.ten.ParkNShop.entity.Product;

public interface ProductService {
	
	public int addProduct(Product product);

	public Page getProducts(int sellerId);
	

}
