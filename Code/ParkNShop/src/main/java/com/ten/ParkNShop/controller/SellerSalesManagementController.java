package com.ten.ParkNShop.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ten.ParkNShop.entity.Order;
import com.ten.ParkNShop.entity.Seller;
import com.ten.ParkNShop.service.SellerOrderService;

@Controller
public class SellerSalesManagementController {

	@Autowired
	private SellerOrderService sellerOrderService;
	
	@RequestMapping(value="/sellerSalesIncome",method = RequestMethod.GET)
    public String sellerSalesIncome(HttpServletRequest httpServletRequest, Model model){
        String timeType = httpServletRequest.getParameter("select_type");
        String time = httpServletRequest.getParameter("time");
        int sellerId = ((Seller)httpServletRequest.getSession().getAttribute("seller")).getsellerId();
        if(timeType == null){
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            timeType = "Daily";
            time = df.format(new Date());
        }

        model.addAttribute("timeType", timeType);

        if(timeType.equals("Daily")){
            model.addAttribute("time", time);
            String[] labels = {"0:00", "4:00", "8:00", "12:00", "16:00", "20:00", "24:00"};
            model.addAttribute("labels", labels);
            List<Object> salesCondition= getDaysCountAndSales(time,sellerId);
            List<Integer> counts = (List<Integer>) salesCondition.get(0);
            List<Float> moneys = (List<Float>) salesCondition.get(1);

            model.addAttribute("counts", counts);
            model.addAttribute("moneys", moneys);

        }else if(timeType.equals("Weekly")){
            model.addAttribute("time", time);
            String[] labels = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
            model.addAttribute("labels", labels);

            List<Object> salesCondition = getWeeksCountAndSales(time,sellerId);

            List<Integer> counts = (List<Integer>) salesCondition.get(0);
            List<Float> moneys = (List<Float>) salesCondition.get(1);

            model.addAttribute("counts", counts);
            model.addAttribute("moneys", moneys);


        }else if(timeType.equals("Monthly")){

            model.addAttribute("time", time);

            int year = Integer.valueOf(time.split("-")[0]);
            int month = Integer.valueOf(time.split("-")[1]);

            int dayOfMonth = getDayOfMonth(year,month);

            String[] labels = {"1", "4", "7", "10", "13", "16", "19","22","25",String.valueOf(dayOfMonth)};
            model.addAttribute("labels", labels);

            List<Object> salesCondition = getMonthCountAndSales(year, month, sellerId);

            List<Integer> counts = (List<Integer>) salesCondition.get(0);
            List<Float> moneys = (List<Float>) salesCondition.get(1);

            model.addAttribute("counts", counts);
            model.addAttribute("moneys", moneys);

            return "Seller/shopIncomeByMonth";

        }else{

            String[] labels = {"Jan", "Feb","Mar","Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov","Dec"};
            model.addAttribute("labels", labels);

            int year = Integer.valueOf(httpServletRequest.getParameter("time_year"));
            model.addAttribute("time", year);

            List<Object> salesCondition = getYearCountAndSales(year, sellerId);

            List<Integer> counts = (List<Integer>) salesCondition.get(0);
            List<Float> moneys = (List<Float>) salesCondition.get(1);

            model.addAttribute("counts", counts);
            model.addAttribute("moneys", moneys);

            return "Seller/shopIncomeByYear";

        }
        return "Seller/sellerSalesManagement";
    }
	
	@RequestMapping(value="/sellerSalesHistory",method = RequestMethod.GET)
    public String sellerSalesHistory(HttpServletRequest httpServletRequest, Model model){
        String timeType = httpServletRequest.getParameter("select_type");
        String time = httpServletRequest.getParameter("time");
        int sellerId = ((Seller)httpServletRequest.getSession().getAttribute("seller")).getsellerId();
        if(timeType == null){
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            timeType = "Daily";
            time = df.format(new Date());
        }

        model.addAttribute("timeType", timeType);

        if(timeType.equals("Daily")){
            model.addAttribute("time", time);
            List<Order> orders= getDaysOrders(time,sellerId);

            model.addAttribute("orders", orders);

        }else if(timeType.equals("Weekly")){
            model.addAttribute("time", time);
            String[] labels = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
            model.addAttribute("labels", labels);

            List<Order> orders = getWeeksOrders(time,sellerId);

            model.addAttribute("orders", orders);
            
        }else if(timeType.equals("Monthly")){

            model.addAttribute("time", time);

            int year = Integer.valueOf(time.split("-")[0]);
            int month = Integer.valueOf(time.split("-")[1]);

            int dayOfMonth = getDayOfMonth(year,month);
   
            List<Order> orders = getMonthOrders(year, month, sellerId);

            model.addAttribute("orders", orders);

        }else{

            int year = Integer.valueOf(httpServletRequest.getParameter("time_year"));
            model.addAttribute("time", year);

            List<Order> orders = getYearOrders(year, sellerId);

            model.addAttribute("orders", orders);

        }
        return "Seller/sellerSalesHistory";
    }

	private List<Order> getYearOrders(int year, int sellerId){
		
		String startTime = "" + year + "-" + "1" + "-1";
        String endTime =  "" + year + "-" + "12" + "-31";

        System.out.println(startTime + " " + endTime);
        List<Order> orders = sellerOrderService.selectAllOrdersBetweenTime(startTime, endTime, sellerId, 1);
	
        return orders;
	}
	
	private List<Order> getMonthOrders(int year, int month, int sellerId){
		String startTime = "" + year + "-" + month + "-1";
        String endTime =  "" + year + "-" + month + "-" + getDayOfMonth(year, month);
        List<Order> orders = sellerOrderService.selectAllOrdersBetweenTime(startTime, endTime, sellerId, 1);
        return orders;
	}
	
