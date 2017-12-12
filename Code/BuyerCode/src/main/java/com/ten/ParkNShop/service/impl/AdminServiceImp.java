package com.ten.ParkNShop.service.impl;

import com.ten.ParkNShop.entity.Admin;
import com.ten.ParkNShop.mapper.AdminMapper;
import com.ten.ParkNShop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: Archibald.
 * @Description:
 * @version:
 * @time: 12/5/2017.
 */
@Service
public class AdminServiceImp implements AdminService{
    @Autowired
    private AdminMapper adminMapper;

    public int insertAdmin(Admin admin) {
        /**
         * @Author: Caihongyang
         * @Date: 3:23 PM 8/19/2017
         *
         * @Description: 新增一个Admin
         * @Param: [Admin]
         * @Return: int
         */
        int i = adminMapper.insert(admin);
        return i;
    }

    public int updateAdmin(Admin admin) {
        /**
         * @Author: Caihongyang
         * @Date: 3:23 PM 8/19/2017
         *
         * @Description: 更新一个Admin的信息
         * @Param: [Admin]
         * @Return: int
         */
        int i = adminMapper.updateByPrimaryKey(admin);
        return i;
    }

    public int deleteAdmin(long id) {
        /**
         * @Author: Caihongyang
         * @Date: 3:26 PM 8/19/2017
         *
         * @Description: 删除一个Admin
         * @Param: long
         * @Return: int
         */
        int i = adminMapper.deleteByPrimaryKey((int) id);
        return i;
    }

    public Admin selectAdminById(long id) {
        /**
         * @Author: Caihongyang
         * @Date: 3:26 PM 8/19/2017
         *
         * @Description: 通过ID查找一个Admin
         * @Param: [id]
         * @Return: Admin
         */

        return adminMapper.selectByPrimaryKey((int) id);
    }

    public String selectAdminPassword(String adminAccount) {
        /**
        * @Author: Archibald
        * @Date: 4:24 PM 12/6/2017
        *
        * @Description: 查找adminPassword
        * @Param: [adminAccount]
        * @Return: java.lang.String
        */
        return adminMapper.selectAdminPassword(adminAccount);
    }

    public int selectAdminStatus(String adminAccount) {
        /**
         * @Author: Archibald
         * @Date: 4:24 PM 12/6/2017
         *
         * @Description: 查找adminPassword
         * @Param: [adminAccount]
         * @Return: java.lang.String
         */
        return adminMapper.selectAdminStatus(adminAccount);
    }

    public int updateAdminStatusToActive(String adminAccount){
        return adminMapper.updateAdminStatusToActive(adminAccount);
    }

    public int updateAdminStatusToInactive(String adminAccount){
        return adminMapper.updateAdminStatusToInactive(adminAccount);
    }

}
