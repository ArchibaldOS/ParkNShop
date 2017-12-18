package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.entity.Seller;
import com.ten.ParkNShop.service.AdminShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
    @RequestMapping("/AdminSearchShopByID")
    public String adminSearchShopByID(){
        return "Admin/AdminSearchShopByID";
    }
    @RequestMapping("/AdminSearchShopByShopName")
    public String adminSearchShopByShopName(){
        return "Admin/AdminSearchShopByShopName";
    }
    @RequestMapping("/AdminSearchShopBySellerName")
    public String adminSearchShopBySellerName(){
        return "Admin/AdminSearchShopBySellerName";
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


    /**
    * @Author: Archibald
    * @Date: 11:52 PM 12/10/2017
    * @Description: 执行修改
    */
    @RequestMapping("/AdminShopModifyDO")
    public String adminShopModifyDO(HttpServletRequest httpServletRequest){
        Seller seller =new Seller();
        seller.setsellerId(Integer.valueOf(httpServletRequest.getParameter("sellerId")));
        seller = adminShopService.selectSellerById(seller.getsellerId());
        seller.setSellerName(httpServletRequest.getParameter("sellername"));
        seller.setShopName(httpServletRequest.getParameter("shopname"));
        seller.setShopIntroduction(httpServletRequest.getParameter("shopintroduction"));
        seller.setSellerPhone(httpServletRequest.getParameter("sellerphone"));
        seller.setSellerEmail(httpServletRequest.getParameter("selleremail"));
        seller.setShopStatus(Integer.valueOf(httpServletRequest.getParameter("sellerstatus")));
        adminShopService.updateSeller(seller);
        System.out.println(seller);
        return "redirect:/AdminShopList";
    }

    /**
    * @Author: Archibald
    * @Date: 11:53 PM 12/10/2017
    * @Description: 删除店铺
    */
    @RequestMapping("/AdminDeleteShop")
    public String adminDeleteShop(HttpServletRequest httpServletRequest){
        int sellerId = Integer.parseInt(httpServletRequest.getParameter("sellerId"));
        int i = adminShopService.deleteSeller(sellerId);
        return "redirect:/AdminShopList";
    }

    @RequestMapping("/AdminDoSearchByShopID")
    public String adminDoSearchByID(HttpServletRequest httpServletRequest,Model model){
        int sellerId = Integer.parseInt(httpServletRequest.getParameter("sellerId"));
        model.addAttribute("seller",adminShopService.selectSellerById(sellerId));
        return "Admin/AdminShopDetail";
    }
    @RequestMapping("/AdminDoSearchByShopName")
    public String adminDoSearchByShopName(HttpServletRequest httpServletRequest,Model model){
        String shopname = httpServletRequest.getParameter("shopname");
        model.addAttribute("seller",adminShopService.selectByShopname(shopname));
        return "Admin/AdminShopDetail";
    }
    @RequestMapping("/AdminDoSearchBySellerName")
    public String adminDoSearchBySellerName(HttpServletRequest httpServletRequest,Model model){
        String sellername = httpServletRequest.getParameter("sellername");
        model.addAttribute("seller",adminShopService.selectBySellername(sellername));
        return "Admin/AdminShopDetail";
    }
}
