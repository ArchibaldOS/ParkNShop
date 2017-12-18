package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.entity.Commission;
import com.ten.ParkNShop.service.AdminCommissionService;
import com.ten.ParkNShop.service.AdminOrderService;
import com.ten.ParkNShop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;

@Controller
public class AdminSalesManagementController {
    @Autowired
    AdminCommissionService adminCommissionService;

    @Autowired
    AdminService adminService;

    @Autowired
    AdminOrderService adminOrderService;

    @RequestMapping("/AdminSalesManagement")
    public String adminSalesManagement(HttpServletRequest httpServletRequest, Model model){
        // 查看收入的类型 sales 与 ads
        String type = httpServletRequest.getParameter("type");
        // 时间范围 一天 一周 一月 一年
        String timeType = httpServletRequest.getParameter("timeType");

        if(httpServletRequest.getParameter("type") != null){

            if(type.equals("sales")){

            }else{

            }
        }
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
    @RequestMapping("/testChartJS")
    public String testChartJS(Model model){
        model.addAttribute("type", "sales");
        model.addAttribute("timeType", "daily");
        String[] strs = {"1","2","3","4","5","6"};
        model.addAttribute("label",strs);
        int[] data = {1, 2, 5 , 7 , 9, 10};
        model.addAttribute("data", data);
        return "Admin/testChartJS";
    }
}
