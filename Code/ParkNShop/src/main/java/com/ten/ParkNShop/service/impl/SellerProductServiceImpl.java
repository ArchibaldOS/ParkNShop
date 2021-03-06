package com.ten.ParkNShop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ten.ParkNShop.util.Page;
import com.ten.ParkNShop.entity.Product;
import com.ten.ParkNShop.mapper.ProductMapper;
import com.ten.ParkNShop.service.SellerProductService;


@Service
public class SellerProductServiceImpl implements SellerProductService {
	
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

	public int deleteProduct(int productId) {
		
		return productMapper.delete(productId);
	}

	public Product getProductById(int productId) {
		
		return productMapper.findByProductId(productId);
	}

	public int updateProduct1(Product product) {
		
		return productMapper.updateProduct1(product);
	}

	public int updateProduct2(Product product) {
		
		return productMapper.updateProduct2(product);
	}

	public Page getProductsByPage(int sellerId, int cur) {
		
		Page page = new Page(cur);
		
		int count = productMapper.count(sellerId);
		
		List<Product> products = productMapper.sellerFindByPage(sellerId,page.getOffset(),page.getSize());
		
		page.setCount(count);
		page.setList(products);
		
		return page;
	}
	

}
