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

        // 濡傛灉鐩存帴璁块棶椤甸潰閭ｄ箞澶勭悊涓哄綋鍓嶆棩鏈熺殑鏃ラ攢鍞儏鍐�
        if(timeType == null){
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            timeType = "Daily";
            time = df.format(new Date());
        }

        // 鎵�閫夋椂闂寸被鍨嬩紶閫掑洖鍘�
        model.addAttribute("timeType", timeType);

        if(timeType.equals("Daily")){
            model.addAttribute("time", time);
            String[] labels = {"0:00", "4:00", "8:00", "12:00", "16:00", "20:00", "24:00"};
            model.addAttribute("labels", labels);
            // 鑾峰彇淇℃伅
            List<Object> salesCondition= getDaysCountAndSales(time);
            List<Integer> counts = (List<Integer>) salesCondition.get(0);
            List<Float> moneys = (List<Float>) salesCondition.get(1);

            model.addAttribute("counts", counts);
            model.addAttribute("moneys", moneys);

        }else if(timeType.equals("Weekly")){
            model.addAttribute("time", time);
            String[] labels = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
            model.addAttribute("labels", labels);

            // 鑾峰彇閿�鍞儏鍐� 浼犲叆鍙傛暟涓哄舰鐘朵负 2017-W51
            List<Object> salesCondition = getWeeksCountAndSales(time);

            List<Integer> counts = (List<Integer>) salesCondition.get(0);
            List<Float> moneys = (List<Float>) salesCondition.get(1);

            model.addAttribute("counts", counts);
            model.addAttribute("moneys", moneys);


        }else if(timeType.equals("Monthly")){

            model.addAttribute("time", time);

            // 鑾峰彇涓�涓湀鐨勬渶鍚庝竴澶�
            int year = Integer.valueOf(time.split("-")[0]);
            int month = Integer.valueOf(time.split("-")[1]);

            int dayOfMonth = getDayOfMonth(year,month);

            String[] labels = {"1", "4", "7", "10", "13", "16", "19","22","25",String.valueOf(dayOfMonth)};
            model.addAttribute("labels", labels);

            // 鑾峰彇閿�鍞儏鍐� 浼犲叆鍙傛暟涓哄舰鐘朵负 year month
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

    // 鑾峰彇涓�骞寸殑閿�鍞儏鍐� 12涓爣绛�
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

    // 鑾峰彇涓�涓湀鐨勫叿浣撻攢鍞儏鍐� 鍒嗕负 10 涓爣绛撅紝鍓嶄節涓负3澶╋紝鍚庨潰涓�涓负杩欎釜鏈堝墿浣欑殑澶╂暟鐨勬�昏
    private List<Object> getMonthCountAndSales(int year, int month) {

        // 瀛樺偍缁熻鐨勬儏鍐�
        List<Integer> counts = new ArrayList<Integer>();
        List<Float> moneys = new ArrayList<Float>();

        // 璁剧疆涓�涓紑濮嬫椂闂�
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month - 1, 1);

        //鍓嶄節涓樁娈佃偗瀹氭槸婊＄殑
        for(int i = 0; i < 10; i++){
            String startTime ="" +  year + "-" + month + "-" + calendar.get(Calendar.DAY_OF_MONTH);
            String endTime = null;
            // 鏃ユ湡鍚戝墠绉诲姩涓ゅぉ
            if (i < 9){
                // 鏃ユ湡鍚戝墠绉诲姩涓ゅぉ
                calendar.add(Calendar.DAY_OF_MONTH, 2);
                endTime = "" +  year + "-" + month + "-" + calendar.get(Calendar.DAY_OF_MONTH);
            } else{
                // 鐩存帴浣跨敤鏈�鍚庝竴澶�
                endTime = "" +  year + "-" + month + "-" + getDayOfMonth(year, month);
            }
            List<Order> orders = adminOrderService.selectAllOrdersBetweenTime(startTime, endTime, 1);
            float money = 0;
            for(Order order: orders){
                money += order.gettotalPrice();
            }
            counts.add(orders.size());
            moneys.add(money);
            //鏃ユ湡鍚戝墠绉诲姩涓�澶�
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
     * @Description 鑾峰彇涓�鍛ㄧ殑璁㈠崟鎯呭喌
     *
     * @params [time]  String 涓�骞寸殑鏌愪竴鍛ㄧ殑琛ㄨ揪锛屼緥濡� 2017-W51
     * @return java.util.List<java.lang.Object>
     */
    private List<Object> getWeeksCountAndSales(String time) {
        // 鑾峰彇 Integer 鐨勫勾鍜屽懆
        int week = Integer.valueOf(time.split("W")[1]);
        int year = Integer.valueOf(time.split("-")[0]);

        // 鑾峰彇鏌愪竴骞寸殑鏌愪竴鍛ㄧ殑寮�濮嬫棩鏈�
        Calendar calendar = Calendar.getInstance();
        // 璁剧疆涓�鍛ㄧ殑寮�濮嬫椂闂翠负 鍛ㄤ竴 榛樿鍛ㄤ簩
        calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        calendar.set(Calendar.YEAR, year);
        calendar.set(Calendar.WEEK_OF_YEAR, week);

        // 瀛樺偍缁熻鐨勬儏鍐�
        List<Integer> counts = new ArrayList<Integer>();
        List<Float> moneys = new ArrayList<Float>();

        // 鑾峰彇涓�鍛ㄧ殑鍏蜂綋閿�鍞儏鍐碉紝浠ュぉ涓哄崟浣�
        for(int i = 0; i < 7; i++){
            String startTime = calendar.get(Calendar.YEAR) + "-" + (calendar.get(Calendar.MONTH) + 1) + "-" + calendar.get(Calendar.DAY_OF_MONTH);
            List<Order> orders = adminOrderService.selectAllOrdersBetweenTime(startTime, startTime, 1);
            float money = 0;
            for(Order order: orders){
                money += order.gettotalPrice();
            }
            counts.add(orders.size());
            moneys.add(money);
            //鏃ユ湡鍚戝墠绉诲姩涓�澶�
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
     * @Description 鑾峰彇涓�娈靛悇涓皬鏃跺唴鐨勯攢鍞噺鍜岄攢鍞
     *
     * @params []
     * @return List<Object> 鍖呭惈涓ゆ潯鏁版嵁锛岀涓�鏉℃暟鎹槸List<Integer> 琛ㄧず閿�閲忔儏鍐� 绗簩鏉℃槸 List<Float> 琛ㄧず 閿�鍞鐨勬儏鍐�
     * @param time
     */
    private List<Object> getDaysCountAndSales(String time) {
        List<Integer> counts = new ArrayList<Integer>();
        List<Float> moneys = new ArrayList<Float>();
        counts.add(0);
        moneys.add(Float.valueOf(0));
        for(int hour = 0; hour < 24; hour = hour + 4 ){
            String startTime = time + " " + hour + ":00";
            String endTime = time + " " + (hour + 3) + ":59";
            List<Order> orders = adminOrderService.selectAllOrdersBetweenTime(startTime, endTime, 2);
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
     * @Description 璇锋眰淇敼浣ｉ噾姣斾緥鐨勯〉闈�
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
        // 濡傛灉瀵嗙爜浜夋纭紝杩涜鏂扮殑浣ｉ噾姣斾緥鐨勬煡璇�
        // TODO 瀵嗙爜閿欒鐨勫鐞�
        if(submitAdminPassWord.equals(adminService.selectAdminPassword(submitAdminAccount))){
            adminCommissionService.insertLast(newCommission, submitAdminAccount, new java.sql.Date(new Date().getTime()));
        }
        return "redirect:/AdminSalesModifyCommission";
    }

    /**
     * @Author tad
     * @Date created in 2:45 PM 12/17/2017
     * @Description 杩涜浣ｉ噾姣斾緥鐨勫巻鍙茶褰曟煡璇�
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


    /**
     * 鑾峰彇鏌愬勾鐨勬煇涓�涓湀鐨勫ぉ鏁�
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
