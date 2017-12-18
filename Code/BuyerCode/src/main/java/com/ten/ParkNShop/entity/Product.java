package com.ten.ParkNShop.entity;

public class Product {
	
	private int productId;
	private int sellerId;
	private String productName;
	private int productType;
	private float productPrice;
	private int storeCount;
	private int soldCount;
	private String productIntroduction;
	private String productPicture;

	public int getProductId() {
		return productId;
	}
	
	public void setProductId(int productId) {
		this.productId = productId;
	}
	
	public int getSellerId() {
		return sellerId;
	}
	
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	
	public String getProductName() {
		return productName;
	}
	
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public int getProductType() {
		return productType;
	}
	
	public void setProductType(int productType) {
		this.productType = productType;
	}
	
	public float getProductPrice() {
		return productPrice;
	}
	
	public void setProductPrice(float productPrice) {
		this.productPrice = productPrice;
	}
	
	public int getStoreCount() {
		return storeCount;
	}
	
	public void setStoreCount(int storeCount) {
		this.storeCount = storeCount;
	}
	
	public int getSoldCount() {
		return soldCount;
	}
	
	public void setSoldCount(int soldCount) {
		this.soldCount = soldCount;
	}
	
	public String getProductIntroduction() {
		return productIntroduction;
	}
	
	public void setProductIntroduction(String productIntroduction) {
		this.productIntroduction = productIntroduction;
	}
	
	public String getProductPicture() {
		return productPicture;
	}
	
	public void setProductPicture(String productPicture) {
		this.productPicture = productPicture;
	}

	@Override
	public String toString() {
		return "Product{" +
				"productId=" + productId +
				", sellerId=" + sellerId +
				", productName='" + productName + '\'' +
				", productType=" + productType +
				", productPrice=" + productPrice +
				", storeCount=" + storeCount +
				", soldCount=" + soldCount +
				", productIntroduction='" + productIntroduction + '\'' +
				", productPicture='" + productPicture + '\'' +
				'}';
	}
}
