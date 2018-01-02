package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.entity.Buyer;
import com.ten.ParkNShop.entity.BuyerItem;
import com.ten.ParkNShop.entity.Order;
import com.ten.ParkNShop.entity.OrderItem;
import com.ten.ParkNShop.service.BuyerOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by cxh on 17/12/30.
 */
@Controller
public class BuyerOrderSearchController {
    @Autowired
    BuyerOrderService buyerOrderService;

    @RequestMapping("/")
    public String adminSalesManagement(HttpServletRequest httpServletRequest, Model model, HttpSession session){
        String timeType = httpServletRequest.getParameter("select_type");
        String time = httpServletRequest.getParameter("time");
        List<OrderItem> orders;
        // 如果不进行选择，默认搜索当天的购买记录
        if(timeType == null){
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            timeType = "Daily";
            time = df.format(new Date());
        }
        Buyer buyer = (Buyer) session.getAttribute("Buyer");
        int buyerId = buyer.getbuyerId();
            //添加时间类型的属性
        model.addAttribute("timeType", timeType);

        if(timeType.equals("Daily")){
            model.addAttribute("time", time);
            orders = getDaysOrder(time,buyerId);


        }else if(timeType.equals("Weekly")){
            model.addAttribute("time", time);
            orders = getWeeksOrders(time,buyerId);


        }else if(timeType.equals("Monthly")){

            model.addAttribute("time", time);

            int year = Integer.valueOf(time.split("-")[0]);
            int month = Integer.valueOf(time.split("-")[1]);
            orders = getMonthOrders(year,month,buyerId);
        }
        else
        {
            orders = new LinkedList<OrderItem>();
        }
        model.addAttribute("orders", orders);
        return "Buyer/PersonalOrders";

    }
    private List<OrderItem> getMonthOrders(int year, int month,int buyerId) {

        // 按月查询到的结果
        List<OrderItem> counts = new ArrayList<OrderItem>();


        // 设置好日期实例
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month - 1, 1);

        String startTime ="" +  year + "-" + month + "-" + calendar.get(Calendar.DAY_OF_MONTH);
        calendar.add(Calendar.DAY_OF_MONTH,getDayOfMonth(year,month));
        String  endTime = "" +  year + "-" + month + "-" + calendar.get(Calendar.DAY_OF_MONTH);
        List<OrderItem> orders = buyerOrderService.selectBuyerOrdersBetweenTime(startTime, endTime, buyerId);
        return orders;
    }

    private List<OrderItem> getWeeksOrders(String time,int buyerId) {

        int week = Integer.valueOf(time.split("W")[1]);
        int year = Integer.valueOf(time.split("-")[0]);
        //分割前端传来的字符串，格式是20xx-xxW

        Calendar calendar = Calendar.getInstance();

        calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        calendar.set(Calendar.YEAR, year);
        calendar.set(Calendar.WEEK_OF_YEAR, week);
        //设置calendar事例
        String startTime = calendar.get(Calendar.YEAR) + "-" + (calendar.get(Calendar.MONTH) + 6) + "-" + calendar.get(Calendar.DAY_OF_MONTH);
        List<OrderItem> orders = buyerOrderService.selectBuyerOrdersBetweenTime(startTime, startTime, buyerId);
        return orders;
 }

    private List<OrderItem> getDaysOrder(String time,int buyerId) {
            String startTime = time + " " + 00 + ":00";
            String endTime = time + " " + 23 + ":59";
            List<OrderItem> orders = buyerOrderService.selectBuyerOrdersBetweenTime(startTime, endTime, buyerId);
            return orders;

    }
    private int getDayOfMonth(int year, int month) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month - 1, 1);
        return calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
    }
}
