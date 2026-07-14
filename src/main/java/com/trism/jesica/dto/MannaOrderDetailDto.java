package com.trism.jesica.dto;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaLogistics;
import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaOrder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MannaOrderDetailDto {
    private TbMannaOrder order;
    private TbMannaLogistics logistics;
}
