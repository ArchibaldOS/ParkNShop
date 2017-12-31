package com.ten.ParkNShop.service;


import com.ten.ParkNShop.entity.Comments;
import com.ten.ParkNShop.util.Page;

public interface SellerCommentService {

	int insertComment(Comments comments);
	
	Page findCommentBySellerId(int sellerId);
	
	Page findCommentByProductId(int productId);

	Comments findByPrimaryKey(int commentId);
	
	int reply(Comments comments);
}
