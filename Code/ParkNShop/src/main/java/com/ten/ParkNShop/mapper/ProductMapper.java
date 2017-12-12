package com.ten.ParkNShop.mapper;

import java.util.List;

import com.ten.ParkNShop.entity.Product;

public interface ProductMapper {
	
	int addProduct(Product product);

	int count(int sellerId);

	List<Product> findAllBySellerId(int sellerId);

}
