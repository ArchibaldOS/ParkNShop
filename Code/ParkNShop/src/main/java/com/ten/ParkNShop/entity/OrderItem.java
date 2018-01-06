package com.ten.ParkNShop.entity;

/**
 * Created by cxh on 17/12/22.
 */
public class OrderItem {
    public Product product;
    public Order order;
    public Seller seller;
    public Buyer buyer;
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;

    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Seller getSeller() {
        return seller;
    }

    public void setSeller(Seller seller) {
        this.seller = seller;
    }

	/**
	 * @return the buyer
	 */
	public Buyer getBuyer() {
		return buyer;
	}

	/**
	 * @param buyer the buyer to set
	 */
	public void setBuyer(Buyer buyer) {
		this.buyer = buyer;
	}
    
    
}
