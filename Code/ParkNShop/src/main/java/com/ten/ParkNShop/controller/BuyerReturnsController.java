package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.service.BuyerReturnsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

public class BuyerReturnsController {
    @Autowired
    private BuyerReturnsService buyerReturnsService;
    @RequestMapping("/buyerReturns")
    public String buyerReturns(){
        return "Buyer/buyerReturns";
    }
    @RequestMapping("/buyerReturnsConfirm")
    public String buyerReturnsConfirm(int orderId,@RequestParam String action){
        if (action.equals("RefundOnly")){
            buyerReturnsService.refundOnly(orderId);
        }else if (action.equals("ReturnAndRefund")){
            buyerReturnsService.returnAndRefund(orderId);
        }
        return "forward:/viewMyOrdersClick";
    }
}
