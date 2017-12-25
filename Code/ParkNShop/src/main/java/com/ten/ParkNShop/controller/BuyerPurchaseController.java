package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.entity.*;
import com.ten.ParkNShop.mapper.AdminMapper;
import com.ten.ParkNShop.service.BuyerPurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by cxh on 17/12/16.
 */
@Controller
public class BuyerPurchaseController {
    @Autowired
    private BuyerPurchaseService buyerPurchaseService;
    @Autowired
    private AdminMapper adminMapper;
    @RequestMapping("/onConfirmClick")
    public String confirmClick(HttpSession session) {
        Buyer buyer = (Buyer) session.getAttribute("Buyer");
        if(buyer == null) return "Buyer/BuyerLogin";
        //未登录，转至登录页面


        BuyerCart cart = (BuyerCart) session.getAttribute("buyerCart");
        List<BuyerItem> items = cart.getItems();
        List<Order> orders = new ArrayList<Order>();


        //购物车非空
        if (cart != null && !cart.getItems().isEmpty()) {
            for (BuyerItem item : items) {
                Order order = new Order();
                //设置订单的总额,地址，买家id，数量，订单状态，创建时间，产品id，卖家idorder.setTotalprice(item.getAmount()*item.getProduct().getProductPrice());
                order.setAddress(buyer.getbuyerAddress());
                order.setBuyerId(buyer.getbuyerId());
                order.setCount(item.getAmount());
                order.setOrderStatus(1);
                order.setOrderTime(new Date());
                order.setProductId(item.getProduct().getProductId());
                order.setSellerId(item.getProduct().getSellerId());
                order.setTotalPrice(item.getAmount()*item.getProduct().getProductPrice());
                orders.add(order);
            }
            buyerPurchaseService.createOrders(orders);
            session.removeAttribute("buyerCart");
            session.setAttribute("buyerCart",new BuyerCart());
            session.setAttribute("toPayOrders",orders);
            return "Buyer/purchasesSuccessful";

        }

        //购物车没添加东西
        else if(cart.getItems().isEmpty())
        {
            return "Buyer/cartIsEmpty";
        }
        else
        {
            System.out.println("购买失败,未正确取得购物车属性");
            return "Buyer/purchaseFailBusy";
        }
    }



    @RequestMapping("viewMyOrdersClick")
    public String viewMyOrders (HttpSession session)
    {
        Buyer buyer = (Buyer) session.getAttribute("Buyer");
        //从登录的信息当中获取买家ID
        if(buyer == null ) return "redirect:/BuyerLogin";
        List<OrderItem> recentOrders = buyerPurchaseService.findBuyerOrdersSer(buyer);
        session.setAttribute("orders",recentOrders);
        return "Buyer/PersonalOrders";

    }

    @RequestMapping("onPaidClick")
    public String onPaidClick(HttpSession session)
    {
        List<Order> orders = (List<Order>) session.getAttribute("toPayOrders");
        for(Order temp :orders )
        {
            buyerPurchaseService.changeOrderToPaid(temp.getOrderId());
            Admin admin = adminMapper.selectByPrimaryKey(1);
            float newBalance = admin.getAdminbalance() + temp.getTotalPrice();
            adminMapper.updateBalance(newBalance);
        }

        return "forward:/viewMyOrdersClick";
    }
    @RequestMapping("onConfirmReceivedClick")
    public String onConfirmReceivedClick(int OrderId)
    {
        buyerPurchaseService.changeOrderToReceived(OrderId);

        return "forward:/viewMyOrdersClick";
    }
}
