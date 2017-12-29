package com.ten.ParkNShop.service;

import com.ten.ParkNShop.entity.AD;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author TAD
 * @Date create in 1:18 PM 12/29/2017
 * @description
 * @Modify By
 **/
public interface AdminADService {

    // insert a AD
    int insertAD(AD ad);

    // select ad by adId
    AD selectADByID(int adId);

    // select ads by sellerId
    List<AD> selectADBySellerId(int sellerId);

    // select ads by adType
    List<AD> selectADByADType(String adType);

    // select ads by ad status
    List<AD> selectADByADStatus(String adStatus);

    // delete ad from ad list by  adId
    int deleteADByADId(int adId);

    // update ad by ad
    int updateADByAD(AD ad);

    // 获取 Top10 商品广告
    List<AD> selectADTop10Product();

    // 获取 Top5 店铺广告
    List<AD> selectADTop5Store();

    // 获取所有的 AD
    List<AD> selectAllAD(int start, int pageSize);

}
