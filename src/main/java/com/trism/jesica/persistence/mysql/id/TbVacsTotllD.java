package com.trism.jesica.persistence.mysql.id;

import lombok.Data;

import java.io.Serializable;

@Data
public class TbVacsTotllD implements Serializable {
    private String orgCd;
    private String trIl;
    private String bankCd;
}
