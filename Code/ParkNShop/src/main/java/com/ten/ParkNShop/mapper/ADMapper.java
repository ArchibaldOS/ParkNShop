package com.ten.ParkNShop.mapper;

import com.ten.ParkNShop.entity.AD;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ADMapper {

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ad
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer adId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ad
     *
     * @mbggenerated
     */
    int insert(AD record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ad
     *
     * @mbggenerated
     */
    int insertSelective(AD record);


    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ad
     *
     * @mbggenerated
     */
    AD selectByPrimaryKey(Integer adId);


    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ad
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(AD record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ad
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(AD record);

    // 通过卖家 ID 选择广告
    List<AD> selectADByOtherId(@Param("sellerId") int sellerId);

    // 通过广告类型选择广告
    List<AD> selectADByADType(@Param("adType") String adType);

    // 通过广告状态选择广告
    List<AD> selectADByADStatus(@Param("adStatus") String adStatus);

    // 获取 Top10 商品广告
    List<AD> selectADTop10Product();

    // 获取 Top5 店铺广告
    List<AD> selectADTop5Store();

    //获取一段时间之内的广告收入
    Object getADTotalIncomeWithTime(@Param("startTime") String startTime, @Param("endTime") String endTime);

    List<AD> selectAllAD(@Param("start") int start, @Param("pageSize") int pageSize);
    
    List<AD> selectShopAD(@Param("sellerId")int sellerId);
    
    List<AD> selectProductAD(@Param("sellerId")int sellerId);
    
    int insertAd(AD ad);
}