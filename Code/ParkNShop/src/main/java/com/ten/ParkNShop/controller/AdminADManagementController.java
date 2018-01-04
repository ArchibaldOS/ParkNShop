package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.entity.AD;
import com.ten.ParkNShop.service.AdminADService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
public class AdminADManagementController {

    @Autowired
    private AdminADService adminADService;

    @RequestMapping("/AdminADManagement")
    public String adminADManagement(Model model){
        // 获取当前的Top10Product，用价格排序

        model.addAttribute("ads", adminADService.selectADTop10Product());

        return "Admin/AdminADTop10Product";
    }

    @RequestMapping("/AdminADTop5StoriesManagement")
    public String adminADTop5StoriesManagement(Model model){

        model.addAttribute("ads", adminADService.selectADTop5Store());

        return "Admin/AdminADTop5StoriesManagement";
    }

    @RequestMapping("/AdminADManagementHistory")
    public String adminADManagementHistory(HttpServletRequest httpServletRequest, Model model){
        httpServletRequest.getParameter("start");
        if(httpServletRequest.getParameter("start") != null){
            int start = Integer.valueOf(httpServletRequest.getParameter("start"));
            int pageSize = Integer.valueOf(httpServletRequest.getParameter("pageSize"));
            model.addAttribute("ads", adminADService.selectAllAD(start, pageSize));
        }else{
            model.addAttribute("ads", adminADService.selectAllAD(0, 20));
        }
        return "Admin/AdminADManagementHistory";
    }

    @RequestMapping("/AdminADApplyingList")
    public String adminADApplyingList(Model model){
        model.addAttribute("ads", adminADService.selectADByADStatus("1"));
        return "Admin/AdminADApplyingList";
    }
    @RequestMapping("/AdminADList")
    public String adminADList(Model model){
        model.addAttribute("ads", adminADService.selectADByADStatus("2"));
        return "Admin/AdminADList";
    }

    // 处理广告申请的三个操作

    @RequestMapping("/AdminADDetail")
    public String adminADDetail(HttpServletRequest httpServletRequest, Model model){
        int adId = Integer.valueOf(httpServletRequest.getParameter("adId"));
        model.addAttribute("ad", adminADService.selectADByID(adId));
        model.addAttribute("type", httpServletRequest.getParameter("type"));
        return "Admin/AdminADDetail";
    }

    @RequestMapping("/AdminADApprove")
    public String adminADApprove(HttpServletRequest httpServletRequest){
        int adId = Integer.valueOf(httpServletRequest.getParameter("adId"));
        AD ad = adminADService.selectADByID(adId);
        ad.setADStatus(2);
        // 更新广告的时间
        ad.setADStartDate(new Date());
        adminADService.updateADByAD(ad);
        return "redirect:/AdminADList";
    }

    @RequestMapping("/AdminADDisApprove")
    public String adminADDisApprove(HttpServletRequest httpServletRequest){
        int adId = Integer.valueOf(httpServletRequest.getParameter("adId"));
        AD ad = adminADService.selectADByID(adId);
        ad.setADStatus(3);
        // 更新广告的时间
        ad.setADStartDate(new Date());
        adminADService.updateADByAD(ad);
        return "redirect:/AdminADList";
    }

    // 更改广告
    @RequestMapping("/AdminADModify")
    public String adminADModify(HttpServletRequest httpServletRequest, Model model){
        model.addAttribute("ad", adminADService.selectADByID(Integer.valueOf(httpServletRequest.getParameter("adId"))));
        return "Admin/AdminADModify";
    }

    @RequestMapping("/AdminADModifyDo")
    public String adminADModifyDo(HttpServletRequest httpServletRequest, Model model){
        int adId = Integer.valueOf(httpServletRequest.getParameter("adId"));
        AD ad = adminADService.selectADByID(adId);
        // 重新设置改变的属性
        ad.setADStatus(Integer.valueOf(httpServletRequest.getParameter("adStatus")));
        ad.setADType(Integer.valueOf(httpServletRequest.getParameter("adType")));
        ad.setADPhotoUrl(httpServletRequest.getParameter("adPhotoUrl"));
        ad.setADDescription(httpServletRequest.getParameter("adDescription"));
        ad.setADPrice(Float.valueOf(httpServletRequest.getParameter("adPrice")));
        ad.setADTime(Integer.valueOf(httpServletRequest.getParameter("adTime")));
        adminADService.updateADByAD(ad);
        return "redirect:/AdminADList";
    }

    // 删除广告
    @RequestMapping("/AdminADDelete")
    public String adminADDelete(HttpServletRequest httpServletRequest){
        int adId = Integer.valueOf(httpServletRequest.getParameter("adId"));
        adminADService.deleteADByADId(adId);
        return "redirect:/AdminADList";
    }


}
