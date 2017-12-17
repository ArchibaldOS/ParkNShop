package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.entity.Buyer;
import com.ten.ParkNShop.service.AdminBuyerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @author: Archibald.
 * @Description:
 * @version:
 * @time: 12/9/2017.
 */
@Controller
public class AdminBuyerManagementController {
    @Autowired
    private AdminBuyerService adminBuyerService;
    @RequestMapping("/AdminBuyerManagement")
    public String adminBuyerList(Model model){
        model.addAttribute("normalBuyers",adminBuyerService.selectAllNormalBuyer(0,5));
        return "Admin/AdminBuyerManagement";
    }
    @RequestMapping("/AdminSearchBuyerByID")
    public String adminSearchBuyerByID(){
        return "Admin/AdminSearchBuyerByID";
    }
    @RequestMapping("/AdminSearchBuyerByBuyerName")
    public String adminSearchBuyerByBuyerName(){
        return "Admin/AdminSearchBuyerByBuyerName";
    }

    @RequestMapping("/AdminBuyerBlackList")
    public String adminBlackList(Model model){
        model.addAttribute("blacklistBuyers",adminBuyerService.selectAllBlacklistBuyer(0,5));
        return "Admin/AdminBuyerBlackList";
    }
    @RequestMapping("/AdminBuyerDetail")
    public String adminBuyerDetail(HttpServletRequest httpServletRequest, Model model){
        int buyerId = Integer.parseInt(httpServletRequest.getParameter("buyerId"));
        model.addAttribute("buyer",adminBuyerService.selectBuyerById(buyerId));
        return "Admin/AdminBuyerDetail";
    }
    @RequestMapping("/AdminBuyerModify")
    public String adminBuyerModify(HttpServletRequest httpServletRequest, Model model){
        int buyerId = Integer.parseInt(httpServletRequest.getParameter("buyerId"));
        model.addAttribute("buyer",adminBuyerService.selectBuyerById(buyerId));
        return "Admin/AdminBuyerModify";
    }
    /**
     * @Author: Archibald
     * @Date: 4:06 PM 12/5/2017
     * @Description: 以上为跳转至管理员各页面
     */

    @RequestMapping("/AdminSetBuyerStatusToNormal")
    public String adminSetBuyerStatusToNormal(HttpServletRequest httpServletRequest){
        int buyerId = Integer.parseInt(httpServletRequest.getParameter("buyerId"));
        int i = adminBuyerService.updatebuyerStatusToNormal(buyerId);
        return "redirect:/AdminBuyerManagement";
    }
    @RequestMapping("/AdminSetBuyerStatusToFrozen")
    public String adminSetBuyerStatusToFrozen(HttpServletRequest httpServletRequest){
        int buyerId = Integer.parseInt(httpServletRequest.getParameter("buyerId"));
        int i = adminBuyerService.updatebuyerStatusToFrozen(buyerId);
        return "redirect:/AdminBuyerManagement";
    }
    @RequestMapping("/AdminSetBuyerStatusToBlacklist")
    public String adminSetBuyerStatusToBlacklist(HttpServletRequest httpServletRequest){
        int buyerId = Integer.parseInt(httpServletRequest.getParameter("buyerId"));
        int i = adminBuyerService.updatebuyerStatusToBlacklist(buyerId);
        return "redirect:/AdminBuyerManagement";
    }
    /**
     * @Author: Archibald
     * @Date: 7:11 PM 12/10/2017
     * @Description: 以上为改变Buyer的状态
     * 1表示正常，2表示账号被冻结，3表示黑名单
     */


    /**
     * @Author: Archibald
     * @Date: 11:52 PM 12/10/2017
     * @Description: 执行修改
     */
    @RequestMapping("/AdminBuyerModifyDO")
    public String adminBuyerModifyDO(HttpServletRequest httpServletRequest){
        Buyer buyer =new Buyer();
        buyer.setbuyerId(Integer.valueOf((httpServletRequest.getParameter("buyerId"))));
        buyer = adminBuyerService.selectBuyerById(buyer.getbuyerId());
        buyer.setbuyerAccount(httpServletRequest.getParameter("buyerAccount"));
        buyer.setbuyerName(httpServletRequest.getParameter("buyerName"));
        buyer.setbuyerPhone(httpServletRequest.getParameter("buyerPhone"));
        buyer.setbuyerAddress(httpServletRequest.getParameter("buyerAddress"));
        buyer.setbuyerStatus(Integer.valueOf(httpServletRequest.getParameter("buyerStatus")));
        adminBuyerService.updateBuyer(buyer);
        System.out.println(buyer);
        return "redirect:/AdminBuyerManagement";
    }

    /**
     * @Author: Archibald
     * @Date: 11:53 PM 12/10/2017
     * @Description: 删除店铺
     */
    @RequestMapping("/AdminDeleteBuyer")
    public String adminRemoveFromBlacklist(HttpServletRequest httpServletRequest){
        int buyerId = Integer.parseInt(httpServletRequest.getParameter("buyerId"));
        int i = adminBuyerService.deleteBuyer(buyerId);
        return "redirect:/AdminBuyerManagement";
    }

    @RequestMapping("/AdminDoSearchBybuyerId")
    public String adminDoSearchByID(HttpServletRequest httpServletRequest,Model model){
        int buyerId = Integer.parseInt(httpServletRequest.getParameter("buyerId"));
        model.addAttribute("buyer",adminBuyerService.selectBuyerById(buyerId));
        return "Admin/AdminBuyerDetail";
    }
    @RequestMapping("/AdminDoSearchByBuyerName")
    public String adminDoSearchByBuyerName(HttpServletRequest httpServletRequest,Model model){
        String buyerName = httpServletRequest.getParameter("buyerName");
        model.addAttribute("buyer",adminBuyerService.selectBybuyerName(buyerName));
        return "Admin/AdminBuyerDetail";
    }

}
