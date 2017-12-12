package com.ten.ParkNShop.entity;

import java.util.Date;

public class ProductAD {
    int productADId;
    int sellerId;
    int adminId;
    public int getProductADId() {
        return productADId;
    }
    public void setProductADId(int productADId) {
        this.productADId = productADId;
    }
    @Override
    public String toString() {
        return "ProductAD [productADId=" + productADId + ", sellerId=" + sellerId + ", adminId=" + adminId
                + ", productADName=" + productADName + ", productADPhotoUrl=" + productADPhotoUrl
                + ", productADClickUrl=" + productADClickUrl + ", productADPrice=" + productADPrice
                + ", productADStartDate=" + productADStartDate + ", productADEndDate=" + productADEndDate + "]";
    }
    public int getSellerId() {
        return sellerId;
    }
    public void setSellerId(int sellerId) {
        this.sellerId = sellerId;
    }
    public int getAdminId() {
        return adminId;
    }
    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }
    public String getProductADName() {
        return productADName;
    }
    public void setProductADName(String productADName) {
        this.productADName = productADName;
    }
    public String getProductADPhotoUrl() {
        return productADPhotoUrl;
    }
    public void setProductADPhotoUrl(String productADPhotoUrl) {
        this.productADPhotoUrl = productADPhotoUrl;
    }
    public String getProductADClickUrl() {
        return productADClickUrl;
    }
    public void setProductADClickUrl(String productADClickUrl) {
        this.productADClickUrl = productADClickUrl;
    }
    public double getProductADPrice() {
        return productADPrice;
    }
    public void setProductADPrice(double productADPrice) {
        this.productADPrice = productADPrice;
    }
    public Date getProductADStartDate() {
        return productADStartDate;
    }
    public void setProductADStartDate(Date productADStartDate) {
        this.productADStartDate = productADStartDate;
    }
    public Date getProductADEndDate() {
        return productADEndDate;
    }
    public void setProductADEndDate(Date productADEndDate) {
        this.productADEndDate = productADEndDate;
    }
    String productADName;
    String productADPhotoUrl;
    String productADClickUrl;
    double productADPrice;
    Date productADStartDate;
    Date productADEndDate;

}

