package com.trism.jesica.persistence.id;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
public class TbCustDeviceID implements Serializable {
    private String deviceId;
    private Long cust;
}
