package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.entity.AD;
import com.ten.ParkNShop.entity.Product;
import com.ten.ParkNShop.entity.SearchInfo;
import com.ten.ParkNShop.mapper.ADMapper;
import com.ten.ParkNShop.mapper.ProductMapper;
import com.ten.ParkNShop.service.AdminADService;
import com.ten.ParkNShop.service.BuyerProductService;
import com.ten.ParkNShop.service.SellerCommentService;
import com.ten.ParkNShop.service.SellerProductService;
import com.ten.ParkNShop.util.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @author: Archibald.
 * @Description:
 * @version:
 * @time: 12/16/2017.
 */
@Controller
public class BuyerSearchController {
    @Autowired
    private BuyerProductService buyerProductService;

    @Autowired
    private SellerCommentService sellerCommentService;

    @Autowired
    private AdminADService adminADService;

    @Autowired
    private ADMapper adMapper;

    @Autowired
    private SellerProductService sellerProductService;

    @RequestMapping("/BuyerIndex")
    public String buyerIndex(Model model){
        List<Product> topSellingProducts = new ArrayList<Product>();
        for (AD ad:adMapper.selectADByADType("1")) {
            topSellingProducts.add(sellerProductService.getProductById(ad.getOtherId()));
        }

        List<Product> featuredProducts = new ArrayList<Product>();
        for (AD ad:adMapper.selectADByADType("3")) {
            featuredProducts.add(sellerProductService.getProductById(ad.getOtherId()));
        }

        List<Product> specialProducts = new ArrayList<Product>();
        for (AD ad:adMapper.selectADByADType("4")) {
            specialProducts.add(sellerProductService.getProductById(ad.getOtherId()));
        }

        List<Product> onsaleProducts = new ArrayList<Product>();
        for (AD ad:adMapper.selectADByADType("5")) {
            onsaleProducts.add(sellerProductService.getProductById(ad.getOtherId()));
        }

        model.addAttribute("topSellingProducts",topSellingProducts);
        model.addAttribute("featuredProducts",featuredProducts);
        model.addAttribute("specialProducts",specialProducts);
        model.addAttribute("onsaleProducts",onsaleProducts);


        model.addAttribute("type1products",buyerProductService.searchBySearchType(1,0,5));
        model.addAttribute("type2products",buyerProductService.searchBySearchType(2,0,5));
        model.addAttribute("type3products",buyerProductService.searchBySearchType(3,0,5));
        model.addAttribute("type4products",buyerProductService.searchBySearchType(4,0,5));
        model.addAttribute("type5products",buyerProductService.searchBySearchType(5,0,5));
        model.addAttribute("type8products",buyerProductService.searchBySearchType(8,0,5));

        
        model.addAttribute("bigADs",adminADService.selectADTop5Store());

        return "Buyer/BuyerIndex";
    }

    @RequestMapping("/SearchProducts")
    public String listProducts(Model model,HttpServletRequest request){
        int searchType = Integer.parseInt(request.getParameter("searchType"));
        String productName = request.getParameter("searchInfo");
        request.setAttribute("searchType",searchType);

        if (searchType == 0){
            model.addAttribute("searchProducts",buyerProductService.searchByProductName(productName));
            model.addAttribute("searchNum",buyerProductService.countByProductName(productName));
            
            return "Buyer/ListProducts";
        }
        model.addAttribute("searchProducts",buyerProductService.searchByProductNameAndSearchType(productName,searchType));
        return "Buyer/ListProducts";
    }

    @RequestMapping("/ProductDetail")
    public String ProductDetail(Model model,@RequestParam("productId") int productId){
        Product product = buyerProductService.searchByProductId(productId);

        Page page = sellerCommentService.findCommentByProductId(productId);

        model.addAttribute("product",product);
        
        model.addAttribute("commentsItem", page);
        return "Buyer/BuyerProductDetail";
    }


}
