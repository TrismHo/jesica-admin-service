package com.trism.jesica.dto.statistics;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum CallStatisticsPeriod {

    HOUR("hour"),
    DAY("day"),
    WEEK("week"),
    MONTH("month");

    private final String value;

    public static CallStatisticsPeriod from(String value) {
        if (value == null || value.trim().isEmpty()) {
            return DAY;
        }

        for (CallStatisticsPeriod period : values()) {
            if (period.value.equalsIgnoreCase(value.trim())) {
                return period;
            }
        }

        throw new IllegalArgumentException(
                "지원하지 않는 통계 구분입니다: " + value
        );
    }
}
