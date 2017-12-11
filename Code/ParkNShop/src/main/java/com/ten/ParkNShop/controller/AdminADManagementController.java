package com.ten.ParkNShop.controller;


import com.ten.ParkNShop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminADManagementController {

    @Autowired
    private AdminService adminService;


    @RequestMapping("/AdminADTop5StoriesManagement")
    public String adminADTop5StoriesManagement(){
        return "Admin/AdminADTop5StoriesManagement";
    }
    @RequestMapping("/AdminADManagementHistory")
    public String adminADManagementHistory(){
        return "Admin/AdminADManagementHistory";
    }
}
