package com.trism.jesica.persistence.id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TbOrderHistoryID implements Serializable {
    private Long order;
    private Integer updateScn;
}
