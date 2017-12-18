package com.ten.ParkNShop.controller;

import com.ten.ParkNShop.entity.Commission;
import com.ten.ParkNShop.entity.Order;
import com.ten.ParkNShop.service.AdminCommissionService;
import com.ten.ParkNShop.service.AdminOrderService;
import com.ten.ParkNShop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
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


    @RequestMapping("/AdminSalesManagement")
    public String adminSalesManagement(HttpServletRequest httpServletRequest, Model model){
        String timeType = httpServletRequest.getParameter("select_type");
        String time = httpServletRequest.getParameter("time");
        if(timeType == null){
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            timeType = "Daily";
            time = df.format(new Date());
        }
        if(timeType.equals("Daily")){
            model.addAttribute("time", time);
            String[] labels = {"0:00", "4:00", "8:00", "12:00", "16:00", "20:00"};
            model.addAttribute("labels", labels);
            // 获取信息
            List<Object> salesCondition= getHoursCountAndSales(time);
            List<Integer> counts = (List<Integer>) salesCondition.get(0);
            List<Float> moneys = (List<Float>) salesCondition.get(1);
            System.out.println(counts);
            System.out.println(moneys);
            model.addAttribute("counts", counts);
            model.addAttribute("moneys", moneys);

        }else if(timeType.equals("Weekly")){
            String[] labels = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
            model.addAttribute("labels", labels);


        }else if(timeType.equals("Monthly")){

            // 获取一个月的最后一天
            int year = Integer.valueOf(time.split(time)[0]);
            int month = Integer.valueOf(time.split("-")[1]);
            Calendar calendar = Calendar.getInstance();
            calendar.set(year, month, 1);
            int dayOfMonth = calendar.get(Calendar.DAY_OF_MONTH);

            String[] labels = {"0", "5", "10", "15", "20", "25", String.valueOf(dayOfMonth)};
            model.addAttribute("labels", labels);

        }else{
            String[] labels = {"Jan", "Feb","Mar","Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov","Dec"};
            model.addAttribute("labels", labels);

        }


        return "Admin/AdminSalesManagement";
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
    private List<Object> getHoursCountAndSales(String time) {
        List<Integer> counts = new ArrayList<Integer>();
        List<Float> moneys = new ArrayList<Float>();
        for(int hour = 0; hour < 24; hour = hour + 4 ){
            String startTime = time + " " + hour + ":00";
            String endtTime = time + " " + (hour + 4) + ":00";
            List<Order> orders = adminOrderService.selectAllOrdersBetweenTime(startTime, endtTime, 2);
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
     * @Description 进行佣金比例的历史记录查询
     *
     * @params [httpServletRequest, model]
     * @return java.lang.String
     */
    @RequestMapping("/AdminSalesCommissionHistory")
    public String adminSalesCommissionHistory(HttpServletRequest httpServletRequest, Model model){
        if(httpServletRequest.getParameter("start") == null){
            model.addAttribute("commissions", adminCommissionService.selectSomneCommission(0, 20));
        }else{
            int start = Integer.valueOf(httpServletRequest.getParameter("start"));
            int pageSize = Integer.valueOf(httpServletRequest.getParameter("pageSize"));
            model.addAttribute("commissions", adminCommissionService.selectSomneCommission(start, pageSize));
        }
        return "Admin/AdminSalesCommissionHistory";
    }
    @RequestMapping("/testChartJS")
    public String testChartJS(Model model){
        model.addAttribute("type", "sales");
        model.addAttribute("timeType", "daily");
        String[] strs = {"1","2","3","4","5","6"};
        model.addAttribute("label",strs);
        int[] data = {1, 2, 5 , 7 , 9, 10};
        model.addAttribute("data", data);
        return "Admin/testChartJS";
    }
}
