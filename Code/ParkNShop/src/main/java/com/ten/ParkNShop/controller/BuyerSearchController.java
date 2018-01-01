package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.entity.Product;
import com.ten.ParkNShop.entity.SearchInfo;
import com.ten.ParkNShop.service.BuyerProductService;
import com.ten.ParkNShop.service.SellerCommentService;
import com.ten.ParkNShop.util.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

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

    @RequestMapping("/BuyerIndex")
    public String buyerIndex(Model model){
        model.addAttribute("featuredProducts",buyerProductService.searchBySearchType(1,0,5));
        model.addAttribute("specialProducts",buyerProductService.searchBySearchType(2,0,5));
        model.addAttribute("onsaleProducts",buyerProductService.searchBySearchType(3,0,5));

        model.addAttribute("topSellingProducts",buyerProductService.searchTopSalesProducts(10));
//        model.addAttribute("topSalesShops",);

        model.addAttribute("type1products",buyerProductService.searchBySearchType(1,0,5));
        model.addAttribute("type2products",buyerProductService.searchBySearchType(2,0,5));
        model.addAttribute("type3products",buyerProductService.searchBySearchType(3,0,5));
        model.addAttribute("type4products",buyerProductService.searchBySearchType(4,0,5));
        model.addAttribute("type5products",buyerProductService.searchBySearchType(5,0,5));
        model.addAttribute("type7products",buyerProductService.searchBySearchType(7,0,5));
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
        SearchInfo searchInfo = new SearchInfo();
        searchInfo.setProductName(productName);
        searchInfo.setSearchType(searchType);
        model.addAttribute("searchProducts",buyerProductService.searchByProductNameAndSearchType(searchInfo));
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
