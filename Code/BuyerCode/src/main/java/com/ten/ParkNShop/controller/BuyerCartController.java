package com.ten.ParkNShop.controller;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ten.ParkNShop.entity.Buyer;
import com.ten.ParkNShop.entity.BuyerCart;
import com.ten.ParkNShop.entity.Product;
import com.ten.ParkNShop.mapper.ProductMapper;
import com.ten.ParkNShop.service.BuyerCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.Constants;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author: Archibald.
 * @Description:
 * @version:
 * @time: 12/16/2017.
 */
@Controller
public class BuyerCartController {
    @Autowired
    private BuyerCartService buyerCartService;
    private ProductMapper productMapper;
    @RequestMapping("/AddToBuyerCart")
    public int addToCart(HttpServletRequest request, HttpServletResponse response) {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int productNumber = Integer.parseInt(request.getParameter("producctNumber"));
        HttpSession session = request.getSession();
        BuyerCart buyerCart = (BuyerCart) session.getAttribute("cart");
        if (buyerCart == null){
            buyerCart = new BuyerCart();
        }
        Product product = productMapper.findByProductId(productId);
        buyerCart.addProduct(product,productNumber);
        return productId;
    }

    @RequestMapping("/DelFromBuyerCart")
    public int delFromCart(HttpServletRequest request, HttpServletResponse response) {
        int productId = Integer.parseInt(request.getParameter("productId"));
        HttpSession session = request.getSession();
        BuyerCart buyerCart = (BuyerCart) session.getAttribute("cart");
        if (buyerCart==null){
            return 0;
        }
        Product product = productMapper.findByProductId(productId);
        buyerCart.deleteProduct(product);
        return productId;
    }

    @RequestMapping("/ViewCart")
    public String ViewCart(Model model,HttpServletRequest request, HttpSession session) throws IOException {
        //将对象转换成json字符串/json字符串转成对象
        model.addAttribute("buyerCart",buyerCartService.getBuyerCart(request,session));
        return "Buyer/BuyerCart";
    }


}