	private List<Order> getWeeksOrders(String time, int sellerId){
		int week = Integer.valueOf(time.split("W")[1]);
        int year = Integer.valueOf(time.split("-")[0]);

        
        Calendar calendar = Calendar.getInstance();
        
        calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        calendar.set(Calendar.YEAR, year);
        calendar.set(Calendar.WEEK_OF_YEAR, week);
        
        String startTime = calendar.get(Calendar.YEAR) + "-" + (calendar.get(Calendar.MONTH) + 1) + "-" + calendar.get(Calendar.DAY_OF_MONTH);
        calendar.add(Calendar.DAY_OF_WEEK, 7);
        String endTime = calendar.get(Calendar.YEAR) + "-" + (calendar.get(Calendar.MONTH) + 1) + "-" + calendar.get(Calendar.DAY_OF_MONTH);
        List<Order> orders = sellerOrderService.selectAllOrdersBetweenTime(startTime, endTime, sellerId, 1);
        return orders;
	}
	
	private List<Order> getDaysOrders(String time, int sellerId){
		List<Order> orders = sellerOrderService.selectAllOrdersBetweenTime(time, time, sellerId, 1);
		return orders;
	}
	
    private List<Object> getYearCountAndSales(int year, int sellerId) {

        List<Integer> counts = new ArrayList<Integer>();
        List<Float> moneys = new ArrayList<Float>();

        for(int i = 0; i < 12; i++){
            String startTime = "" + year + "-" + (i+1) + "-1";
            String endTime =  "" + year + "-" + (i+1) + "-" + getDayOfMonth(year, i+1);

            System.out.println(startTime + " " + endTime);
            List<Order> orders = sellerOrderService.selectAllOrdersBetweenTime(startTime, endTime, sellerId, 1);

            float money = 0;
            for(Order order: orders){
                money += order.gettotalPrice();
            }
            counts.add(orders.size());
            moneys.add(money);
        }

        List<Object> salesCondition = new ArrayList<Object>();
        salesCondition.add(counts);
        salesCondition.add(moneys);
        return salesCondition;
    }

    private List<Object> getMonthCountAndSales(int year, int month, int sellerId) {

        
        List<Integer> counts = new ArrayList<Integer>();
        List<Float> moneys = new ArrayList<Float>();

      
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month - 1, 1);

        
        for(int i = 0; i < 10; i++){
            String startTime ="" +  year + "-" + month + "-" + calendar.get(Calendar.DAY_OF_MONTH);
            String endTime = null;
            
            if (i < 9){
                
                calendar.add(Calendar.DAY_OF_MONTH, 2);
                endTime = "" +  year + "-" + month + "-" + calendar.get(Calendar.DAY_OF_MONTH);
            } else{
                
                endTime = "" +  year + "-" + month + "-" + getDayOfMonth(year, month);
            }
            List<Order> orders = sellerOrderService.selectAllOrdersBetweenTime(startTime, endTime, sellerId, 1);
            float money = 0;
            for(Order order: orders){
                money += order.gettotalPrice();
            }
            counts.add(orders.size());
            moneys.add(money);
            
            calendar.add(Calendar.DAY_OF_WEEK, 1);
        }

        List<Object> salesCondition = new ArrayList<Object>();
        salesCondition.add(counts);
        salesCondition.add(moneys);
        return salesCondition;
    }

    private List<Object> getWeeksCountAndSales(String time, int sellerId) {
        int week = Integer.valueOf(time.split("W")[1]);
        int year = Integer.valueOf(time.split("-")[0]);

        
        Calendar calendar = Calendar.getInstance();
        
        calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        calendar.set(Calendar.YEAR, year);
        calendar.set(Calendar.WEEK_OF_YEAR, week);

  
        List<Integer> counts = new ArrayList<Integer>();
        List<Float> moneys = new ArrayList<Float>();

        
        for(int i = 0; i < 7; i++){
            String startTime = calendar.get(Calendar.YEAR) + "-" + (calendar.get(Calendar.MONTH) + 1) + "-" + calendar.get(Calendar.DAY_OF_MONTH);
            List<Order> orders = sellerOrderService.selectAllOrdersBetweenTime(startTime, startTime, sellerId, 1);
            float money = 0;
            for(Order order: orders){
                money += order.gettotalPrice();
            }
            counts.add(orders.size());
            moneys.add(money);
           
            calendar.add(Calendar.DAY_OF_WEEK, 1);
        }
        List<Object> salesCondition = new ArrayList<Object>();
        salesCondition.add(counts);
        salesCondition.add(moneys);
        return salesCondition;
    }

    
    private List<Object> getDaysCountAndSales(String time, int sellerId) {
        List<Integer> counts = new ArrayList<Integer>();
        List<Float> moneys = new ArrayList<Float>();
        counts.add(0);
        moneys.add(Float.valueOf(0));
        for(int hour = 0; hour < 24; hour = hour + 4 ){
            String startTime = time + " " + hour + ":00";
            String endTime = time + " " + (hour + 3) + ":59";
            List<Order> orders = sellerOrderService.selectAllOrdersBetweenTime(startTime, endTime, sellerId, 2);
            float money = 0;
            for(Order order: orders){
                money += order.gettotalPrice();
            }
            counts.add(orders.size());
            moneys.add(money);
        }
        List<Object> salesCondition = new ArrayList<Object>();
        salesCondition.add(counts);
        salesCondition.add(moneys);
        return salesCondition;
    }
    
    private int getDayOfMonth(int year, int month) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month - 1, 1);
        return calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
    }
}
