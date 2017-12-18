package com.ten.ParkNShop.service;

import com.ten.ParkNShop.entity.*;

import java.util.List;

import com.ten.ParkNShop.entity.Buyer;
import java.util.List;

public interface BuyerIndexService {

    int buyerRegister(Buyer buyer);

    Buyer buyerLogin(String buyerAccount,String buyerPassword);



}

