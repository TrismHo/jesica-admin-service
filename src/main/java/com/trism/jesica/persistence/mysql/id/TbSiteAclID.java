package com.trism.jesica.persistence.mysql.id;

import lombok.Data;

import java.io.Serializable;

@Data
public class TbSiteAclID implements Serializable {
    private Long staffNo;
    private Long menuNo;
}
