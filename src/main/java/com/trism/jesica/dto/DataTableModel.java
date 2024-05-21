package com.trism.jesica.dto;

import com.trism.jesica.persistence.Entitiy.manna.TbMannaOrder;
import lombok.Builder;
import lombok.Getter;

import java.util.List;
import java.util.Map;


@Getter
public class DataTableModel {
    private long recordsTotal;
    private long recordsFiltered;
    private long draw;
    private List<TbMannaOrder> data;
    private List<Map<String, Object>> data2;

    @Builder
    public DataTableModel(long recordsTotal, long draw, List<TbMannaOrder> data) {
        this.recordsTotal = recordsTotal;
        this.recordsFiltered = recordsTotal;
        this.draw = draw;
        this.data = data;
    }

}
