package com.ten.ParkNShop.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.ten.ParkNShop.entity.Seller;
import com.ten.ParkNShop.service.AdminService;
import com.ten.ParkNShop.service.AdminShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/**
 * @author: Archibald.
 * @Description:
 * @version:
 * @time: 12/6/2017.
 */
@Controller
public class AdminShopManagementController {
    @Autowired
    private AdminShopService adminShopService;

    @RequestMapping("/AdminShopManagement")
    public String adminShopManagement(Model model){
        model.addAttribute("registerShops",adminShopService.selectAllRegisterShop(0,5));
        return "Admin/AdminShopManagement";
    }
    @RequestMapping("/AdminShopList")
    public String adminShopList(Model model){
        model.addAttribute("approvedShops",adminShopService.selectAllApprovedShop(0,5));
        return "Admin/AdminShopList";
    }
    @RequestMapping("/AdminSearchShop")
    public String adminSearchShop(){
        return "Admin/AdminSearchShop";
    }
    @RequestMapping("/AdminBlackList")
    public String adminBlackList(Model model){
        model.addAttribute("blacklistShops",adminShopService.selectAllBlacklistShop(0,5));
        return "Admin/AdminBlackList";
    }
    @RequestMapping("/AdminShopDetail")
    public String adminShopDetail(HttpServletRequest httpServletRequest, Model model){
        int sellerId = Integer.parseInt(httpServletRequest.getParameter("sellerId"));
        model.addAttribute("seller",adminShopService.selectSellerById(sellerId));
        return "Admin/AdminShopDetail";
    }
    @RequestMapping("/AdminRegisterShopDetail")
    public String adminRegisterShopDetail(HttpServletRequest httpServletRequest, Model model){
        int sellerId = Integer.parseInt(httpServletRequest.getParameter("sellerId"));
        model.addAttribute("seller",adminShopService.selectSellerById(sellerId));
        return "Admin/AdminRegisterShopDetail";
    }
    @RequestMapping("/AdminShopModify")
    public String adminShopModify(HttpServletRequest httpServletRequest, Model model){
        int sellerId = Integer.parseInt(httpServletRequest.getParameter("sellerId"));
        model.addAttribute("seller",adminShopService.selectSellerById(sellerId));
        return "Admin/AdminShopModify";
    }
    /**
     * @Author: Archibald
     * @Date: 4:06 PM 12/5/2017
     * @Description: 以上为跳转至管理员各页面
     */

    @RequestMapping("/AdminApproveRegisterShop")
    public String adminApproveRegisterShop(HttpServletRequest httpServletRequest){
        int sellerId = Integer.parseInt(httpServletRequest.getParameter("sellerId"));
        int i = adminShopService.updateShopStatusToApproved(sellerId);
        return "redirect:/AdminShopManagement";
    }
    @RequestMapping("/AdminDisapproveRegisterShop")
    public String adminDisapproveRegisterShop(HttpServletRequest httpServletRequest){
        int sellerId = Integer.parseInt(httpServletRequest.getParameter("sellerId"));
        int i = adminShopService.updateShopStatusToUnapproved(sellerId);
        return "redirect:/AdminShopManagement";
    }
    @RequestMapping("/AdminChangeShopStatusToWaitToApproved")
    public String adminChangeShopStatusToWaitToApproved(HttpServletRequest httpServletRequest){
        int sellerId = Integer.parseInt(httpServletRequest.getParameter("sellerId"));
        int i = adminShopService.updateShopStatusToWaitToApproved(sellerId);
        return "redirect:/AdminShopManagement";
    }
    @RequestMapping("/AdminChangeShopStatusToBan")
    public String adminChangeShopStatusToBan(HttpServletRequest httpServletRequest){
        int sellerId = Integer.parseInt(httpServletRequest.getParameter("sellerId"));
        int i = adminShopService.updateShopStatusToBan(sellerId);
        return "redirect:/AdminShopManagement";
    }
    /**
    * @Author: Archibald
    * @Date: 7:11 PM 12/10/2017
    * @Description: 以上为改变Seller的状态
     * 0表示注册待审批，1表示审批通过，2表示审批未通过，3表示黑名单
    */

    @RequestMapping("/AdminShopModifyDO")
    public String adminShopModifyDO(HttpServletRequest httpServletRequest){
        Seller seller =new Seller();
        seller.setSellerid(Integer.valueOf(httpServletRequest.getParameter("sellerid")));
        seller = adminShopService.selectSellerById(seller.getSellerid());
        seller.setSellername(httpServletRequest.getParameter("sellername"));
        seller.setShopname(httpServletRequest.getParameter("shopname"));
        seller.setShopintroduction(httpServletRequest.getParameter("shopintroduction"));
        seller.setSellerphone(httpServletRequest.getParameter("sellerphone"));
        seller.setSelleremail(httpServletRequest.getParameter("selleremail"));
        seller.setShopstatus(Integer.valueOf(httpServletRequest.getParameter("sellerstatus")));
        adminShopService.updateSeller(seller);
        System.out.println(seller);
        return "redirect:/AdminShopList";
    }

    @RequestMapping("/AdminDeleteShop")
    public String adminRemoveFromBlacklist(HttpServletRequest httpServletRequest){
        int sellerId = Integer.parseInt(httpServletRequest.getParameter("sellerId"));
        int i = adminShopService.deleteSeller(sellerId);
        return "redirect:/AdminBlackList";
    }
}
