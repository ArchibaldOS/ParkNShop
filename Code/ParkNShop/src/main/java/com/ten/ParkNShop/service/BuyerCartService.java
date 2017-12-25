package com.ten.ParkNShop.service;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.ten.ParkNShop.entity.BuyerCart;
import com.ten.ParkNShop.entity.Order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author: Archibald.
 * @Description:
 * @version:
 * @time: 12/16/2017.
 */
public interface BuyerCartService {
    BuyerCart getBuyerCart(HttpServletRequest request, HttpSession session) throws JsonParseException, JsonMappingException, IOException;
}
