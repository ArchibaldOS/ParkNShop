package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.entity.Commission;
import com.ten.ParkNShop.service.AdminCommissionService;
import com.ten.ParkNShop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
public class AdminSalesManagementController {
    @Autowired
    AdminCommissionService adminCommissionService;

    @Autowired
    AdminService adminService;

    @RequestMapping("/AdminSalesManagement")
    public String adminSalesManagement(){
        return "Admin/AdminSalesManagement";
    }

    /**
     * @Author tad
     * @Date created in 2:57 PM 12/16/2017
     * @Description 请求修改佣金比例的页面
     *
     * @params []
     * @return java.lang.String
     */
    @RequestMapping("/AdminSalesModifyCommission")
    public String adminSalesModifyCommission(Model model){
        model.addAttribute("oldCommission", adminCommissionService.selectLastCommission());
        return "Admin/AdminSalesModifyCommission";
    }

    @RequestMapping("/AdminSalesModifyCommissionDo")
    public String adminSalesModifyCommissionDo(HttpServletRequest httpServletRequest){
        String submitAdminAccount = httpServletRequest.getParameter("adminAccount");
        String submitAdminPassWord = httpServletRequest.getParameter("adminPassWord");
        float newCommission = Float.valueOf(httpServletRequest.getParameter("newCommission"));
        // 如果密码争正确，进行新的佣金比例的查询
        // TODO 密码错误的处理
        if(submitAdminPassWord.equals(adminService.selectAdminPassword(submitAdminAccount))){
            adminCommissionService.insertLast(newCommission, submitAdminAccount, new java.sql.Date(new Date().getTime()));
        }
        return "redirect:/AdminSalesModifyCommission";
    }
    /**
     * @Author tad
     * @Date created in 2:45 PM 12/17/2017
     * @Description 进行佣金比例的历史记录查询
     *
     * @params [httpServletRequest, model]
     * @return java.lang.String
     */
    @RequestMapping("/AdminSalesCommissionHistory")
    public String adminSalesCommissionHistory(HttpServletRequest httpServletRequest, Model model){
        if(httpServletRequest.getParameter("start") == null){
            model.addAttribute("commissions", adminCommissionService.selectSomneCommission(0, 20));
        }else{
            int start = Integer.valueOf(httpServletRequest.getParameter("start"));
            int pageSize = Integer.valueOf(httpServletRequest.getParameter("pageSize"));
            model.addAttribute("commissions", adminCommissionService.selectSomneCommission(start, pageSize));
        }
        return "Admin/AdminSalesCommissionHistory";
    }
}
