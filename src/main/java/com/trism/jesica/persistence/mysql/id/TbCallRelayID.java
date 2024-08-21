package com.trism.jesica.persistence.mysql.id;

import lombok.Data;

import java.io.Serializable;

@Data
public class TbCallRelayID implements Serializable {
    private Long orderNo;
    private Long relayStep;
}
