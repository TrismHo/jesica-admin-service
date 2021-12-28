package com.trism.jesica.dto;

import lombok.Data;


@Data
public class TbStoreMultiData {

   private Long storeNo;
   private Integer multiType;
   private Integer masterChargeYn;
   private Integer masterGoodsYn;
   private Integer masterStoreNo;

    public Long getStoreNo() {
        return storeNo;
    }

    public void setStoreNo(Long storeNo) {
        this.storeNo = storeNo;
    }

    public Integer getMultiType() {
        return multiType;
    }

    public void setMultiType(Integer multiType) {
        this.multiType = multiType;
    }

    public Integer getMasterChargeYn() {
        return masterChargeYn;
    }

    public void setMasterChargeYn(Integer masterChargeYn) {
        this.masterChargeYn = masterChargeYn;
    }

    public Integer getMasterGoodsYn() {
        return masterGoodsYn;
    }

    public void setMasterGoodsYn(Integer masterGoodsYn) {
        this.masterGoodsYn = masterGoodsYn;
    }

    public Integer getMasterStoreNo() {
        return masterStoreNo;
    }

    public void setMasterStoreNo(Integer masterStoreNo) {
        this.masterStoreNo = masterStoreNo;
    }
}
