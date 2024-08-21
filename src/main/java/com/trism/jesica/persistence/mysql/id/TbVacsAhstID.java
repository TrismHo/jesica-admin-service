package com.trism.jesica.persistence.mysql.id;

import lombok.Data;

import java.io.Serializable;

@Data
public class TbVacsAhstID implements Serializable {
    private String orgCd;
    private String trNo;
    private String trIl;
}
