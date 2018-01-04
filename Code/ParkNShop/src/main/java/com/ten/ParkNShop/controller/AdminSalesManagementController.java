package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.entity.Order;
import com.ten.ParkNShop.service.AdminADService;
import com.ten.ParkNShop.service.AdminCommissionService;
import com.ten.ParkNShop.service.AdminOrderService;
import com.ten.ParkNShop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
public class AdminSalesManagementController {
    @Autowired
    AdminCommissionService adminCommissionService;

    @Autowired
    AdminService adminService;

    @Autowired
    AdminOrderService adminOrderService;

    @Autowired
    AdminADService adminADService;

    @RequestMapping("/AdminSalesManagement")
    public String adminSalesManagement(HttpServletRequest httpServletRequest, Model model){
        String timeType = httpServletRequest.getParameter("select_type");
        String time = httpServletRequest.getParameter("time");

        // 如果直接访问页面那么处理为当前日期的日销售情况
        if(timeType == null){
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            timeType = "Daily";
            time = df.format(new Date());
        }

        // 所选时间类型传递回去
        model.addAttribute("timeType", timeType);

        if(timeType.equals("Daily")){
            model.addAttribute("time", time);
            String[] labels = {"0:00", "4:00", "8:00", "12:00", "16:00", "20:00", "24:00"};
            model.addAttribute("labels", labels);
            // 获取信息
            List<Object> salesCondition= getDaysCountAndSales(time);
            List<Integer> counts = (List<Integer>) salesCondition.get(0);
            List<Float> moneys = (List<Float>) salesCondition.get(1);

            model.addAttribute("counts", counts);
            model.addAttribute("moneys", moneys);

        }else if(timeType.equals("Weekly")){
            model.addAttribute("time", time);
            String[] labels = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
            model.addAttribute("labels", labels);

            // 获取销售情况 传入参数为形状为 2017-W5
            List<Object> salesCondition = getWeeksCountAndSales(time);

            List<Integer> counts = (List<Integer>) salesCondition.get(0);
            List<Float> moneys = (List<Float>) salesCondition.get(1);

            model.addAttribute("counts", counts);
            model.addAttribute("moneys", moneys);


        }else if(timeType.equals("Monthly")){

            model.addAttribute("time", time);

            // 获取一个月的最后一天
            int year = Integer.valueOf(time.split("-")[0]);
            int month = Integer.valueOf(time.split("-")[1]);

            int dayOfMonth = getDayOfMonth(year,month);

            String[] labels = {"1", "4", "7", "10", "13", "16", "19","22","25",String.valueOf(dayOfMonth)};
            model.addAttribute("labels", labels);

            // 获取销售情况 传入参数为形状为 year month
            List<Object> salesCondition = getMonthCountAndSales(year, month);

            List<Integer> counts = (List<Integer>) salesCondition.get(0);
            List<Float> moneys = (List<Float>) salesCondition.get(1);

            model.addAttribute("counts", counts);
            model.addAttribute("moneys", moneys);

            return "Admin/AdminSalesManagementMonth";

        }else{

            String[] labels = {"Jan", "Feb","Mar","Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov","Dec"};
            model.addAttribute("labels", labels);

            int year = Integer.valueOf(httpServletRequest.getParameter("time_year"));
            model.addAttribute("time", year);

            List<Object> salesCondition = getYearCountAndSales(year);

            List<Integer> counts = (List<Integer>) salesCondition.get(0);
            List<Float> moneys = (List<Float>) salesCondition.get(1);

            System.out.println(counts);
            System.out.println(moneys);

            model.addAttribute("counts", counts);
            model.addAttribute("moneys", moneys);

            return "Admin/AdminSalesManagementYear";

        }
        return "Admin/AdminSalesManagement";
    }

