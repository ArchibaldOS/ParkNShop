package com.ten.ParkNShop.service.impl;

import com.ten.ParkNShop.entity.AD;
import com.ten.ParkNShop.mapper.ADMapper;
import com.ten.ParkNShop.service.AdminADService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author tad
 * @Date create in 1:30 PM 12/29/2017
 * @Description
 * @Modify By
 **/

@Service
public class AdminADServiceImpl implements AdminADService {

    @Autowired
    private ADMapper adMapper;

    public int insertAD(AD ad) {
        return adMapper.insert(ad);
    }

    public AD selectADByID(int adId) {
        return adMapper.selectByPrimaryKey(adId);
    }


    public List<AD> selectADByOtherId(int otherId) {
        return adMapper.selectADByOtherId(otherId);
    }

    public List<AD> selectADByADType(String adType) {
        return adMapper.selectADByADType(adType);
    }

    public List<AD> selectADByADStatus(String adStatus) {
        return adMapper.selectADByADStatus(adStatus);
    }

    public int deleteADByADId(int adId) {
        return adMapper.deleteByPrimaryKey(adId);
    }

    public int updateADByAD(AD ad) {
        return adMapper.updateByPrimaryKey(ad);
    }

    public List<AD> selectADTop10Product() {
        return adMapper.selectADTop10Product();
    }

    public List<AD> selectADTop5Store() {
        return adMapper.selectADTop5Store();
    }

    public List<AD> selectAllAD(int start, int pageSize) {
        return adMapper.selectAllAD(start, pageSize);
    }

    public float getADTotalIncomeWithTime(String startTime, String endTime) {
        Object object = adMapper.getADTotalIncomeWithTime(startTime, endTime);
        if(object == null){
            return 0;
        }else{
            return ((Double)object).floatValue();
        }
    }
}
