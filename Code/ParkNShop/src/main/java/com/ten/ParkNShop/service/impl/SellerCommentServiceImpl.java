package com.ten.ParkNShop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ten.ParkNShop.entity.CommentItem;
import com.ten.ParkNShop.entity.Comments;
import com.ten.ParkNShop.mapper.CommentMapper;
import com.ten.ParkNShop.mapper.ProductMapper;
import com.ten.ParkNShop.mapper.BuyerMapper;
import com.ten.ParkNShop.service.SellerCommentService;
import com.ten.ParkNShop.util.Page;

@Service
public class SellerCommentServiceImpl implements SellerCommentService {

	@Autowired
	private CommentMapper commentMapper;
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private BuyerMapper buyerMapper;
	
	@Override
	public int insertComment(Comments comments) {
		return commentMapper.insertComment(comments);
	}

	@Override
	public Page findCommentBySellerId(int sellerId) {
		
		List<Comments> comments = commentMapper.findBySellerId(sellerId);
		
		List<CommentItem> commentItems = new ArrayList<CommentItem>();
		for(Comments temp : comments){
			
			CommentItem commentItem = new CommentItem();
			commentItem.setComments(temp);
			commentItem.setBuyer(buyerMapper.selectByPrimaryKey(temp.getBuyerId()));
			commentItem.setProduct(productMapper.findByProductId(temp.getProductId()));
			commentItems.add(commentItem);
			
		}
		
		Page page = new Page(sellerId);
		
		page.setList(commentItems);
		
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
		List<CommentItem> commentItems = new ArrayList<CommentItem>();
		for(Comments temp : comments){
			
			CommentItem commentItem = new CommentItem();
			commentItem.setComments(temp);
			commentItem.setBuyer(buyerMapper.selectByPrimaryKey(temp.getBuyerId()));
			commentItems.add(commentItem);
			
		}
		
		Page page = new Page(productId);
		
		page.setList(commentItems);
		
		return page;
	}

}
