package com.ten.ParkNShop.service.impl;

import com.ten.ParkNShop.entity.Comments;
import com.ten.ParkNShop.mapper.CommentMapper;
import com.ten.ParkNShop.service.BuyerCommentService;
import org.springframework.beans.factory.annotation.Autowired;


public class BuyerCommentServiceImp implements BuyerCommentService {
    @Autowired
    private CommentMapper commentMapper;

    public int insertComment(Comments comments) {
        return commentMapper.insertComment(comments);
    }

}
