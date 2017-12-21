package com.ten.ParkNShop.mapper;

import java.util.List;

import com.ten.ParkNShop.entity.SearchInfo;
import org.apache.ibatis.annotations.Param;

import com.ten.ParkNShop.entity.Product;

public interface ProductMapper {
	
	int addProduct(Product product);

	int count(int sellerId);

	List<Product> findAllBySellerId(int sellerId);
	
	int delete(@Param("productId")int productId);

	Product findByProductId(int productId);

	int updateProduct1(Product product);
	
	int updateProduct2(Product product);
	
	List<Product> sellerFindByPage(@Param("sellerId")int sellerId, @Param("start") int start, @Param("pageSize")int pageSize);

	List<Product> searchByProductName(String productName);

	List<Product> searchBySearchType(@Param("searchType")int searchType,@Param("start")int start,@Param("pageSize")int pageSize);

	List<Product> searchByProductNameAndSearchType(SearchInfo searchInfo);

	List<Product> searchTopSalesProducts(int topNum);

	int countByProductName(String productName);

}
