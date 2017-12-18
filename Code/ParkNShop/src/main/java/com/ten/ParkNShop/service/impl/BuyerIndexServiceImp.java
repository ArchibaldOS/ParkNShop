package com.ten.ParkNShop.service.impl;


import com.ten.ParkNShop.entity.Buyer;
import com.ten.ParkNShop.entity.Product;
import com.ten.ParkNShop.entity.SearchInfo;
import com.ten.ParkNShop.mapper.BuyerMapper;
import com.ten.ParkNShop.service.BuyerIndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BuyerIndexServiceImp implements BuyerIndexService {
    @Autowired
    private BuyerMapper buyerMapper;


    public int buyerRegister(Buyer buyer) {
        int result = buyerMapper.buyerRegister(buyer);
        return result;
    }

    public Buyer buyerLogin(String buyerAccount, String buyerPassword) {
        Buyer buyer = buyerMapper.findBuyer(buyerAccount, buyerPassword);
        return buyer;
    }


}