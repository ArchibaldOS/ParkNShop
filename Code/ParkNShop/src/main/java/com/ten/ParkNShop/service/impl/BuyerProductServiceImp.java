package com.ten.ParkNShop.service.impl;

import com.ten.ParkNShop.entity.Product;
import com.ten.ParkNShop.entity.SearchInfo;
import com.ten.ParkNShop.mapper.ProductMapper;
import com.ten.ParkNShop.service.BuyerProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: Archibald.
 * @Description:
 * @version:
 * @time: 12/16/2017.
 */
@Service
public class BuyerProductServiceImp implements BuyerProductService{
    @Autowired
    private ProductMapper productMapper;

    public List<Product> searchByProductName(String productName){
        List<Product>products = productMapper.searchByProductName(productName);
        return products;
    }

    public List<Product> searchBySearchType(int searchType,int offset, int size){
        List<Product>products = productMapper.searchBySearchType(searchType,offset,size);
        return products;
    }

    public List<Product> searchByProductNameAndSearchType(String productName,int searchType){
        List<Product>products = productMapper.searchByProductNameAndSearchType(productName,searchType);
        return products;
    }

    public List<Product> searchTopSalesProducts(int topNum){
        List<Product>products = productMapper.searchTopSalesProducts(topNum);
        return products;
    }

    public int countByProductName(String productName){
        int num = productMapper.countByProductName(productName);
        return num;
    }

    public Product searchByProductId(int productId) {
        return productMapper.findByProductId(productId);
    }

}
