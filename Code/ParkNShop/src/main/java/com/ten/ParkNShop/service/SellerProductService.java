package com.ten.ParkNShop.service;

import com.ten.ParkNShop.util.Page;
import com.ten.ParkNShop.entity.Product;

import java.util.List;

public interface SellerProductService {
	
	public int addProduct(Product product);

	public Page getProducts(int sellerId);

	public int deleteProduct(int productId);
	
	public Product getProductById(int productId);

	public int updateProduct1(Product product);
	
	public int updateProduct2(Product product);

	public Page getProductsByPage(int sellerId, int cur);

	
}
