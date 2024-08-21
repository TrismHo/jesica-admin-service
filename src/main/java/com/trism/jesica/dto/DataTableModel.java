package com.trism.jesica.dto;

import lombok.Builder;
import lombok.Getter;

import java.util.List;


@Getter
public class DataTableModel {
    private long recordsTotal;
    private long recordsFiltered;
    private long draw;
    private List<?> data;

    @Builder
    public DataTableModel(long recordsTotal, long draw, List<?> data) {
        this.recordsTotal = recordsTotal;
        this.recordsFiltered = recordsTotal;
        this.draw = draw;
        this.data = data;
    }
}


