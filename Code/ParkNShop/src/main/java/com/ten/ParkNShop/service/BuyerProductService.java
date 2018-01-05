package com.ten.ParkNShop.service;

import com.ten.ParkNShop.entity.Product;
import com.ten.ParkNShop.entity.SearchInfo;

import java.util.List;

/**
 * @author: Archibald.
 * @Description:
 * @version:
 * @time: 12/16/2017.
 */
public interface BuyerProductService {
    List<Product> searchByProductName(String productName);

    List<Product> searchBySearchType(int searchType,int offset, int size);

    List<Product> searchByProductNameAndSearchType(String productName,int searchType);

    List<Product> searchTopSalesProducts(int topNum);

    int countByProductName(String productName);

    Product searchByProductId(int productId);
}
