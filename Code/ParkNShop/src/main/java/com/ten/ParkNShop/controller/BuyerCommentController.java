package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.entity.Comments;
import com.ten.ParkNShop.entity.Order;
import com.ten.ParkNShop.entity.Product;
import com.ten.ParkNShop.mapper.OrderMapper;
import com.ten.ParkNShop.mapper.ProductMapper;
import com.ten.ParkNShop.service.BuyerCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
@Controller
public class BuyerCommentController {
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private BuyerCommentService buyerCommentService;
    @Autowired
    private OrderMapper orderMapper;
    @RequestMapping("/buyerComment")
    public String buyerComment(int orderId,Model model){
        Order order = orderMapper.selectByPrimaryKey(orderId);
        Product product = productMapper.findByProductId(order.getProductId());
        model.addAttribute("commentOrder",order);
        model.addAttribute("commentProduct",product);
        return "Buyer/BuyerComment";
    }
    @RequestMapping("/buyerCommentSubmit")
    public String buyerCommentSubmit(int orderId,int buyerId,int productId,String content,Model model){

        Comments comments = new Comments();
        comments.setBuyerId(buyerId);
        comments.setProductId(productId);
        comments.setContent(content);
        comments.setCommentTime(new Date());

        int result = buyerCommentService.insertComment(comments);
            model.addAttribute("buyerCommentSucceed", 1);
            orderMapper.changeToCommented(orderId);
        return "forward:/viewMyOrdersClick";
    }
}
