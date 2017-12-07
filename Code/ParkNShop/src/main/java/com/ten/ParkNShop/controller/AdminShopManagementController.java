package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author: Archibald.
 * @Description:
 * @version:
 * @time: 12/6/2017.
 */
@Controller
public class AdminShopManagementController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/AdminShopList")
    public String adminShopList(){
        return "Admin/AdminShopList";
    }
    @RequestMapping("/AdminSearchShop")
    public String adminSearchShop(){
        return "Admin/AdminSearchShop";
    }
    @RequestMapping("/AdminBlackList")
    public String adminBlackList(){
        return "Admin/AdminBlackList";
    }
}
