package com.trism.jesica.persistence.id;

import lombok.Data;

import java.io.Serializable;

@Data
public class TbSystemCodeID implements Serializable {
    private String sysType;
    private String sysCode;
}
