package com.ten.ParkNShop.entity;

public class Seller {

    private int sellerId;
    private String sellerName;
    private String shopName;
    private String sellerPassword;
    private String sellerPhone;
    private String sellerEmail;
    private float sellerBalance;
    private String shopIntroduction;
    private int shopStatus;
    public int getSellerId() {
        return sellerId;
    }
    public void setSellerId(int sellerId) {
        this.sellerId = sellerId;
    }
    public String getSellerName() {
        return sellerName;
    }
    public void setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }
    public String getShopName() {
        return shopName;
    }
    public void setShopName(String shopName) {
        this.shopName = shopName;
    }
    public String getSellerPassword() {
        return sellerPassword;
    }
    public void setSellerPassword(String sellerPassword) {
        this.sellerPassword = sellerPassword;
    }
    public String getSellerPhone() {
        return sellerPhone;
    }
    public void setSellerPhone(String sellerPhone) {
        this.sellerPhone = sellerPhone;
    }
    public String getSellerEmail() {
        return sellerEmail;
    }
    public void setSellerEmail(String sellerEmail) {
        this.sellerEmail = sellerEmail;
    }
    public float getSellerBalance() {
        return sellerBalance;
    }
    public void setSellerBalance(float sellerBalance) {
        this.sellerBalance = sellerBalance;
    }
    public String getShopIntroduction() {
        return shopIntroduction;
    }
    public void setShopIntroduction(String shopIntroduction) {
        this.shopIntroduction = shopIntroduction;
    }
    public int getShopStatus() {
        return shopStatus;
    }
    public void setShopStatus(int shopStatus) {
        this.shopStatus = shopStatus;
    }

    @Override
    public String toString() {
        return "Seller{" +
                "sellerId=" + sellerId +
                ", sellerName='" + sellerName + '\'' +
                ", shopName='" + shopName + '\'' +
                ", sellerPassword='" + sellerPassword + '\'' +
                ", sellerPhone='" + sellerPhone + '\'' +
                ", sellerEmail='" + sellerEmail + '\'' +
                ", sellerBalance=" + sellerBalance +
                ", shopIntroduction='" + shopIntroduction + '\'' +
                ", shopStatus=" + shopStatus +
                '}';
    }
}
