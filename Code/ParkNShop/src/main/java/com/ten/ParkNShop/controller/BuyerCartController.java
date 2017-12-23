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
import com.ten.ParkNShop.service.BuyerProductService;
import com.ten.ParkNShop.service.SellerProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.Constants;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

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
    @Autowired
    private SellerProductService sellerProductService;
    @RequestMapping("/AddToCart")
    public String addToCart(HttpServletRequest request) throws ServletException, IOException{

        int productId;
        int productNumber;
        String stringOfId = request.getParameter("productId");
        productId = Integer.parseInt(stringOfId);
        if (request.getParameter("productNum")==null){
            productNumber = 1;
        }else {
            productNumber = Integer.parseInt(request.getParameter("productNum"));
        }
        HttpSession session = request.getSession();
        BuyerCart buyerCart = (BuyerCart) session.getAttribute("buyerCart");
        if (buyerCart == null){
            buyerCart = new BuyerCart();
        }
        Product product = sellerProductService.getProductById(productId);
        buyerCart.addProduct(product,productNumber);
        session.setAttribute("buyerCart",buyerCart);
        if (request.getSession().getAttribute("Buyer")==null){
            return "Buyer/BuyerLogin";
        }
        return "Buyer/BuyerCart";
    }

    @RequestMapping("/DelFromBuyerCart")
    public String delFromCart(HttpServletRequest request) throws ServletException, IOException{
        int productId = Integer.parseInt(request.getParameter("productId"));
        HttpSession session = request.getSession();
        BuyerCart buyerCart = (BuyerCart) session.getAttribute("buyerCart");
        if (buyerCart==null){
            buyerCart = new BuyerCart();
        }
        Product product = sellerProductService.getProductById(productId);
        buyerCart.deleteProduct(product);
        session.setAttribute("buyerCart",buyerCart);
        return "Buyer/BuyerCart";
    }

    @RequestMapping("/DelItem")
    public String delItem(HttpServletRequest request) throws ServletException, IOException{
        int productId = Integer.parseInt(request.getParameter("productId"));
        HttpSession session = request.getSession();
        BuyerCart buyerCart = (BuyerCart) session.getAttribute("buyerCart");
        if (buyerCart==null){
            buyerCart = new BuyerCart();
        }
        Product product = sellerProductService.getProductById(productId);
        buyerCart.deleteItem(productId);
        session.setAttribute("buyerCart",buyerCart);
        return "Buyer/BuyerCart";
    }

    @RequestMapping("/ViewCart")
    public String ViewCart(Model model,HttpServletRequest request, HttpSession session) throws IOException {
        //将对象转换成json字符串/json字符串转成对象
        model.addAttribute("buyerCart",buyerCartService.getBuyerCart(request,session));
        return "Buyer/BuyerCart";
    }


}
