package com.trism.jesica.persistence.id;

import lombok.Data;

import java.io.Serializable;

@Data
public class TbCustAddrID implements Serializable {
    private Long custAddrNo;
    private Long cust;
}