    // 获取一年的销售情况 12个标签
    private List<Object> getYearCountAndSales(int year) {

        List<Integer> counts = new ArrayList<Integer>();
        List<Float> moneys = new ArrayList<Float>();

        for(int i = 0; i < 12; i++){
            String startTime = "" + year + "-" + (i+1) + "-1";
            String endTime =  "" + year + "-" + (i+1) + "-" + getDayOfMonth(year, i+1);

            System.out.println(startTime + " " + endTime);
            List<Order> orders = adminOrderService.selectAllOrdersBetweenTime(startTime, endTime, 1);

            float money = 0;
            for(Order order: orders){
                money += order.getTotalPrice();
            }
            counts.add(orders.size());
            moneys.add(money);
        }

        List<Object> salesCondition = new ArrayList<Object>();
        salesCondition.add(counts);
        salesCondition.add(moneys);
        return salesCondition;
    }

    // 获取一个月的具体销售情况 分为 10 个标签，前九个为3天，后面一个为这个月剩余的天数的总计
    private List<Object> getMonthCountAndSales(int year, int month) {

        // 存储统计的情况
        List<Integer> counts = new ArrayList<Integer>();
        List<Float> moneys = new ArrayList<Float>();

        // 设置一个开始时间
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month - 1, 1);

        // 前九个阶段肯定是满的
        for(int i = 0; i < 10; i++){
            String startTime ="" +  year + "-" + month + "-" + calendar.get(Calendar.DAY_OF_MONTH);
            String endTime = null;
            // 日期向前移动两天
            if (i < 9){
                calendar.add(Calendar.DAY_OF_MONTH, 2);
                endTime = "" +  year + "-" + month + "-" + calendar.get(Calendar.DAY_OF_MONTH);
            } else{
                // 直接使用最后一天
                endTime = "" +  year + "-" + month + "-" + getDayOfMonth(year, month);
            }
            List<Order> orders = adminOrderService.selectAllOrdersBetweenTime(startTime, endTime, 1);
            float money = 0;
            for(Order order: orders){
                money += order.getTotalPrice();
            }
            counts.add(orders.size());
            moneys.add(money);
            // Move forward one day
            calendar.add(Calendar.DAY_OF_WEEK, 1);
        }

