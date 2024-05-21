package com.trism.jesica.dto;

import com.trism.jesica.persistence.Entitiy.manna.TbMannaEventPush;
import lombok.Builder;
import lombok.Getter;

import java.util.List;
import java.util.Map;


@Getter
public class DataTablePushModel {
    private long recordsTotal;
    private long recordsFiltered;
    private long draw;
    private List<TbMannaEventPush> data;
    private List<Map<String, Object>> data2;

    @Builder
    public DataTablePushModel(long recordsTotal, long draw, List<TbMannaEventPush> data) {
        this.recordsTotal = recordsTotal;
        this.recordsFiltered = recordsTotal;
        this.draw = draw;
        this.data = data;
    }

}
