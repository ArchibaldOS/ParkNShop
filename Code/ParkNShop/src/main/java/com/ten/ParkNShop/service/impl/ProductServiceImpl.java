package com.ten.ParkNShop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ten.ParkNShop.dto.Page;
import com.ten.ParkNShop.entity.Product;
import com.ten.ParkNShop.mapper.ProductMapper;
import com.ten.ParkNShop.service.ProductService;


@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper productMapper; 

	public int addProduct(Product product) {
		
		return productMapper.addProduct(product);
	}

	public Page getProducts(int sellerId) {
		Page page = new Page(sellerId);
		
		int count = productMapper.count(sellerId);
		
		List<Product> products = productMapper.findAllBySellerId(sellerId);
		
		page.setCount(count);
		page.setList(products);
		
		return page;
	}
	

}
