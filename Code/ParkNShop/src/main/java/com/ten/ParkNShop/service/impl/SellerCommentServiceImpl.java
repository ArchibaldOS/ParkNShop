package com.ten.ParkNShop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ten.ParkNShop.entity.Comments;
import com.ten.ParkNShop.mapper.CommentMapper;
import com.ten.ParkNShop.service.SellerCommentService;
import com.ten.ParkNShop.util.Page;

@Service
public class SellerCommentServiceImpl implements SellerCommentService {

	@Autowired
	private CommentMapper commentMapper;
	
	@Override
	public int insertComment(Comments comments) {
		return commentMapper.insertComment(comments);
	}

	@Override
	public Page findCommentBySellerId(int sellerId) {
		
		List<Comments> comments = commentMapper.findBySellerId(sellerId);
		
		Page page = new Page(sellerId);
		
		page.setList(comments);
		
		return page;
	}

	@Override
	public Comments findByPrimaryKey(int commentId) {
		
		return commentMapper.findByPrimaryKey(commentId);
	}

	@Override
	public int reply(Comments comments) {
		commentMapper.replyComment(comments);
		return 0;
	}

	@Override
	public Page findCommentByProductId(int productId) {
		
		List<Comments> comments = commentMapper.findByProductId(productId);
		
		Page page = new Page(productId);
		
		page.setList(comments);
		
		return page;
	}

}
