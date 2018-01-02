package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.entity.Comments;
import com.ten.ParkNShop.service.BuyerCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
@Controller
public class BuyerCommentController {
    @Autowired
    private BuyerCommentService buyerCommentService;

    @RequestMapping("/buyerComment")
    public String buyerComment(){
        return "Buyer/BuyerComment";
    }
    @RequestMapping("/buyerCommentSubmit")
    public String buyerCommentSubmit(int buyerId,int productId,String content,Model model){

        Comments comments = new Comments();
        comments.setBuyerId(buyerId);
        comments.setProductId(productId);
        comments.setContent(content);
        comments.setCommentTime(new Date());

        int result = buyerCommentService.insertComment(comments);
        if(result == 1){
            model.addAttribute("buyerCommentSucceed", 1);
        }else
            model.addAttribute("buyerCommentSucceed", null);
        return "forward:/viewMyOrdersClick";
    }
}
