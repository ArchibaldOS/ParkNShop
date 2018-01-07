package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.entity.Buyer;
import com.ten.ParkNShop.service.BuyerIndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class BuyerIndexController {
    @Autowired
    private BuyerIndexService buyerService;


    @RequestMapping("/")
    public String index(){
        return "redirect:/BuyerIndex";
    }
    /**
     * @Author: Archibald
     * @Date: 4:36 PM 12/6/2017
     * @Description: 登录
     */
    @RequestMapping("/PersonalOrders")
    public String personalOrders(){
        return "Buyer/PersonalOrders";
    }

    @RequestMapping("/BuyerCart")
    public String buyerCart(){
        return "Buyer/BuyerCart";
    }

    @RequestMapping("/BuyerLogin")
    public String buyerLogin(){
        return "Buyer/BuyerLogin";
    }

    @RequestMapping("/BuyerLogout")
    public String buyerLogout(HttpSession session){
        session.invalidate();
        return "redirect:/BuyerIndex";
    }

    @RequestMapping("/BuyerRegister")
    public String buyerRegister(){
        return "Buyer/BuyerRegister";
    }
    @RequestMapping("/BuyerProductDetail")
    public String buyerProductDetail(){
        return "Buyer/BuyerProductDetail";
    }
    @RequestMapping("/ContactManager")
    public String contactManager(){
        return "Buyer/ContactManager";
    }

    @RequestMapping("/BuyerLoginClick")
    public String buyerLoginClick(String buyerAccount, String buyerPassword,HttpSession session){

        if (buyerService.buyerLogin(buyerAccount,buyerPassword)==null){
            return "redirect:/BuyerLogin";
        }
        session.setAttribute("Buyer",buyerService.buyerLogin(buyerAccount,buyerPassword));
        return "redirect:/BuyerIndex";
    }

    @RequestMapping("/BuyerRegisterClick")
    public String buyerRegisterClick(String buyerName,String buyerAddress,String buyerPhone,String buyerAccount, String buyerPassword,HttpSession session){

        Buyer buyer = new Buyer();

        buyer.setbuyerName(buyerName);
        buyer.setbuyerAddress(buyerAddress);
        buyer.setbuyerPassword(buyerPassword);
        buyer.setbuyerAccount(buyerAccount);
        buyer.setbuyerPhone(buyerPhone);

        int result = buyerService.buyerRegister(buyer);
        if(result == 1){
            return "redirect:/BuyerLogin";
        }else{
            return "redirect:/BuyerRegister";
        }
    }

}
