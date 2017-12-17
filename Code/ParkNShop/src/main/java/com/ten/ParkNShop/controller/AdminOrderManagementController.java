package com.ten.ParkNShop.controller;

import com.sun.org.apache.xpath.internal.SourceTree;
import com.ten.ParkNShop.entity.Order;
import com.ten.ParkNShop.service.AdminOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * @author: TAD
 * @Description: 控制管理员界面的Order相关操作
 * @version:
 * @time: 12/14/2017
 */
@Controller
public class AdminOrderManagementController  {
    @Autowired
    private AdminOrderService adminOrderService;


    @RequestMapping("/AdminOrderManagement")
    public String adminOrderManagement(HttpServletRequest httpServletRequest, Model model){
        if(httpServletRequest.getParameter("start") == null){
            model.addAttribute("orders", adminOrderService.selectAllOrder(0, 20));
        }else{
            int start = Integer.parseInt(httpServletRequest.getParameter("start"));
            int pageSize = Integer.parseInt(httpServletRequest.getParameter("pageSize"));
            model.addAttribute("orders", adminOrderService.selectAllOrder(start, pageSize));
        }
        return "Admin/AdminOrderManagement";
    }

    @RequestMapping("/AdminOrderSearchByID")
    public String adminOrderSearchByID(){
        return "Admin/AdminOrderSearchByID";
    }

    @RequestMapping("/AdminOrderSearchByIDDo")
    public String adminOrderSearchByIDDo(HttpServletRequest httpServletRequest,Model model){
        int orderId = Integer.parseInt(httpServletRequest.getParameter("orderId"));
        model.addAttribute("order", adminOrderService.selectOrderById(orderId));
        return "Admin/AdminOrderDetail";
    }


    @RequestMapping("/AdminOrderSearchBybuyerId")
    public String adminOrderSearchBybuyerId(){
        return "Admin/AdminOrderSearchBybuyerId";
    }

    @RequestMapping("/AdminOrderSearchBybuyerIdDo")
    public String adminOrderSearchBybuyerIdDo(HttpServletRequest httpServletRequest, Model model){
        int buyerId = Integer.parseInt(httpServletRequest.getParameter("buyerId"));
        // TODO 结果分页 验证 ID
        model.addAttribute("orders", adminOrderService.selectOrderBybuyerId(buyerId, 0, 20));
        return "Admin/AdminOrderSearchResult";
    }

    @RequestMapping("/AdminOrderSearchBysellerId")
    public String adminOrderSearchBysellerId(){
        return "Admin/AdminOrderSearchBysellerId";
    }

    @RequestMapping("/AdminOrderSearchBysellerIdDo")
    public String adminOrderSearchBysellerIdDo(HttpServletRequest httpServletRequest, Model model){
        int sellerId = Integer.parseInt(httpServletRequest.getParameter("sellerId"));
        // TODO 结果分页 验证 ID
        model.addAttribute("orders", adminOrderService.selectOrderBysellerId(sellerId, 0, 20));
        return "Admin/AdminOrderSearchResult";
    }

    @RequestMapping("/AdminOrderSearchByproductId")
    public String adminOrderSearchByproductId(){
        return "Admin/AdminOrderSearchByproductId";
    }

    @RequestMapping("/AdminOrderSearchByproductIdDo")
    public String adminOrderSearchByproductIdDo(HttpServletRequest httpServletRequest, Model model){
        int productId = Integer.parseInt(httpServletRequest.getParameter("productId"));
        // TODO 结果分页 验证 ID
        model.addAttribute("orders", adminOrderService.selectOrderByproductId(productId, 0, 20));
        return "Admin/AdminOrderSearchResult";
    }

    /**
     * @Description 通过一个 orderId 获取一个 Order 的 具体信息
     * @return
     */
    @RequestMapping("/AdminOrderDetail")
    public String adminOrderDetail(HttpServletRequest httpServletRequest,Model model){
        int orderId = Integer.parseInt(httpServletRequest.getParameter("orderId"));
        model.addAttribute("order", adminOrderService.selectOrderById(orderId));
        return "Admin/AdminOrderDetail";
    }

    @RequestMapping("/AdminOrderModify")
    public String adminOrderModify(HttpServletRequest httpServletRequest,Model model){
        int orderId = Integer.parseInt(httpServletRequest.getParameter("orderId"));
        model.addAttribute("order", adminOrderService.selectOrderById(orderId));
        return "Admin/AdminOrderModify";
    }

    /**
     * @Author tad
     * @Date created in 7:55 PM 12/15/2017
     * @Description 实现更改一个订单的具体信息
     *
     * @params [httpServletRequest]
     * @return java.lang.String
     */
    @RequestMapping("/AdminOrderModifyDo")
    public String adminOrderModifyDo(HttpServletRequest httpServletRequest){
        Order order = new Order();
        order.setorderId(Integer.valueOf(httpServletRequest.getParameter("orderId")));
        order.setbuyerId(Integer.valueOf(httpServletRequest.getParameter("buyerId")));
        order.setsellerId(Integer.valueOf(httpServletRequest.getParameter("sellerId")));
        order.setproductId(Integer.valueOf(httpServletRequest.getParameter("productId")));
        order.setCount(Integer.valueOf(httpServletRequest.getParameter("count")));
        order.settotalPrice(Float.valueOf(httpServletRequest.getParameter("totalPrice")));
        order.setAddress(httpServletRequest.getParameter("address"));
        order.setorderStatus(Integer.valueOf(httpServletRequest.getParameter("orderStatus")));
        // 将订单的时间设置为当前时间
        order.setorderTime(new java.sql.Date(new Date().getTime()));

        adminOrderService.updateOrder(order);
        System.out.println(order);
        // 直接返回订单主页
        //
        return "redirect:/AdminOrderManagement";
    }

    @RequestMapping("/AdminOrderDelete")
    public String adminOrderDelete(HttpServletRequest httpServletRequest){
        int orderId = Integer.valueOf(httpServletRequest.getParameter("orderId"));
        adminOrderService.deleteOrder(orderId);
        System.out.println("Delete order id:" + orderId);
        return "redirect:/AdminOrderManagement";
    }


}
