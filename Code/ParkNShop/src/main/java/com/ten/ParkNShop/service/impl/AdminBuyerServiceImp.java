package com.ten.ParkNShop.service.impl;

import com.ten.ParkNShop.entity.Buyer;
import com.ten.ParkNShop.mapper.BuyerMapper;
import com.ten.ParkNShop.service.AdminBuyerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: Archibald.
 * @Description:
 * @version:
 * @time: 12/11/2017.
 */
@Service
public class AdminBuyerServiceImp implements AdminBuyerService{
    @Autowired
    private BuyerMapper buyerMapper;

    public int insertBuyer(Buyer buyer) {
        /**
         * @Author: Caihongyang
         * @Date: 3:23 PM 8/19/2017
         *
         * @Description: 新增一个Buyer
         * @Param: [Buyer]
         * @Return: int
         */
        int i = buyerMapper.insert(buyer);
        return i;
    }

    public int updateBuyer(Buyer buyer) {
        /**
         * @Author: Caihongyang
         * @Date: 3:23 PM 8/19/2017
         *
         * @Description: 更新一个Buyer的信息
         * @Param: [Buyer]
         * @Return: int
         */
        int i = buyerMapper.updateByPrimaryKey(buyer);
        return i;
    }

    public int deleteBuyer(long id) {
        /**
         * @Author: Caihongyang
         * @Date: 3:26 PM 8/19/2017
         *
         * @Description: 删除一个Buyer
         * @Param: long
         * @Return: int
         */
        int i = buyerMapper.deleteByPrimaryKey((int) id);
        return i;
    }

    public Buyer selectBuyerById(long id) {
        /**
         * @Author: Caihongyang
         * @Date: 3:26 PM 8/19/2017
         *
         * @Description: 通过ID查找一个Buyer
         * @Param: [id]
         * @Return: Buyer
         */

        return buyerMapper.selectByPrimaryKey((int) id);
    }
    public Buyer selectByBuyername(String buyername) {
        /**
         * @Author: Caihongyang
         * @Date: 3:26 PM 8/19/2017
         *
         * @Description: 通过Buyername查找一个Buyer
         */

        return buyerMapper.selectByBuyername(buyername);
    }


    public int selectBuyerStatus(int buyerId) {
        /**
         * @Author: Archibald
         * @Date: 4:24 PM 12/6/2017
         *
         * @Description: 查找BuyerPassword
         * @Param: [BuyerAccount]
         * @Return: java.lang.String
         */
        return buyerMapper.selectBuyerStatus(buyerId);
    }

    public int updateBuyerStatusToNormal(int buyerId){
        return buyerMapper.updateBuyerStatusToNormal(buyerId);
    }
    public int updateBuyerStatusToFrozen(int buyerId){
        return buyerMapper.updateBuyerStatusToFrozen(buyerId);
    }
    public int updateBuyerStatusToBlacklist(int buyerId){
        return buyerMapper.updateBuyerStatusToBlacklist(buyerId);
    }

    public List<Buyer> selectAllNormalBuyer(int offset, int size) {
        /**
         * @Author: Caihongyang
         * @Date: 3:34 PM 8/19/2017
         *
         * @Description: 查找offset后的所有Employee的信息，每页显示size个
         * @Param: [offset：起始ID值, size：每页显示数]
         * @Return: java.util.List<Employee>
         */
        List<Buyer> Buyers = buyerMapper.selectAllNormalBuyer(offset, size);
        return Buyers;
    }
    public List<Buyer> selectAllFrozenBuyer(int offset, int size) {
        /**
         * @Author: Caihongyang
         * @Date: 3:34 PM 8/19/2017
         *
         * @Description: 查找offset后的所有Employee的信息，每页显示size个
         * @Param: [offset：起始ID值, size：每页显示数]
         * @Return: java.util.List<Employee>
         */
        List<Buyer> Buyers = buyerMapper.selectAllFrozenBuyer(offset, size);
        return Buyers;
    }
    public List<Buyer> selectAllBlacklistBuyer(int offset, int size) {
        /**
         * @Author: Caihongyang
         * @Date: 3:34 PM 8/19/2017
         *
         * @Description: 查找offset后的所有Employee的信息，每页显示size个
         * @Param: [offset：起始ID值, size：每页显示数]
         * @Return: java.util.List<Employee>
         */
        List<Buyer> Buyers = buyerMapper.selectAllBlacklistBuyer(offset, size);
        return Buyers;
    }
}
