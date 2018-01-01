package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.service.BuyerReturnsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

public class BuyerReturnsController {
    @Autowired
    private BuyerReturnsService buyerReturnsService;
    @RequestMapping("/buyerReturns")
    public String buyerReturns(){
        return "Buyer/buyerReturns";
    }
    @RequestMapping("/buyerReturnsConfirm")
    public String buyerReturnsConfirm(int orderId,int value){
        if (value == 0){
            buyerReturnsService.refundOnly(orderId);
        }else {
            buyerReturnsService.returnAndRefund(orderId);
        }
        return "forward:/viewMyOrdersClick";
    }
}
