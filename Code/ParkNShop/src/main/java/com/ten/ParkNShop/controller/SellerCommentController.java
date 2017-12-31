package com.ten.ParkNShop.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ten.ParkNShop.entity.Comments;
import com.ten.ParkNShop.entity.Seller;
import com.ten.ParkNShop.service.SellerCommentService;
import com.ten.ParkNShop.util.Page;

@Controller
public class SellerCommentController {
	
	@Autowired
	private SellerCommentService sellerCommentService;
	
	@RequestMapping(value="/commentSubmit", method=RequestMethod.POST)
	public String commentSubmit(int buyerId,int productId,String content,Model model){
		
		Comments comments = new Comments();
		comments.setBuyerId(buyerId);
		comments.setProductId(productId);
		comments.setContent(content);
		comments.setCommentTime(new Date());

		int result = sellerCommentService.insertComment(comments);
		if(result == 1){
			model.addAttribute("isSucceed", 1);
		}else
			model.addAttribute("isSucceed", null);
		return "forward:/viewMyOrdersClick";
	}
	
	@RequestMapping(value="/listCommentBySellerId", method=RequestMethod.GET)
	public String listCommentBySellerId(HttpSession session,Model model){
		
		int sellerId = ((Seller)session.getAttribute("seller")).getsellerId();
		
		Page comments = sellerCommentService.findCommentBySellerId(sellerId);
		
		model.addAttribute("comments", comments);
		
		return "Seller/sellerCommentList";
		
	}
	
	@RequestMapping(value="/replyCommentById", method=RequestMethod.GET)
	public String replyComment(int commentId,String reply,Model model){
		
		Comments comments = sellerCommentService.findByPrimaryKey(commentId);
		
		comments.setReply(reply);
		
		sellerCommentService.reply(comments);
		
		return "redirect:/listCommentBySellerId";
		
	}
	
	

	

}
