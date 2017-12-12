package com.ten.ParkNShop.service;

import com.ten.ParkNShop.entity.*;

import java.util.List;

import com.ten.ParkNShop.entity.Buyer;
import com.ten.ParkNShop.entity.ProductAD;
import java.util.List;

public interface BuyerService {

    public List<ProductAD> findProducts(String productName);
    int buyerRegister(Buyer buyer);

    Buyer buyerLogin(String buyerAccount,String buyerPassword);

}

