package com.trism.jesica.persistence.Entitiy.order;

import java.io.Serializable;

public class TbOrderDayGoodsOptionId implements Serializable {
    private Long orderGoodsNo;
    private Long storeOptNo;
    private Integer optItemNo;

    public TbOrderDayGoodsOptionId() {
    }

    public TbOrderDayGoodsOptionId(Long orderGoodsNo, Long storeOptNo, Integer optItemNo) {
        this.orderGoodsNo = orderGoodsNo;
        this.storeOptNo = storeOptNo;
        this.optItemNo = optItemNo;
    }

    public Long getOrderGoodsNo() {
        return this.orderGoodsNo;
    }

    public void setOrderGoodsNo(Long orderGoodsNo) {
        this.orderGoodsNo = orderGoodsNo;
    }

    public Long getStoreOptNo() {
        return this.storeOptNo;
    }

    public void setStoreOptNo(Long storeOptNo) {
        this.storeOptNo = storeOptNo;
    }

    public Integer getOptItemNo() {
        return this.optItemNo;
    }

    public void setOptItemNo(Integer optItemNo) {
        this.optItemNo = optItemNo;
    }
}
