package com.ten.ParkNShop.service;

import com.ten.ParkNShop.entity.Buyer;

import java.util.List;

/**
 * @author: Archibald.
 * @Description:
 * @version:
 * @time: 12/11/2017.
 */
public interface AdminBuyerService {
    int insertBuyer(Buyer buyer);
    /**
     * @Author: Caihongyang
     * @Date: 3:23 PM 8/19/2017
     *
     * @Description: 新增一个Buyer
     * @Param: [Buyer]
     * @Return: int
     */

    int updateBuyer(Buyer buyer);
    /**
     * @Author: Caihongyang
     * @Date: 3:23 PM 8/19/2017
     *
     * @Description: 更新一个Buyer的信息
     * @Param: [Buyer]
     * @Return: int
     */

    int deleteBuyer(long id);
    /**
     * @Author: Caihongyang
     * @Date: 3:26 PM 8/19/2017
     *
     * @Description: 删除一个Buyer
     * @Param: long
     * @Return: int
     */

    Buyer selectBuyerById(long id);
    /**
     * @Author: Caihongyang
     * @Date: 3:26 PM 8/19/2017
     *
     * @Description: 通过ID查找一个Buyer
     * @Param: [id]
     * @Return: Buyer
     */
    Buyer selectByBuyername(String buyername);

    int selectBuyerStatus(int buyerId);


    int updateBuyerStatusToNormal(int buyerId);

    int updateBuyerStatusToFrozen(int buyerId);

    int updateBuyerStatusToBlacklist(int buyerId);

    List<Buyer> selectAllNormalBuyer(int start,int pageSize);
    List<Buyer> selectAllFrozenBuyer(int start,int pageSize);
    List<Buyer> selectAllBlacklistBuyer(int start,int pageSize);
    /**
     * @Author: Caihongyang
     * @Date: 3:34 PM 8/19/2017
     *
     * @Description: 查找offset后的所有Buyer的信息，每页显示size个
     * @Param: [offset：起始ID值, size：每页显示数]
     * @Return: java.util.List<Employee>
     */


}
