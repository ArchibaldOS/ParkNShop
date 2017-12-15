package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminSalesManagementController {


    @RequestMapping("/AdminSalesManagement")
    public String adminSalesManagement(){
        return "Admin/AdminSalesManagement";
    }

    @RequestMapping("/AdminSalesModifyCommision")
    public String adminSalesModifyCommision(){
        return "Admin/AdminSalesModifyCommision";
    }
    @RequestMapping("/AdminSalesCommisionHistory")
    public String adminSalesCommisionHistory(){
        return "Admin/AdminSalesCommisionHistory";
    }
}
