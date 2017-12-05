package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author: Archibald.
 * @Description:
 * @version:
 * @time: 12/5/2017.
 */
@Controller
public class AdminIndexController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/AdminLogin")
    public String adminLogin(){
        return "Admin/AdminLogin";
    }
    @RequestMapping("/AdminIndex")
    public String adminIndex(){
        return "Admin/AdminIndex";
    }
    @RequestMapping("/AdminShopManagement")
    public String adminShopManagement(){
        return "Admin/AdminShopManagement";
    }

    @RequestMapping("/AdminCustomerManagement")
    public String adminCustomerManagement(){
        return "Admin/AdminCustomerManagement";
    }
    @RequestMapping("/AdminOrderManagement")
    public String adminOrderrManagement(){
        return "Admin/AdminOrderManagement";
    }
    @RequestMapping("/AdminADManagement")
    public String adminADManagement(){
        return "Admin/AdminADManagement";
    }
    @RequestMapping("/AdminSalesManagement")
    public String adminSalesManagement(){
        return "Admin/AdminSalesManagement";
    }
    /**
    * @Author: Archibald
    * @Date: 4:06 PM 12/5/2017
    * @Description: 以上为跳转至管理员各页面
    */
}
