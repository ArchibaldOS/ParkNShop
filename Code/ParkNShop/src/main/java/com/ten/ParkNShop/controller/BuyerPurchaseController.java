package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.entity.*;
import com.ten.ParkNShop.mapper.AdminMapper;
import com.ten.ParkNShop.mapper.CommissionMapper;
import com.ten.ParkNShop.mapper.OrderMapper;
import com.ten.ParkNShop.mapper.ProductMapper;
import com.ten.ParkNShop.mapper.SellerMapper;
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
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private SellerMapper sellerMapper;
    @Autowired
	private CommissionMapper commissionMapper;
    @Autowired
	private ProductMapper productMapper;

    @RequestMapping("/onConfirmClick")
    public String confirmClick(HttpSession session,String newAddress) {
        Buyer buyer = (Buyer) session.getAttribute("Buyer");
        if(buyer == null) return "Buyer/BuyerLogin";



        BuyerCart cart = (BuyerCart) session.getAttribute("buyerCart");
        List<BuyerItem> items = cart.getItems();
        List<Order> orders = new ArrayList<Order>();
        Integer commissionId = (Integer) session.getAttribute("commissionId");

        if (cart != null && !cart.getItems().isEmpty()) {
            for (BuyerItem item : items) {
                Order order = new Order();
                if(newAddress != null && newAddress.length() > 0)
                {
                    order.setAddress(newAddress);
                }
                else
                {
                    order.setAddress(buyer.getbuyerAddress());
                }
                order.setBuyerId(buyer.getbuyerId());
                order.setCount(item.getAmount());
                order.setOrderStatus(1);
                order.setOrderTime(new Date());
                order.setProductId(item.getProduct().getProductId());
                order.setSellerId(item.getProduct().getSellerId());
                order.setTotalPrice(item.getAmount()*item.getProduct().getProductPrice());
                order.setOrderCommissionId(commissionId);
                orders.add(order);
                int productId = item.getProduct().getProductId();
                productMapper.updateStock(productId, item.getAmount());
            }
            buyerPurchaseService.createOrders(orders);
            session.removeAttribute("buyerCart");
            session.setAttribute("buyerCart",new BuyerCart());
            session.setAttribute("toPayOrders",orders);
            return "Buyer/purchasesSuccessful";

        }

        else if(cart.getItems().isEmpty())
        {
            return "Buyer/cartIsEmpty";
        }
        else
        {
            System.out.println("璐拱澶辫触,鏈纭彇寰楄喘鐗╄溅灞炴��");
            return "Buyer/purchaseFailBusy";
        }
    }



    @RequestMapping("viewMyOrdersClick")
    public String viewMyOrders (HttpSession session)
    {
    	session.setAttribute("orders", null);
        Buyer buyer = (Buyer) session.getAttribute("Buyer");
        //浠庣櫥褰曠殑淇℃伅褰撲腑鑾峰彇涔板ID
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
    @RequestMapping("onPaidSingleClick")
    public String onPaidClick(int orderId)
    {

       
            buyerPurchaseService.changeOrderToPaid(orderId);
           
            Order order = orderMapper.selectByPrimaryKey(orderId);
            Admin admin = adminMapper.selectByPrimaryKey(1);
            float newBalance = admin.getAdminbalance() + order.getTotalPrice();
            adminMapper.updateBalance(newBalance);
        

        return "Buyer/orderPay";
    }
    @RequestMapping("onConfirmReceivedClick")
    public String onConfirmReceivedClick(int orderId)
    {
    	float commission = commissionMapper.selectLastCommission().getCommission();
        buyerPurchaseService.changeOrderToReceived(orderId);
        Order order = orderMapper.selectByPrimaryKey(orderId);
        Seller seller = sellerMapper.selectByPrimaryKey(order.getSellerId());
        float amount = (float) (commission * order.getTotalPrice());
        float AdminCurrentBalance = adminMapper.selectByPrimaryKey(1).getAdminbalance();
        float sellerCurrentBalance = seller.getSellerBalance();
        adminMapper.updateBalance( AdminCurrentBalance-amount );
        sellerMapper.updateBalance(seller.getsellerId(),sellerCurrentBalance + amount);
        return "forward:/viewMyOrdersClick";
    }
    @RequestMapping("onCancelClick")
    public String onCancelClick(int orderId)
    {
        Order order = orderMapper.selectByPrimaryKey(orderId);
        if(order != null)
        {
            orderMapper.deleteByPrimaryKey(orderId);
        }
        else
        {
            return "Buyer/OrderNotFound";
        }
        return "viewMyOrders";
    }
}
