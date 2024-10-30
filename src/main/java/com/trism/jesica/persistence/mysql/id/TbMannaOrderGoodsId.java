package com.trism.jesica.persistence.mysql.id;

import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class TbMannaOrderGoodsId implements Serializable {
    private Long ordNo;
    private String ordGoodsType;
    private Long ordGoodsNo;
}
