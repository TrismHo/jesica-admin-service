package com.trism.jesica.dto;

import com.trism.jesica.persistence.Entitiy.cust.TbCust;
import com.trism.jesica.persistence.Entitiy.system.TbSystemCode;
import lombok.Builder;
import lombok.Getter;

import java.util.List;


@Getter
public class DataTableModelNative {
    private long recordsTotal;
    private long recordsFiltered;
    private long draw;
    private List<TbCust> data;
    private List<TbSystemCode> a1;
    private List<TbSystemCode> a2;



    @Builder
    public DataTableModelNative(long recordsTotal, long draw, List<TbCust> data, List<TbSystemCode> a1, List<TbSystemCode> a2) {
        this.recordsTotal = recordsTotal;
        this.recordsFiltered = recordsTotal;
        this.draw = draw;
        this.data = data;
        this.a1 = a1;
        this.a2 = a2;
    }

}
