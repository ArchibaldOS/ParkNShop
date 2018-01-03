package com.ten.ParkNShop.service;

import com.ten.ParkNShop.entity.Seller;

public interface SellerIndexService {
	
	int sellerRegister(Seller seller);
	
	Seller login(String sellerEmail, String sellerPassword);

	int validation(String sellerEmail);

	int sellerUpdate(Seller seller);
	
	Seller getSellerById(int sellerId);

}
