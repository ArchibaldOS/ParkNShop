package com.ten.ParkNShop.service;

import com.ten.ParkNShop.entity.Seller;

public interface SellerService {
	
	int sellerRegister(Seller seller);
	
	Seller login(String sellerEmail, String sellerPassword);

	int validation(String sellerEmail);
	

}
