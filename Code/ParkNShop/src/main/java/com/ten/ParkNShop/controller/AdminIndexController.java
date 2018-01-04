package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.entity.BackupHistory;
import com.ten.ParkNShop.mapper.BackupHistoryMapper;
import com.ten.ParkNShop.mapper.BuyerMapper;
import com.ten.ParkNShop.mapper.OrderMapper;
import com.ten.ParkNShop.mapper.SellerMapper;
import com.ten.ParkNShop.service.AdminService;
import com.ten.ParkNShop.util.BackupUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author: Archibald.
 * @Description:
 * @version:
 * @time: 12/5/2017.
 */
@Controller
public class AdminIndexController {
    @Autowired
    private AdminService adminService;

    @Autowired
    private BackupHistoryMapper backupHistoryMapper;

    @Autowired
    private BuyerMapper buyerMapper;

    @Autowired
    private SellerMapper sellerMapper;

    @Autowired
    private OrderMapper orderMapper;

    @RequestMapping("/AdminLogin")
    public String adminLogin(){
        return "Admin/AdminLogin";
    }
    @RequestMapping("/AdminIndex")
    public String adminIndex(Model model){
        model.addAttribute("backupHistorys",backupHistoryMapper.selectAllBackupHistory(0,5));
        model.addAttribute("registeredBuyers",buyerMapper.countAllBuyer());
        model.addAttribute("registeredSellers",sellerMapper.countSellerByStatus(0));
        model.addAttribute("officialSellers",sellerMapper.countSellerByStatus(1));
        model.addAttribute("blackListSellers",sellerMapper.countSellerByStatus(3));
        model.addAttribute("incompleteOrders",orderMapper.countAllOrder()-orderMapper.countAllcompletedOrder());
        model.addAttribute("completedOrders",orderMapper.countAllcompletedOrder());

        return "Admin/AdminIndex";
    }

    @RequestMapping("/AdminBackup")
    public String adminBackup(HttpServletRequest request){
        String adminAccount = request.getParameter("adminAccount");
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
        String dateString = formatter.format(date);

        String filePath = request.getServletContext().getRealPath("/");
        filePath = filePath+"config/backup.properties";
//        System.out.println(filePath);

        String file = adminAccount+"_"+dateString+".sql";
        try {
            System.out.println(file);
            BackupUtil.backup(file,filePath);
            BackupHistory backupHistory = new BackupHistory();
            backupHistory.setBackupaccount(adminAccount);
            backupHistory.setBackupdate(date);
//            System.out.println(System.getProperty("user.home")+"/Desktop/GitProject/ParkNShop/Backup/"+adminAccount+"_"+dateString+".sql");
            //System.getProperty("user.home")为获取用户的主目录
            String basePath =request.getServletContext().getRealPath("/");
            basePath=basePath.substring(0,basePath.length()-32);
            System.out.println(basePath);
            backupHistory.setBackupfilepath(basePath+"Backup/"+adminAccount+"_"+dateString+".sql");
            backupHistoryMapper.insert(backupHistory);

        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return "redirect:/AdminIndex";
    }

    @RequestMapping("/AdminRecover")
    public String adminRecover(HttpServletRequest request){
        int backupId = Integer.parseInt(request.getParameter("backupId"));
        BackupHistory backupHistory =backupHistoryMapper.selectByPrimaryKey(backupId);
        BackupUtil.recover(backupHistory.getBackupfilepath());
        return "redirect:/AdminIndex";
    }
    /**
    * @Author: Archibald
    * @Date: 4:06 PM 12/5/2017
    * @Description: 以上为跳转至管理员各页面
    */

    /**
    * @Author: Archibald
    * @Date: 4:36 PM 12/6/2017
    * @Description: 登录
    */
    @RequestMapping("/AdminLoginClick")
    public String adminLoginClick(String username, String password, HttpSession httpSession){
        if (adminService.selectAdminPassword(username) == null){
            return "redirect:/AdminLogin";
        }
        String adminPassword = adminService.selectAdminPassword(username);
        int adminStatus = adminService.selectAdminStatus(username);

        if ((adminPassword.equals(password))&&(adminStatus == 0)){
//            model.addAttribute("adminAccount",username);//model传值不可以重定向
            httpSession.setAttribute("adminAccount",username);
            int i = adminService.updateAdminStatusToActive(username);
            return "redirect:/AdminIndex";
        }
        return "redirect:/AdminLogin";
    }

    @RequestMapping("/AdminLogout")
    public String adminLogout(HttpSession httpSession){
        String adminAccount = (String) httpSession.getAttribute("adminAccount");
        int i = adminService.updateAdminStatusToInactive(adminAccount);
        httpSession.invalidate();
        return "redirect:/AdminLogin";
    }
}