        List<Object> salesCondition = new ArrayList<Object>();
        salesCondition.add(counts);
        salesCondition.add(moneys);
        return salesCondition;
    }



    /**
     * @Author tad
     * @Date created in 3:23 PM 12/19/2017
     * @Description 获取一周的订单情况
     *
     * @params [time]  String 一年的某一周的表达，例如 2017-W51
     * @return java.util.List<java.lang.Object>
     */
    private List<Object> getWeeksCountAndSales(String time) {
        // 获取 Integer 的年和周
        int week = Integer.valueOf(time.split("W")[1]);
        int year = Integer.valueOf(time.split("-")[0]);

        // 获取某一年的某一周的开始日期
        Calendar calendar = Calendar.getInstance();
        // 设置一周的开始时间为 周一 默认周二
        calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        calendar.set(Calendar.YEAR, year);
        calendar.set(Calendar.WEEK_OF_YEAR, week);

        // 存储统计的情况
        List<Integer> counts = new ArrayList<Integer>();
        List<Float> moneys = new ArrayList<Float>();

        // 获取一周的具体销售情况，以天为单位
        for(int i = 0; i < 7; i++){
            String startTime = calendar.get(Calendar.YEAR) + "-" + (calendar.get(Calendar.MONTH) + 1) + "-" + calendar.get(Calendar.DAY_OF_MONTH);
            List<Order> orders = adminOrderService.selectAllOrdersBetweenTime(startTime, startTime, 1);
            float money = 0;
            for(Order order: orders){
                money += order.getTotalPrice();
            }
            counts.add(orders.size());
            moneys.add(money);
            //日期向前移动一天
            calendar.add(Calendar.DAY_OF_WEEK, 1);
        }
        List<Object> salesCondition = new ArrayList<Object>();
        salesCondition.add(counts);
        salesCondition.add(moneys);
        return salesCondition;
    }

    /**
     * @Author tad
     * @Date created in 9:32 PM 12/18/2017
     * @Description 获取一段各个小时内的销售量和销售额
     *
     * @params []
     * @return List<Object> 包含两条数据，第一条数据是List<Integer> 表示销量情况 第二条是 List<Float> 表示 销售额的情况
     * @param time
     */
    private List<Object> getDaysCountAndSales(String time) {
        List<Integer> counts = new ArrayList<Integer>();
        List<Float> moneys = new ArrayList<Float>();
        // 传递收入情况 第一个为订单佣金，第二个为广告收入
        List<Float> income = new ArrayList<Float>();
        float incomeCommission = 0;
        counts.add(0);
        moneys.add(Float.valueOf(0));
        for(int hour = 0; hour < 24; hour = hour + 4 ){
            String startTime = time + " " + hour + ":00";
            String endTime = time + " " + (hour + 3) + ":59";
            List<Order> orders = adminOrderService.selectAllOrdersBetweenTime(startTime, endTime, 2);
            float money = 0;
            for(Order order: orders){
                money += order.getTotalPrice();
                // 获取此订单的佣金收入
                incomeCommission += order.getTotalPrice() * adminCommissionService.getCommissionById(order.getOrderCommissionId());
            }
            counts.add(orders.size());
            moneys.add(money);
        }
        income.add(incomeCommission);
        // 获得这段时间的广告收入
        float incomeAD = 0;
        //TODO


        List<Object> salesCondition = new ArrayList<Object>();
        salesCondition.add(counts);
        salesCondition.add(moneys);
        return salesCondition;

    }

    /**
     * @Author tad
     * @Date created in 2:57 PM 12/16/2017
     * @Description 请求修改佣金比例的页面
     *
     * @params []
     * @return java.lang.String
     */
    @RequestMapping("/AdminSalesModifyCommission")
    public String adminSalesModifyCommission(Model model){
        model.addAttribute("oldCommission", adminCommissionService.selectLastCommission());
        return "Admin/AdminSalesModifyCommission";
    }

    @RequestMapping("/AdminSalesModifyCommissionDo")
    public String adminSalesModifyCommissionDo(HttpServletRequest httpServletRequest){
        String submitAdminAccount = httpServletRequest.getParameter("adminAccount");
        String submitAdminPassWord = httpServletRequest.getParameter("adminPassWord");
        float newCommission = Float.valueOf(httpServletRequest.getParameter("newCommission"));
        // 如果密码争正确，进行新的佣金比例的查询
        // TODO 密码错误的处理
        if(submitAdminPassWord.equals(adminService.selectAdminPassword(submitAdminAccount))){
            adminCommissionService.insertLast(newCommission, submitAdminAccount, new java.sql.Date(new Date().getTime()));
        }
        return "redirect:/AdminSalesModifyCommission";
    }

    /**
     * @Author tad
     * @Date created in 2:45 PM 12/17/2017
     * @Description 查看佣金历史记录
     *
     * @params [httpServletRequest, model]
     * @return java.lang.String
     */
    @RequestMapping("/AdminSalesCommissionHistory")
    public String adminSalesCommissionHistory(HttpServletRequest httpServletRequest, Model model){
        if(httpServletRequest.getParameter("start") == null){
            model.addAttribute("commissions", adminCommissionService.selectSomeCommission(0, 20));
        }else{
            int start = Integer.valueOf(httpServletRequest.getParameter("start"));
            int pageSize = Integer.valueOf(httpServletRequest.getParameter("pageSize"));
            model.addAttribute("commissions", adminCommissionService.selectSomeCommission(start, pageSize));
        }
        return "Admin/AdminSalesCommissionHistory";
    }


    /**
     *  获取某年的某一个月的天数
     * @param year
     * @param month
     * @return
     */
    private int getDayOfMonth(int year, int month) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month - 1, 1);
        return calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
    }
}
