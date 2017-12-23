package com.ten.ParkNShop.entity;

/**
 * Created by cxh on 17/12/22.
 */
public class OrderItem {
    public Product product;
    public Order order;

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
}
