package com.trism.jesica.dto;

import lombok.Builder;
import lombok.Getter;

import java.util.List;


@Getter
public class DataTableModel2 {
    private long recordsTotal;
    private long recordsFiltered;
    private long draw;
    private List<?> data;
    private List<?> a1;
    private List<?> a2;



    @Builder
    public DataTableModel2(long recordsTotal, long draw, List<?> data, List<?> a1, List<?> a2) {
        this.recordsTotal = recordsTotal;
        this.recordsFiltered = recordsTotal;
        this.draw = draw;
        this.data = data;
        this.a1 = a1;
        this.a2 = a2;
    }


}
