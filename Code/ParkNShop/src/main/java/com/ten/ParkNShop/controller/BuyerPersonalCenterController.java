package com.ten.ParkNShop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class BuyerPersonalCenterController {
    @RequestMapping("/buyerPersonalCenter")
    public String buyerPersonalCenter(HttpSession session){
        if (session.getAttribute("Buyer")==null){
            return "Buyer/BuyerLogin";
        }
        return "Buyer/BuyerPersonalCenter";
    }
}
