package com.ten.ParkNShop.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author: Archibald.
 * @Description:
 * @version:
 * @time: 12/16/2017.
 */
public class BuyerCart implements Serializable{

    /**
     * 购物车
     */
    private static final long serialVersionUID = 1L;

    //商品结果集
    private List<BuyerItem> items = new ArrayList<BuyerItem>();

    //添加购物项到购物车
    public void addItem(BuyerItem item){
        //判断是否包含同款
        if (items.contains(item)) {
            //追加数量
            for (BuyerItem buyerItem : items) {
                if (buyerItem.equals(item)) {
                    buyerItem.setAmount(item.getAmount() + buyerItem.getAmount());
                }
            }
        }else {
            items.add(item);
        }

    }

    public List<BuyerItem> getItems() {
        return items;
    }

    public void setItems(List<BuyerItem> items) {
        this.items = items;
    }


    //小计
    //商品数量
    @JsonIgnore
    public Integer getProductAmount(){
        Integer result = 0;
        //计算
        for (BuyerItem buyerItem : items) {
            result += buyerItem.getAmount();
        }
        return result;
    }

    //商品金额
    @JsonIgnore
    public Float getProductPrice(){
        Float result = 0f;
        //计算
        for (BuyerItem buyerItem : items) {
            result += buyerItem.getAmount()*buyerItem.getProduct().getProductPrice();
        }
        return result;
    }

    //运费
    @JsonIgnore
    public Float getFee(){
        Float result = 0f;
        //计算
        //低于79不包邮
        if (getProductPrice() < 79) {
            result = 5f;
        }

        return result;
    }

    //总价
    @JsonIgnore
    public Float getTotalPrice(){
        return getProductPrice() + getFee();
    }

}