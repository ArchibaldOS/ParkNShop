package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.entity.Buyer;
import com.ten.ParkNShop.entity.BuyerCart;
import com.ten.ParkNShop.entity.BuyerItem;
import com.ten.ParkNShop.entity.Order;
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

    @RequestMapping("onConfirmClick")
    public String confirmClick(HttpSession session) {
        Buyer buyer = (Buyer) session.getAttribute("Buyer");
        if(buyer == null) return "Buyer/BuyerLogin";
        //未登录，转至登录页面


        BuyerCart cart = (BuyerCart) session.getAttribute("cart");
        List<BuyerItem> items = cart.getItems();
        List<Order> orders = new ArrayList<Order>();


        //购物车非空
        if (cart != null && !cart.getItems().isEmpty()) {
            for (BuyerItem item : items) {
                Order order = new Order();
                //设置订单的总额,地址，买家id，数量，订单状态，创建时间，产品id，卖家idorder.setTotalprice(item.getAmount()*item.getProduct().getProductPrice());
                order.setAddress(buyer.getbuyerAddress());
                order.setbuyerId(buyer.getbuyerId());
                order.setCount(item.getAmount());
                order.setorderStatus(1);
                order.setorderTime(new Date());
                order.setproductId(item.getProduct().getProductId());
                order.setsellerId(item.getProduct().getSellerId());

                orders.add(order);
            }
            buyerPurchaseService.createOrders(orders);
            session.removeAttribute("cart");
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
        List<Order> recentOrders = buyerPurchaseService.findBuyerOrdersSer(buyer);
        session.setAttribute("recentOrders",recentOrders);
        return "Buyer/MyOrders";

    }
}
