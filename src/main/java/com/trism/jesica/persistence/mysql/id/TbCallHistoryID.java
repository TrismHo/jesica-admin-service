package com.trism.jesica.persistence.mysql.id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TbCallHistoryID implements Serializable {
    private Long order;
    private Integer updateScn;
}
