package com.ten.ParkNShop.service;

import com.ten.ParkNShop.entity.Admin;
import com.ten.ParkNShop.entity.BackupHistory;

import java.util.List;

/**
 * @author: Archibald.
 * @Description:
 * @version:
 * @time: 12/5/2017.
 */
public interface AdminService {
    int insertAdmin(Admin admin);
    /**
     * @Author: Caihongyang
     * @Date: 3:23 PM 8/19/2017
     *
     * @Description: 新增一个Admin
     * @Param: [Admin]
     * @Return: int
     */

    int updateAdmin(Admin admin);
    /**
     * @Author: Caihongyang
     * @Date: 3:23 PM 8/19/2017
     *
     * @Description: 更新一个Admin的信息
     * @Param: [Admin]
     * @Return: int
     */

    int deleteAdmin(long id);
    /**
     * @Author: Caihongyang
     * @Date: 3:26 PM 8/19/2017
     *
     * @Description: 删除一个Admin
     * @Param: long
     * @Return: int
     */

    Admin selectAdminById(long id);
    /**
     * @Author: Caihongyang
     * @Date: 3:26 PM 8/19/2017
     *
     * @Description: 通过ID查找一个Admin
     * @Param: [id]
     * @Return: Admin
     */

    String selectAdminPassword(String adminAccount);

    int selectAdminStatus(String adminAccount);

    int updateAdminStatusToActive(String adminAccount);

    int updateAdminStatusToInactive(String adminAccount);

    List<BackupHistory> selectAllBackupHistory(int offset, int size);


}
