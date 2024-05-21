package com.trism.jesica.dto;

import com.trism.jesica.persistence.Entitiy.manna.TbMannaEventPushLog;
import lombok.Builder;
import lombok.Getter;

import java.util.List;
import java.util.Map;


@Getter
public class DataTablePushLogModel {
    private long recordsTotal;
    private long recordsFiltered;
    private long draw;
    private List<TbMannaEventPushLog> data;
    private List<Map<String, Object>> data2;

    @Builder
    public DataTablePushLogModel(long recordsTotal, long draw, List<TbMannaEventPushLog> data) {
        this.recordsTotal = recordsTotal;
        this.recordsFiltered = recordsTotal;
        this.draw = draw;
        this.data = data;
    }

}
