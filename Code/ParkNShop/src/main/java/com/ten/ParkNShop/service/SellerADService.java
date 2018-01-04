package com.ten.ParkNShop.service;

import java.util.List;

import com.ten.ParkNShop.entity.AD;

public interface SellerADService {
	
	// select ads by sellerId
    List<AD> selectProductAD(int sellerId);
    
    //select shopAD by sellerId
    List<AD> selectShopAD(int sellerId);

}
