package com.ten.ParkNShop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ten.ParkNShop.entity.Seller;
import com.ten.ParkNShop.mapper.SellerMapper;
import com.ten.ParkNShop.service.SellerIndexService;

@Service
public class SellerIndexServiceImpl implements SellerIndexService {
	
	@Autowired
	private SellerMapper sellerMapper;

	public int sellerRegister(Seller seller) {
		int result = sellerMapper.sellerRegister(seller);
		return result;
	}

	public Seller login(String sellerEmail, String sellerPassword) {
		Seller seller = sellerMapper.findBySellerEmail(sellerEmail, sellerPassword);
		return seller;
	}

	public int validation(String sellerEmail) {
		return sellerMapper.findByEmail(sellerEmail);
	}

	public int sellerUpdate(Seller seller) {
		return sellerMapper.updateBySellerId(seller);
	}

	
}
