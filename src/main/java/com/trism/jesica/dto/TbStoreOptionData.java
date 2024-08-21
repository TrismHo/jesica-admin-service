package com.trism.jesica.dto;

import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreOption;
import com.trism.jesica.persistence.mysql.type.DataStatus;
import lombok.Data;


@Data
public class TbStoreOptionData {

    private Long storeOptNo;

    private Integer storeNo;

    private String insertUserId;

    private String updateUserId;

    private DataStatus dataStatus;

    private String optName;

    private Boolean mandatoryYn;

    private Integer minSelectCnt;

    private Integer maxSelectCnt;


    public TbStoreOption insertData() {
        return TbStoreOption.builder()
                .storeOptNo(this.storeOptNo)
                .storeNo(this.storeNo)
                .insertUserId(this.insertUserId)
                .updateUserId(this.updateUserId)
                .dataStatus(this.dataStatus)
                .optName(this.optName)
                .mandatoryYn(this.mandatoryYn)
                .minSelectCnt(this.minSelectCnt)
                .maxSelectCnt(this.maxSelectCnt)
                .build();
    }


    public TbStoreOption updateData() {
        return TbStoreOption.builder()
                .storeOptNo(this.storeOptNo)
                .storeNo(this.storeNo)
                .insertUserId(this.insertUserId)
                .updateUserId(this.updateUserId)
                .dataStatus(this.dataStatus)
                .optName(this.optName)
                .mandatoryYn(this.mandatoryYn)
                .minSelectCnt(this.minSelectCnt)
                .maxSelectCnt(this.maxSelectCnt)
                .build();
    }

}
