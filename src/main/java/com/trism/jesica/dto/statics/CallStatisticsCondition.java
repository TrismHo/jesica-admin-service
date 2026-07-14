package com.trism.jesica.dto.statistics;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CallStatisticsCondition {

    /**
     * 조회 시작일시
     */
    private LocalDateTime startDate;

    /**
     * 조회 종료일시
     */
    private LocalDateTime endDate;

    /**
     * HOUR, DAY, WEEK, MONTH
     */
    @Builder.Default
    private com.trism.jesica.dto.statistics.CallStatisticsPeriod period = com.trism.jesica.dto.statistics.CallStatisticsPeriod.DAY;

    /**
     * 주문 유형
     * 20: 인수대행
     * 21: 반납대행
     * null: 전체
     */
    private Integer orderTypeCode;

    /**
     * MySQL DAYOFWEEK 값
     * 1: 일요일
     * 2: 월요일
     * ...
     * 7: 토요일
     * null: 전체
     */
    private Integer dayOfWeek;

    /**
     * 렌터카 매장 번호
     * null 또는 빈 값: 전체
     */
    private String storeNo;

    public void validate() {
        if (startDate == null) {
            throw new IllegalArgumentException(
                    "조회 시작일이 없습니다."
            );
        }

        if (endDate == null) {
            throw new IllegalArgumentException(
                    "조회 종료일이 없습니다."
            );
        }

        if (startDate.isAfter(endDate)) {
            throw new IllegalArgumentException(
                    "조회 시작일은 종료일보다 늦을 수 없습니다."
            );
        }

        if (
                orderTypeCode != null &&
                        orderTypeCode != 20 &&
                        orderTypeCode != 21
        ) {
            throw new IllegalArgumentException(
                    "주문 유형은 20 또는 21만 가능합니다."
            );
        }

        if (
                dayOfWeek != null &&
                        (dayOfWeek < 1 || dayOfWeek > 7)
        ) {
            throw new IllegalArgumentException(
                    "요일 값은 1부터 7까지 가능합니다."
            );
        }

        if (period == null) {
            period = com.trism.jesica.dto.statistics.CallStatisticsPeriod.DAY;
        }

        storeNo = StringUtils.hasText(storeNo)
                ? storeNo.trim()
                : null;
    }

    public boolean hasOrderType() {
        return orderTypeCode != null;
    }

    public boolean hasDayOfWeek() {
        return dayOfWeek != null;
    }

    public boolean hasStoreNo() {
        return StringUtils.hasText(storeNo);
    }
}
