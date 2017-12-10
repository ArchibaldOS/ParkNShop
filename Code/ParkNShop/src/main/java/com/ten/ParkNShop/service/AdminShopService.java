package com.ten.ParkNShop.service;

import com.ten.ParkNShop.entity.Seller;

import java.util.List;

/**
 * @author: Archibald.
 * @Description:
 * @version:
 * @time: 12/10/2017.
 */
public interface AdminShopService {
    int insertSeller(Seller seller);
    /**
     * @Author: Caihongyang
     * @Date: 3:23 PM 8/19/2017
     *
     * @Description: 新增一个Seller
     * @Param: [Seller]
     * @Return: int
     */

    int updateSeller(Seller seller);
    /**
     * @Author: Caihongyang
     * @Date: 3:23 PM 8/19/2017
     *
     * @Description: 更新一个Seller的信息
     * @Param: [Seller]
     * @Return: int
     */

    int deleteSeller(long id);
    /**
     * @Author: Caihongyang
     * @Date: 3:26 PM 8/19/2017
     *
     * @Description: 删除一个Seller
     * @Param: long
     * @Return: int
     */

    Seller selectSellerById(long id);
    /**
     * @Author: Caihongyang
     * @Date: 3:26 PM 8/19/2017
     *
     * @Description: 通过ID查找一个Seller
     * @Param: [id]
     * @Return: Seller
     */
    Seller selectByShopname(String shopname);

    Seller selectBySellername(String sellername);

    int selectSellerStatus(int sellerId);


    int updateShopStatusToWaitToApproved(int sellerId);

    int updateShopStatusToApproved(int sellerId);

    int updateShopStatusToUnapproved(int sellerId);

    int updateShopStatusToBan(int sellerId);

    List<Seller> selectAllRegisterShop(int offset, int size);
    List<Seller> selectAllApprovedShop(int offset, int size);
    List<Seller> selectAllUnapprovedShop(int offset, int size);
    List<Seller> selectAllBlacklistShop(int offset, int size);
    /**
     * @Author: Caihongyang
     * @Date: 3:34 PM 8/19/2017
     *
     * @Description: 查找offset后的所有Seller的信息，每页显示size个
     * @Param: [offset：起始ID值, size：每页显示数]
     * @Return: java.util.List<Employee>
     */


}
