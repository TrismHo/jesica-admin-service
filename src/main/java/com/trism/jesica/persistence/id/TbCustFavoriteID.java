package com.trism.jesica.persistence.id;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
public class TbCustFavoriteID implements Serializable {
    private Long cust;
    private Long store;
}
