package com.ten.ParkNShop.service;

public interface BuyerReturnsService {
    void refundOnly(int orderId);
    void returnAndRefund(int orderId);
}
