package com.ten.ParkNShop.entity;

import java.io.Serializable;

/**
 * @author: Archibald.
 * @Description:
 * @version:
 * @time: 12/16/2017.
 */
public class BuyerItem implements Serializable {

    private static final long serialVersionUID = 1L;

    //Product对象
    private Product product;

    //是否有货
    private Boolean isHave = true;

    //购买的数量
    private Integer amount = 1;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Boolean getIsHave() {
        return isHave;
    }

    public void setIsHave(Boolean isHave) {
        this.isHave = isHave;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((product == null) ? 0 : product.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) //比较地址
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        BuyerItem other = (BuyerItem) obj;
        if (product == null) {
            if (other.product != null)
                return false;
        } else if (!(product.getProductId() == (other.product.getProductId())))
            return false;
        return true;
    }
}
