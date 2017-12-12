package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.entity.Buyer;
import com.ten.ParkNShop.service.AdminService;
import com.ten.ParkNShop.service.BuyerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class BuyerController {
    @Autowired
    private BuyerService buyerService;

    /**
     * @Author: Archibald
     * @Date: 4:36 PM 12/6/2017
     * @Description: 登录
     */

    @RequestMapping("/BuyerLogin")
    public String buyerLogin(){
        return "Buyer/BuyerLogin";
    }

    @RequestMapping("/BuyerRegister")
    public String buyerRegister(){
        return "Buyer/BuyerRegister";
    }
    @RequestMapping("/SearchProducts")
    public String listProducts(){
        return "Buyer/ListProducts";
    }
    @RequestMapping("/BuyerLoginClick")
    public String buyerLoginClick(String buyerAccount, String buyerPassword,HttpSession session){

        if (buyerService.buyerLogin(buyerAccount,buyerPassword)==null){
            return "redirect:/BuyerLogin";
        }
        session.setAttribute("Buyer",buyerService.buyerLogin(buyerAccount,buyerPassword));
        return "redirect:index.jsp";
    }

    @RequestMapping("/BuyerRegisterClick")
    public String buyerRegisterClick(String buyerName,String buyerAddress,String buyerPhone,String buyerAccount, String buyerPassword,HttpSession session){

        Buyer buyer = new Buyer();

        buyer.setBuyerName(buyerName);
        buyer.setBuyerAddress(buyerAddress);
        buyer.setBuyerPassword(buyerPassword);
        buyer.setBuyerAccount(buyerAccount);
        buyer.setBuyerPhone(buyerPhone);

        int result = buyerService.buyerRegister(buyer);
        if(result == 1){
            return "redirect:/BuyerLogin";
        }else{
            return "redirect:/BuyerRegister";
        }
    }

}
