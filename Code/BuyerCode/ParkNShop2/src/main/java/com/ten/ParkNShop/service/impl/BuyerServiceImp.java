package com.ten.ParkNShop.service.impl;


import com.ten.ParkNShop.entity.Buyer;
import com.ten.ParkNShop.entity.ProductAD;
import com.ten.ParkNShop.entity.Seller;
import com.ten.ParkNShop.mapper.BuyerMapper;
import com.ten.ParkNShop.service.BuyerService;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BuyerServiceImp implements BuyerService {
    @Autowired
    private BuyerMapper buyerMapper;

    public List<ProductAD> findProducts(String productName) {
        return null;
    }

    public int buyerRegister(Buyer buyer) {
        int result = buyerMapper.buyerRegister(buyer);
        return result;
    }

    public Buyer buyerLogin(String buyerAccount, String buyerPassword) {
        Buyer buyer = buyerMapper.findBuyer(buyerAccount, buyerPassword);
        return buyer;
    }
}