package com.trism.jesica.persistence.mysql.id;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
public class TbStoreCategoryID implements Serializable {
    private Long store;
    private Long storeCatNo;
}
