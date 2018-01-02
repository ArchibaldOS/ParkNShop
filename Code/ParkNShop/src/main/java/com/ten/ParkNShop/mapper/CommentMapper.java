package com.ten.ParkNShop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ten.ParkNShop.entity.Comments;

public interface CommentMapper {

	int insertComment(Comments comments);
	
	List<Comments> findBySellerId(@Param("sellerId") int sellerId);
	
	List<Comments> findByProductId(@Param("productId") int productId);
	
	Comments findByPrimaryKey(@Param("commentId") int commentId);
	
	void replyComment(Comments comments);
	
}
