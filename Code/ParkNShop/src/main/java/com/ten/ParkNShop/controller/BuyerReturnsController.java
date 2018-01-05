package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.entity.Order;
import com.ten.ParkNShop.entity.OrderItem;
import com.ten.ParkNShop.entity.Product;
import com.ten.ParkNShop.entity.Seller;
import com.ten.ParkNShop.mapper.AdminMapper;
import com.ten.ParkNShop.mapper.BuyerMapper;
import com.ten.ParkNShop.service.AdminOrderService;
import com.ten.ParkNShop.service.AdminShopService;
import com.ten.ParkNShop.service.BuyerProductService;
import com.ten.ParkNShop.service.BuyerReturnsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BuyerReturnsController {
    @Autowired
    private AdminOrderService adminOrderService;
    @Autowired
    private BuyerReturnsService buyerReturnsService;
    @Autowired
    private BuyerProductService buyerProductService;
    @Autowired
    private AdminShopService adminShopService;
    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private BuyerMapper buyerMapper;

    @RequestMapping("/buyerReturns")
    public String buyerReturns(int orderId, Model model){
        Order order = adminOrderService.selectOrderById(orderId);
        Product product = buyerProductService.searchByProductId(order.getProductId());
        Seller seller = adminShopService.selectSellerById(order.getSellerId());
        OrderItem orderItem  = new OrderItem();
        orderItem.setOrder(order);
        orderItem.setProduct(product);
        orderItem.setSeller(seller);
        model.addAttribute("orderItem",orderItem);
        return "Buyer/BuyerReturns";
    }
    @RequestMapping("/buyerReturnsConfirm")
    public String buyerReturnsConfirm(int orderId){
        Order order = adminOrderService.selectOrderById(orderId);
        if (order.getOrderStatus() == 3 || order.getOrderStatus() == 4){
            buyerReturnsService.refundOnly(orderId);
            float AdminCurrentBalance = adminMapper.selectByPrimaryKey(1).getAdminbalance();
            float amount = order.getTotalPrice();
            adminMapper.updateBalance( AdminCurrentBalance-amount );
            buyerMapper.addBalance(order.getBuyerId(),amount);
        }else {
            buyerReturnsService.refundAndReturn(orderId);
        }
        return "forward:/viewMyOrdersClick";
    }
}
