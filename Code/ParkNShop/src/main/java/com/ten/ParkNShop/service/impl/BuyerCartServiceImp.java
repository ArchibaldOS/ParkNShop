package com.ten.ParkNShop.service.impl;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ten.ParkNShop.entity.Buyer;
import com.ten.ParkNShop.entity.BuyerCart;
import com.ten.ParkNShop.entity.Order;
import com.ten.ParkNShop.service.BuyerCartService;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author: Archibald.
 * @Description:
 * @version:
 * @time: 12/16/2017.
 */
@Service
public class BuyerCartServiceImp implements BuyerCartService{

    public BuyerCart getBuyerCart(HttpServletRequest request, HttpSession session)throws JsonParseException, JsonMappingException, IOException {
        Buyer buyer = (Buyer) session.getAttribute("Buyer");

        ObjectMapper om = new ObjectMapper();
        om.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        BuyerCart buyerCart = null;
        //获取Cookie中的购物车
        Cookie[] cookies = request.getCookies();
        if (null != cookies && cookies.length > 0) {
            for (Cookie cookie : cookies) {
                if (buyer.getbuyerId().toString().equals(cookie.getName())) {
                    //购物车 对象 与json字符串互转
                    buyerCart = om.readValue(cookie.getValue(), BuyerCart.class);
                    break;
                }
            }
        }
        return buyerCart;
    }
}
