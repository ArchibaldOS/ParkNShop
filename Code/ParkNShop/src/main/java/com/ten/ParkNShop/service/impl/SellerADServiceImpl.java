package com.ten.ParkNShop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ten.ParkNShop.entity.AD;
import com.ten.ParkNShop.mapper.ADMapper;
import com.ten.ParkNShop.service.SellerADService;

@Service
public class SellerADServiceImpl implements SellerADService {

	@Autowired
	private ADMapper adMapper;
	
	@Override
	public List<AD> selectShopAD(int sellerId) {
		
		return adMapper.selectShopAD(sellerId);
	}

	@Override
	public List<AD> selectProductAD(int sellerId) {
		
		return adMapper.selectProductAD(sellerId);
	}

}
