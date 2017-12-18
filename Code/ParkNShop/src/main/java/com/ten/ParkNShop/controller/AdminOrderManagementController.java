package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.entity.Order;
import com.ten.ParkNShop.service.AdminOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String adminOrderSearchById(){
        return "Admin/AdminOrderSearchByID";
    }

    @RequestMapping("/AdminOrderSearchByIDDo")
    public String adminOrderSearchByIDDo(HttpServletRequest httpServletRequest,Model model){
        int orderID = Integer.parseInt(httpServletRequest.getParameter("orderID"));
        model.addAttribute("order", adminOrderService.selectOrderById(orderID));
        return "Admin/AdminOrderDetail";
    }


    @RequestMapping("/AdminOrderSearchBybuyerId")
    public String adminOrderSearchBybuyerId(){
        return "Admin/AdminOrderSearchByBuyerId";
    }

    @RequestMapping("/AdminOrderSearchByBuyerIDDo")
    public String adminOrderSearchByBuyerIDDo(HttpServletRequest httpServletRequest, Model model){
        int buyerID = Integer.parseInt(httpServletRequest.getParameter("buyerID"));
        // TODO 结果分页 验证 ID
        model.addAttribute("orders", adminOrderService.selectOrderByBuyerID(buyerID, 0, 20));
        return "Admin/AdminOrderSearchResult";
    }

    @RequestMapping("/AdminOrderSearchBysellerId")
    public String adminOrderSearchBysellerId(){
        return "Admin/AdminOrderSearchBySellerId";
    }

    @RequestMapping("/AdminOrderSearchBySellerIDDo")
    public String adminOrderSearchBySellerIDDo(HttpServletRequest httpServletRequest, Model model){
        int sellerID = Integer.parseInt(httpServletRequest.getParameter("sellerID"));
        // TODO 结果分页 验证 ID
        model.addAttribute("orders", adminOrderService.selectOrderBySellerID(sellerID, 0, 20));
        return "Admin/AdminOrderSearchResult";
    }

    @RequestMapping("/AdminOrderSearchByproductId")
    public String adminOrderSearchByproductId(){
        return "Admin/AdminOrderSearchByProductId";
    }

    @RequestMapping("/AdminOrderSearchByProductIDDo")
    public String adminOrderSearchByProductIdDo(HttpServletRequest httpServletRequest, Model model){
        int productID = Integer.parseInt(httpServletRequest.getParameter("productID"));
        // TODO 结果分页 验证 ID
        model.addAttribute("orders", adminOrderService.selectOrderByProductID(productID, 0, 20));
        return "Admin/AdminOrderSearchResult";
    }

    /**
     * @Description 通过一个 OrderID 获取一个 Order 的 具体信息
     * @return
     */
    @RequestMapping("/AdminOrderDetail")
    public String adminOrderDetail(HttpServletRequest httpServletRequest,Model model){
        int orderID = Integer.parseInt(httpServletRequest.getParameter("orderID"));
        model.addAttribute("order", adminOrderService.selectOrderById(orderID));
        return "Admin/AdminOrderDetail";
    }

    @RequestMapping("/AdminOrderModify")
    public String adminOrderModify(HttpServletRequest httpServletRequest,Model model){
        int orderID = Integer.parseInt(httpServletRequest.getParameter("orderID"));
        model.addAttribute("order", adminOrderService.selectOrderById(orderID));
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
        int orderID = Integer.valueOf(httpServletRequest.getParameter("orderID"));
        adminOrderService.deleteOrder(orderID);
        System.out.println("Delete order id:" + orderID);
        return "redirect:/AdminOrderManagement";
    }


}
