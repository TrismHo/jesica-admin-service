package com.trism.jesica.persistence.mysql.Repository.call;

import com.trism.jesica.dto.statistics.CallStatisticsCondition;

import java.util.List;
import java.util.Map;

public interface TbCallStatisticsRepository {

    /**
     * 콜 주문 통합 통계 조회
     *
     * period:
     * HOUR  시간별
     * DAY   일별
     * WEEK  주별
     * MONTH 월별
     */
    List<Map<String, Object>> getCallStatistics(
            CallStatisticsCondition condition
    );
}
