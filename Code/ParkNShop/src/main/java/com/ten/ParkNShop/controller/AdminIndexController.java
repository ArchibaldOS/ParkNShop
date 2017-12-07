package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

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
    public String adminOrderManagement(){
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

    /**
    * @Author: Archibald
    * @Date: 4:36 PM 12/6/2017
    * @Description: 登录
    */
    @RequestMapping("/AdminLoginClick")
    public String adminLoginClick(String username, String password, HttpSession httpSession){
        if (adminService.selectAdminPassword(username) == null){
            return "redirect:/AdminLogin";
        }
        String adminPassword = adminService.selectAdminPassword(username);
        int adminStatus = adminService.selectAdminStatus(username);

        if ((adminPassword.equals(password))&&(adminStatus == 0)){
//            model.addAttribute("adminAccount",username);//model传值不可以重定向
            httpSession.setAttribute("adminAccount",username);
            int i = adminService.updateAdminStatusToActive(username);
            return "redirect:/AdminIndex";
        }
        return "redirect:/AdminLogin";
    }

    @RequestMapping("/AdminLogout")
    public String adminLogout(HttpSession httpSession){
        String adminAccount = (String) httpSession.getAttribute("adminAccount");
        int i = adminService.updateAdminStatusToInactive(adminAccount);
        httpSession.invalidate();
        return "redirect:/AdminLogin";
    }
}
