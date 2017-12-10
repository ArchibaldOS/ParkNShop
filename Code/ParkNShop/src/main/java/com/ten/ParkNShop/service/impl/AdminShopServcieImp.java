package com.ten.ParkNShop.service.impl;

import com.ten.ParkNShop.entity.Seller;
import com.ten.ParkNShop.mapper.SellerMapper;
import com.ten.ParkNShop.service.AdminShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: Archibald.
 * @Description:
 * @version:
 * @time: 12/10/2017.
 */
@Service
public class AdminShopServcieImp implements AdminShopService{
    @Autowired
    private SellerMapper sellerMapper;

    public int insertSeller(Seller seller) {
        /**
         * @Author: Caihongyang
         * @Date: 3:23 PM 8/19/2017
         *
         * @Description: 新增一个Seller
         * @Param: [Seller]
         * @Return: int
         */
        int i = sellerMapper.insert(seller);
        return i;
    }

    public int updateSeller(Seller seller) {
        /**
         * @Author: Caihongyang
         * @Date: 3:23 PM 8/19/2017
         *
         * @Description: 更新一个Seller的信息
         * @Param: [Seller]
         * @Return: int
         */
        int i = sellerMapper.updateByPrimaryKey(seller);
        return i;
    }

    public int deleteSeller(long id) {
        /**
         * @Author: Caihongyang
         * @Date: 3:26 PM 8/19/2017
         *
         * @Description: 删除一个Seller
         * @Param: long
         * @Return: int
         */
        int i = sellerMapper.deleteByPrimaryKey((int) id);
        return i;
    }

    public Seller selectSellerById(long id) {
        /**
         * @Author: Caihongyang
         * @Date: 3:26 PM 8/19/2017
         *
         * @Description: 通过ID查找一个Seller
         * @Param: [id]
         * @Return: Seller
         */

        return sellerMapper.selectByPrimaryKey((int) id);
    }


    public int selectSellerStatus(int sellerId) {
        /**
         * @Author: Archibald
         * @Date: 4:24 PM 12/6/2017
         *
         * @Description: 查找SellerPassword
         * @Param: [SellerAccount]
         * @Return: java.lang.String
         */
        return sellerMapper.selectShopStatus(sellerId);
    }

    public int updateShopStatusToWaitToApproved(int sellerId){
        return sellerMapper.updateShopStatusToWaitToApproved(sellerId);
    }
    public int updateShopStatusToApproved(int sellerId){
        return sellerMapper.updateShopStatusToApproved(sellerId);
    }
    public int updateShopStatusToUnapproved(int sellerId){
        return sellerMapper.updateShopStatusToUnapproved(sellerId);
    }
    public int updateShopStatusToBan(int sellerId){
        return sellerMapper.updateShopStatusToBan(sellerId);
    }

    public List<Seller> selectAllRegisterShop(int offset, int size) {
        /**
         * @Author: Caihongyang
         * @Date: 3:34 PM 8/19/2017
         *
         * @Description: 查找offset后的所有Employee的信息，每页显示size个
         * @Param: [offset：起始ID值, size：每页显示数]
         * @Return: java.util.List<Employee>
         */
        List<Seller> sellers = sellerMapper.selectAllRegisterShop(offset, size);
        return sellers;
    }
    public List<Seller> selectAllApprovedShop(int offset, int size) {
        /**
         * @Author: Caihongyang
         * @Date: 3:34 PM 8/19/2017
         *
         * @Description: 查找offset后的所有Employee的信息，每页显示size个
         * @Param: [offset：起始ID值, size：每页显示数]
         * @Return: java.util.List<Employee>
         */
        List<Seller> sellers = sellerMapper.selectAllApprovedShop(offset, size);
        return sellers;
    }
    public List<Seller> selectAllUnapprovedShop(int offset, int size) {
        /**
         * @Author: Caihongyang
         * @Date: 3:34 PM 8/19/2017
         *
         * @Description: 查找offset后的所有Employee的信息，每页显示size个
         * @Param: [offset：起始ID值, size：每页显示数]
         * @Return: java.util.List<Employee>
         */
        List<Seller> sellers = sellerMapper.selectAllUnapprovedShop(offset, size);
        return sellers;
    }
    public List<Seller> selectAllBlacklistShop(int offset, int size) {
        /**
         * @Author: Caihongyang
         * @Date: 3:34 PM 8/19/2017
         *
         * @Description: 查找offset后的所有Employee的信息，每页显示size个
         * @Param: [offset：起始ID值, size：每页显示数]
         * @Return: java.util.List<Employee>
         */
        List<Seller> sellers = sellerMapper.selectAllBlacklistShop(offset, size);
        return sellers;
    }
}
