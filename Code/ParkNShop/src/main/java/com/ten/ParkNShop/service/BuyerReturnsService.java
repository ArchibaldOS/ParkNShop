package com.ten.ParkNShop.service;

public interface BuyerReturnsService {
    void refundOnly(int orderId);
    void refundAndReturn(int orderId);
}
