package com.trism.jesica.persistence.id;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
public class TbOrderGoodsOptionID implements Serializable {
    private Long orderGoodsNo;
    private Long storeOption;
    private Integer optItemNo;

}
