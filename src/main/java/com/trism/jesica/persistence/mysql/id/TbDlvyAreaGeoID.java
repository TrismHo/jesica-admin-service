package com.trism.jesica.persistence.mysql.id;

import lombok.Data;

import java.io.Serializable;

@Data
public class TbDlvyAreaGeoID implements Serializable {
    private Long areaNo;
    private Integer geoIdx;
}
