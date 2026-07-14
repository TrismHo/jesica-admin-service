package com.trism.jesica.persistence.mysql.Repository.call;

import com.trism.jesica.dto.statistics.CallStatisticsCondition;
import com.trism.jesica.dto.statistics.CallStatisticsPeriod;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Repository
@RequiredArgsConstructor
public class TbCallStatisticsRepositoryImpl
        implements TbCallStatisticsRepository {

    private final EntityManager entityManager;

    @Override
    public List<Map<String, Object>> getCallStatistics(
            CallStatisticsCondition condition
    ) {
        condition.validate();

        switch (condition.getPeriod()) {
            case HOUR:
                return getHourlyStatistics(condition);

            case WEEK:
                return getPeriodStatistics(
                        condition,
                        CallStatisticsPeriod.WEEK
                );

            case MONTH:
                return getPeriodStatistics(
                        condition,
                        CallStatisticsPeriod.MONTH
                );

            case DAY:
            default:
                return getPeriodStatistics(
                        condition,
                        CallStatisticsPeriod.DAY
                );
        }
    }

    /**
     * 일별, 주별, 월별 통계
     */
    private List<Map<String, Object>> getPeriodStatistics(
            CallStatisticsCondition condition,
            CallStatisticsPeriod period
    ) {
        String periodExpression =
                getPeriodExpression(period);

        StringBuilder sql = new StringBuilder();

        sql.append("SELECT ");
        sql.append("    stat.period_key, ");
        sql.append("    stat.day_date, ");
        sql.append("    stat.week_str, ");
        sql.append("    stat.dw, ");
        sql.append("    stat.total_call, ");
        sql.append("    stat.success_call, ");
        sql.append("    stat.cancel_call, ");
        sql.append("    stat.cancel_per, ");
        sql.append("    stat.order_amt, ");
        sql.append("    stat.discount_amt, ");
        sql.append("    stat.total_amt, ");
        sql.append("    CASE ");
        sql.append("        WHEN stat.before_call IS NULL ");
        sql.append("          OR stat.before_call = 0 ");
        sql.append("        THEN 0 ");
        sql.append("        ELSE ROUND(");
        sql.append("            (stat.success_call - stat.before_call) ");
        sql.append("            / stat.before_call * 100, ");
        sql.append("            1");
        sql.append("        ) ");
        sql.append("    END AS before_per ");
        sql.append("FROM ( ");

        sql.append("    SELECT ");
        sql.append("        base.period_key, ");
        sql.append("        base.day_date, ");
        sql.append("        base.week_str, ");
        sql.append("        base.dw, ");
        sql.append("        base.total_call, ");
        sql.append("        base.success_call, ");
        sql.append("        base.cancel_call, ");
        sql.append("        CASE ");
        sql.append("            WHEN base.total_call = 0 THEN 0 ");
        sql.append("            ELSE ROUND(");
        sql.append("                base.cancel_call ");
        sql.append("                / base.total_call * 100, ");
        sql.append("                1");
        sql.append("            ) ");
        sql.append("        END AS cancel_per, ");
        sql.append("        base.order_amt, ");
        sql.append("        base.discount_amt, ");
        sql.append("        base.total_amt, ");
        sql.append("        LAG(base.success_call) OVER (");
        sql.append("            ORDER BY base.period_key");
        sql.append("        ) AS before_call ");
        sql.append("    FROM ( ");

        sql.append("        SELECT ");
        sql.append("            ");
        sql.append(periodExpression);
        sql.append(" AS period_key, ");

        appendDisplayColumns(
                sql,
                period,
                condition
        );

        sql.append("            COUNT(*) AS total_call, ");

        sql.append("            SUM(");
        sql.append("                CASE ");
        sql.append("                    WHEN order_status_code = 40 ");
        sql.append("                    THEN 1 ");
        sql.append("                    ELSE 0 ");
        sql.append("                END");
        sql.append("            ) AS success_call, ");

        sql.append("            SUM(");
        sql.append("                CASE ");
        sql.append("                    WHEN order_status_code = 41 ");
        sql.append("                    THEN 1 ");
        sql.append("                    ELSE 0 ");
        sql.append("                END");
        sql.append("            ) AS cancel_call, ");

        sql.append("            SUM(");
        sql.append("                CASE ");
        sql.append("                    WHEN order_status_code = 40 ");
        sql.append("                    THEN IFNULL(order_amt, 0) ");
        sql.append("                    ELSE 0 ");
        sql.append("                END");
        sql.append("            ) AS order_amt, ");

        sql.append("            SUM(");
        sql.append("                CASE ");
        sql.append("                    WHEN order_status_code = 40 ");
        sql.append("                    THEN IFNULL(discount_amt, 0) ");
        sql.append("                    ELSE 0 ");
        sql.append("                END");
        sql.append("            ) AS discount_amt, ");

        sql.append("            SUM(");
        sql.append("                CASE ");
        sql.append("                    WHEN order_status_code = 40 ");
        sql.append("                    THEN IFNULL(total_amt, 0) ");
        sql.append("                    ELSE 0 ");
        sql.append("                END");
        sql.append("            ) AS total_amt ");

        sql.append("        FROM tb_call_all ");
        sql.append("        WHERE ");
        sql.append("            IFNULL(finish_date, cancel_date) ");
        sql.append("            BETWEEN :startDate AND :endDate ");

        sql.append("        AND (");
        sql.append("            order_status_code = 40 ");
        sql.append("            OR (");
        sql.append("                order_status_code = 41 ");
        sql.append("                AND order_pay_status = 5");
        sql.append("            )");
        sql.append("        ) ");

        appendCommonConditions(sql, condition);

        sql.append("        GROUP BY ");
        sql.append(periodExpression);

        sql.append("    ) base ");
        sql.append(") stat ");
        sql.append("ORDER BY stat.period_key ASC");

        Query query =
                entityManager.createNativeQuery(
                        sql.toString()
                );

        bindParameters(query, condition);

        @SuppressWarnings("unchecked")
        List<Object[]> rows = query.getResultList();

        return convertPeriodRows(rows);
    }

    /**
     * 시간별 통계
     *
     * 기존 정책 유지:
     * 06시부터 21시는 개별 표시
     * 22시부터 다음 날 05시는 22로 묶음
     */
    private List<Map<String, Object>> getHourlyStatistics(
            CallStatisticsCondition condition
    ) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT ");
        sql.append("    hours.hour_group AS day_date, ");
        sql.append("    IFNULL(SUM(stat.cnt), 0) AS cnt, ");
        sql.append("    IFNULL(SUM(stat.order_amt), 0) AS order_amt, ");
        sql.append("    IFNULL(SUM(stat.discount_amt), 0) AS discount_amt, ");
        sql.append("    IFNULL(SUM(stat.total_amt), 0) AS total_amt, ");
        sql.append("    CASE ");
        sql.append("        WHEN totals.total_cnt = 0 THEN 0 ");
        sql.append("        ELSE ROUND(");
        sql.append("            IFNULL(SUM(stat.cnt), 0) ");
        sql.append("            / totals.total_cnt * 100, ");
        sql.append("            1");
        sql.append("        ) ");
        sql.append("    END AS per ");
        sql.append("FROM ( ");

        sql.append("    SELECT 6 AS hour_group ");
        sql.append("    UNION ALL SELECT 7 ");
        sql.append("    UNION ALL SELECT 8 ");
        sql.append("    UNION ALL SELECT 9 ");
        sql.append("    UNION ALL SELECT 10 ");
        sql.append("    UNION ALL SELECT 11 ");
        sql.append("    UNION ALL SELECT 12 ");
        sql.append("    UNION ALL SELECT 13 ");
        sql.append("    UNION ALL SELECT 14 ");
        sql.append("    UNION ALL SELECT 15 ");
        sql.append("    UNION ALL SELECT 16 ");
        sql.append("    UNION ALL SELECT 17 ");
        sql.append("    UNION ALL SELECT 18 ");
        sql.append("    UNION ALL SELECT 19 ");
        sql.append("    UNION ALL SELECT 20 ");
        sql.append("    UNION ALL SELECT 21 ");
        sql.append("    UNION ALL SELECT 22 ");

        sql.append(") hours ");

        sql.append("LEFT JOIN (");
        sql.append("    SELECT ");
        sql.append("        CASE ");
        sql.append("            WHEN HOUR(finish_date) >= 22 ");
        sql.append("              OR HOUR(finish_date) < 6 ");
        sql.append("            THEN 22 ");
        sql.append("            ELSE HOUR(finish_date) ");
        sql.append("        END AS hour_group, ");
        sql.append("        COUNT(*) AS cnt, ");
        sql.append("        SUM(IFNULL(order_amt, 0)) AS order_amt, ");
        sql.append("        SUM(IFNULL(discount_amt, 0)) AS discount_amt, ");
        sql.append("        SUM(IFNULL(total_amt, 0)) AS total_amt ");
        sql.append("    FROM tb_call_all ");
        sql.append("    WHERE finish_date ");
        sql.append("          BETWEEN :startDate AND :endDate ");
        sql.append("      AND order_status_code = 40 ");

        appendTimeConditions(sql, condition);

        sql.append("    GROUP BY ");
        sql.append("        CASE ");
        sql.append("            WHEN HOUR(finish_date) >= 22 ");
        sql.append("              OR HOUR(finish_date) < 6 ");
        sql.append("            THEN 22 ");
        sql.append("            ELSE HOUR(finish_date) ");
        sql.append("        END ");
        sql.append(") stat ");
        sql.append("ON hours.hour_group = stat.hour_group ");

        sql.append("CROSS JOIN (");
        sql.append("    SELECT COUNT(*) AS total_cnt ");
        sql.append("    FROM tb_call_all ");
        sql.append("    WHERE finish_date ");
        sql.append("          BETWEEN :startDate AND :endDate ");
        sql.append("      AND order_status_code = 40 ");

        appendTimeConditions(sql, condition);

        sql.append(") totals ");

        sql.append("GROUP BY ");
        sql.append("    hours.hour_group, ");
        sql.append("    totals.total_cnt ");
        sql.append("ORDER BY hours.hour_group ASC");

        Query query =
                entityManager.createNativeQuery(
                        sql.toString()
                );

        bindParameters(query, condition);

        @SuppressWarnings("unchecked")
        List<Object[]> rows = query.getResultList();

        return convertHourlyRows(rows);
    }

    private void appendDisplayColumns(
            StringBuilder sql,
            CallStatisticsPeriod period,
            CallStatisticsCondition condition
    ) {
        switch (period) {
            case WEEK:
                sql.append("            CONCAT(");
                sql.append("                DATE_FORMAT(");
                sql.append("                    DATE_ADD(");
                sql.append("                        :startDate, ");
                sql.append("                        INTERVAL ");
                sql.append("                        FLOOR(");
                sql.append("                            DATEDIFF(");
                sql.append("                                IFNULL(");
                sql.append("                                    finish_date, ");
                sql.append("                                    cancel_date");
                sql.append("                                ), ");
                sql.append("                                :startDate");
                sql.append("                            ) / 7");
                sql.append("                        ) WEEK");
                sql.append("                    ), ");
                sql.append("                    '%Y/%m/%d'");
                sql.append("                ), ");
                sql.append("                ' ~ ', ");
                sql.append("                DATE_FORMAT(");
                sql.append("                    DATE_ADD(");
                sql.append("                        DATE_ADD(");
                sql.append("                            :startDate, ");
                sql.append("                            INTERVAL ");
                sql.append("                            FLOOR(");
                sql.append("                                DATEDIFF(");
                sql.append("                                    IFNULL(");
                sql.append("                                        finish_date, ");
                sql.append("                                        cancel_date");
                sql.append("                                    ), ");
                sql.append("                                    :startDate");
                sql.append("                                ) / 7");
                sql.append("                            ) WEEK");
                sql.append("                        ), ");
                sql.append("                        INTERVAL 6 DAY");
                sql.append("                    ), ");
                sql.append("                    '%Y/%m/%d'");
                sql.append("                )");
                sql.append("            ) AS day_date, ");

                sql.append("            CONCAT(");
                sql.append("                DATE_FORMAT(");
                sql.append("                    DATE_ADD(");
                sql.append("                        :startDate, ");
                sql.append("                        INTERVAL ");
                sql.append("                        FLOOR(");
                sql.append("                            DATEDIFF(");
                sql.append("                                IFNULL(");
                sql.append("                                    finish_date, ");
                sql.append("                                    cancel_date");
                sql.append("                                ), ");
                sql.append("                                :startDate");
                sql.append("                            ) / 7");
                sql.append("                        ) WEEK");
                sql.append("                    ), ");
                sql.append("                    '%Y/%m/%d'");
                sql.append("                ), ");
                sql.append("                ' ~ ', ");
                sql.append("                DATE_FORMAT(");
                sql.append("                    DATE_ADD(");
                sql.append("                        DATE_ADD(");
                sql.append("                            :startDate, ");
                sql.append("                            INTERVAL ");
                sql.append("                            FLOOR(");
                sql.append("                                DATEDIFF(");
                sql.append("                                    IFNULL(");
                sql.append("                                        finish_date, ");
                sql.append("                                        cancel_date");
                sql.append("                                    ), ");
                sql.append("                                    :startDate");
                sql.append("                                ) / 7");
                sql.append("                            ) WEEK");
                sql.append("                        ), ");
                sql.append("                        INTERVAL 6 DAY");
                sql.append("                    ), ");
                sql.append("                    '%Y/%m/%d'");
                sql.append("                )");
                sql.append("            ) AS week_str, ");

                sql.append("            NULL AS dw, ");
                break;

            case MONTH:
                sql.append("            DATE_FORMAT(");
                sql.append("                IFNULL(finish_date, cancel_date), ");
                sql.append("                '%Y/%m'");
                sql.append("            ) AS day_date, ");

                sql.append("            NULL AS week_str, ");
                sql.append("            NULL AS dw, ");
                break;

            case DAY:
            default:
                sql.append("            DATE_FORMAT(");
                sql.append("                IFNULL(finish_date, cancel_date), ");
                sql.append("                '%Y/%m/%d'");
                sql.append("            ) AS day_date, ");

                sql.append("            NULL AS week_str, ");

                sql.append("            DAYOFWEEK(");
                sql.append("                IFNULL(finish_date, cancel_date)");
                sql.append("            ) AS dw, ");
                break;
        }
    }

    private String getPeriodExpression(
            CallStatisticsPeriod period
    ) {
        switch (period) {
            case WEEK:
                return "FLOOR(" +
                        "DATEDIFF(" +
                        "IFNULL(finish_date, cancel_date), " +
                        ":startDate" +
                        ") / 7" +
                        ")";

            case MONTH:
                return "DATE_FORMAT(" +
                        "IFNULL(finish_date, cancel_date), " +
                        "'%Y-%m'" +
                        ")";

            case DAY:
            default:
                return "DATE(" +
                        "IFNULL(finish_date, cancel_date)" +
                        ")";
        }
    }

    private void appendCommonConditions(
            StringBuilder sql,
            CallStatisticsCondition condition
    ) {
        if (condition.hasOrderType()) {
            sql.append(
                    " AND order_type_code = :orderTypeCode "
            );
        } else {
            sql.append(
                    " AND order_type_code IN (20, 21) "
            );
        }

        if (condition.hasDayOfWeek()) {
            sql.append(
                    " AND DAYOFWEEK(" +
                            "IFNULL(finish_date, cancel_date)" +
                            ") = :dayOfWeek "
            );
        }

        if (condition.hasStoreNo()) {
            sql.append(
                    " AND rental_store_no = :storeNo "
            );
        }
    }

    private void appendTimeConditions(
            StringBuilder sql,
            CallStatisticsCondition condition
    ) {
        if (condition.hasOrderType()) {
            sql.append(
                    " AND order_type_code = :orderTypeCode "
            );
        } else {
            sql.append(
                    " AND order_type_code IN (20, 21) "
            );
        }

        if (condition.hasDayOfWeek()) {
            sql.append(
                    " AND DAYOFWEEK(finish_date) = :dayOfWeek "
            );
        }

        if (condition.hasStoreNo()) {
            sql.append(
                    " AND rental_store_no = :storeNo "
            );
        }
    }

    private void bindParameters(
            Query query,
            CallStatisticsCondition condition
    ) {
        query.setParameter(
                "startDate",
                Timestamp.valueOf(condition.getStartDate())
        );

        query.setParameter(
                "endDate",
                Timestamp.valueOf(condition.getEndDate())
        );

        if (condition.hasOrderType()) {
            query.setParameter(
                    "orderTypeCode",
                    condition.getOrderTypeCode()
            );
        }

        if (condition.hasDayOfWeek()) {
            query.setParameter(
                    "dayOfWeek",
                    condition.getDayOfWeek()
            );
        }

        if (condition.hasStoreNo()) {
            query.setParameter(
                    "storeNo",
                    condition.getStoreNo()
            );
        }
    }

    private List<Map<String, Object>> convertPeriodRows(
            List<Object[]> rows
    ) {
        List<Map<String, Object>> result =
                new ArrayList<>();

        for (Object[] row : rows) {
            Map<String, Object> item =
                    new LinkedHashMap<>();

            item.put("dayDate", toStringValue(row[1]));
            item.put("weekStr", toStringValue(row[2]));
            item.put("dw", toInteger(row[3]));

            item.put("totalCall", toLong(row[4]));
            item.put("successCall", toLong(row[5]));
            item.put("cancelCall", toLong(row[6]));

            item.put("cancelPer", toDecimal(row[7]));
            item.put("orderAmt", toDecimal(row[8]));
            item.put("discountAmt", toDecimal(row[9]));
            item.put("totalAmt", toDecimal(row[10]));
            item.put("beforePer", toDecimal(row[11]));

            result.add(item);
        }

        return result;
    }

    private List<Map<String, Object>> convertHourlyRows(
            List<Object[]> rows
    ) {
        List<Map<String, Object>> result =
                new ArrayList<>();

        for (Object[] row : rows) {
            Map<String, Object> item =
                    new LinkedHashMap<>();

            item.put("dayDate", toInteger(row[0]));
            item.put("cnt", toLong(row[1]));
            item.put("orderAmt", toDecimal(row[2]));
            item.put("discountAmt", toDecimal(row[3]));
            item.put("totalAmt", toDecimal(row[4]));
            item.put("per", toDecimal(row[5]));

            result.add(item);
        }

        return result;
    }

    private String toStringValue(Object value) {
        return value == null
                ? null
                : String.valueOf(value);
    }

    private Integer toInteger(Object value) {
        if (value == null) {
            return null;
        }

        if (value instanceof Number) {
            return ((Number) value).intValue();
        }

        return Integer.parseInt(value.toString());
    }

    private Long toLong(Object value) {
        if (value == null) {
            return 0L;
        }

        if (value instanceof BigInteger) {
            return ((BigInteger) value).longValue();
        }

        if (value instanceof Number) {
            return ((Number) value).longValue();
        }

        return Long.parseLong(value.toString());
    }

    private BigDecimal toDecimal(Object value) {
        if (value == null) {
            return BigDecimal.ZERO;
        }

        if (value instanceof BigDecimal) {
            return (BigDecimal) value;
        }

        if (value instanceof Number) {
            return new BigDecimal(value.toString());
        }

        return new BigDecimal(value.toString());
    }
}
