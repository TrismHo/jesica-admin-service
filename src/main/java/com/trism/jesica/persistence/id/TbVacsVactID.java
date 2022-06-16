package com.trism.jesica.persistence.id;

import lombok.Data;

import java.io.Serializable;

@Data
public class TbVacsVactID implements Serializable {
    private String bankCd;
    private String acctNo;
}
