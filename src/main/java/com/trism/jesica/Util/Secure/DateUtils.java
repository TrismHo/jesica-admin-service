package com.trism.jesica.Util.Secure;

import org.apache.commons.lang3.StringUtils;
import org.springframework.util.ObjectUtils;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.Locale;

public class DateUtils {
    public static final String PATTERN_YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss";

    public static final String PATTERN_YYYY_MM_DD = "yyyy-MM-dd";

    private static final String P_YYYYMMDDHHMMSS = "yyyyMMddHHmmss";
    private static final String P_YYYYMMDDHHMM = "yyyyMMddHHmm";
    private static final String P_YYYYMMDD = "yyyyMMdd";


    public static final String PATTERN_YYYYMMDD2 = "yyyyMMdd";

    private static final String DAY = "D";
    private static final String WEEK = "W";
    private static final String EVERYDAY = "E";

    /**
     * 과거로부터 현재까지 몇 주, 몇 년 등을 계산
     * @param before
     * @param unit
     * @return
     */
    public static Long getNowChronoUnit(LocalDate before, ChronoUnit unit) {
        return unit.between(before, LocalDate.now());
    }

    public static LocalDateTime convertLocalDateTimeByTime(long time) {
        return Instant.ofEpochMilli(time).atZone(ZoneId.systemDefault()).toLocalDateTime();
    }
    public static LocalDate convertLocalDateByTime(long time) {
        return Instant.ofEpochMilli(time).atZone(ZoneId.systemDefault()).toLocalDate();
    }
    /**
     * 과거로부터 현재까지 몇 주, 몇 년 등을 계산
     * @param before
     * @param unit
     * @return
     */
    public static Long getNowChronoUnit(LocalDateTime before, ChronoUnit unit) {
        return unit.between(before, LocalDate.now());
    }
    /**
     *
     * @param yyyymmdd
     * @return
     */
    public static LocalDate parseDate(final String yyyymmdd) {
        return LocalDate.parse(yyyymmdd, DateTimeFormatter.BASIC_ISO_DATE);
    }

    public static LocalDateTime parseDateTimeByMinTime(final String yyyymmdd) {
        return parseDate(yyyymmdd).atTime(LocalTime.MIN);
    }

    public static LocalDateTime parseDateTimeByMaxTime(final String yyyymmdd) {
        return parseDate(yyyymmdd).atTime(LocalTime.MAX);
    }
    public static String nowDateByStr_YYYMMDD() {
        return LocalDate.now().format(DateTimeFormatter.BASIC_ISO_DATE);
    }


    public static Date parseDateTime(final LocalDate date, LocalTime time) {
        return Date.from(date.atTime(time).atZone(ZoneId.systemDefault()).toInstant());
    }

    public static Date parseDate(final LocalDateTime src) {
        return Date.from(src.atZone(ZoneId.systemDefault()).toInstant());
    }


    private static Date parseDate(final String src, String pattern) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        return format.parse(src);
    }
    public static Date parseDateYYYYMMDD(final String src) throws ParseException {
        return parseDate(src, PATTERN_YYYYMMDD2);
    }
    public static Date parseDateYYYY_MM_DD(final String src) throws ParseException {
        return parseDate(src, PATTERN_YYYY_MM_DD);
    }

    public static String parseStringDateTime(LocalDateTime src) {
        return src.format(DateTimeFormatter.ofPattern(DateUtils.PATTERN_YYYY_MM_DD_HH_MM_SS));
    }

    public static LocalDateTime parseLocalDateTime(final String date, String time) {
        LocalDate appointDate = parseDate(date);
        LocalTime appointTime = parseLocalTimeByAHHMM(time);
        return appointDate.atTime(appointTime);
    }


    public static LocalDateTime parseLocalDateTime(final LocalDate date, LocalTime time) {
        return date.atTime(time);
    }
    /**
     * :
     * : yyyyMMddHHmmss
     * @param src
     * @param pattern
     * @return
     */
    public static LocalDateTime parseDateTime(String src, String pattern) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
        return LocalDateTime.parse(src, formatter);
    }

    public static LocalDateTime parseDateTime_yyyyMMddHHmm(String src) {
        return parseDateTime(src, P_YYYYMMDDHHMM);
    }

    public static LocalDateTime parseDateTime_YYYYMMDDHHMMSS(String src) {
        if (StringUtils.isBlank(src)) {
            return null;
        }
        return parseDateTime(src, P_YYYYMMDDHHMMSS);
    }

    public static LocalDateTime parseDateTimeMax(String src) {
        return parseDate(src).atTime(LocalTime.MAX);
    }
    public static LocalDateTime parseDateTimeMin(String src) {
        return parseDate(src).atTime(LocalTime.MIN);
    }
    /**
     * yyyymmdd
     * hhss
     * @param pattern
     * @return
     */
    public static String nowDateToString(String pattern) {
        return LocalDateTime.now().format(DateTimeFormatter.ofPattern(pattern));

    }

    public static LocalDateTime nowLocalDateTime(String pattern) {
        String time = DateTimeFormatter.ofPattern(pattern).format(LocalDateTime.now());
        return parseDateTime(time, pattern);
    }

    /**
     * default yyyyMMddHHmmss
     * @return
     */
    public static LocalDateTime nowLocalDateTime() {
        String time = DateTimeFormatter.ofPattern(P_YYYYMMDDHHMMSS).format(LocalDateTime.now());
        return parseDateTime(time, P_YYYYMMDDHHMMSS);
    }


    /**
     * default yyyyMMddHHmmss
     * @return
     */
    public static String nowLocalDateTimeToStr() {
        return DateTimeFormatter.ofPattern(P_YYYYMMDDHHMMSS).format(LocalDateTime.now());
    }

    /**
     * default yyyyMMddHHmmss
     * @return
     */
    public static String parseLocalDateTimeToStr(LocalDateTime src) {
        return DateTimeFormatter.ofPattern(P_YYYYMMDDHHMMSS).format(src);
    }
    /**
     * now Date
     * @return
     */
    public static Date nowDate() {
        return Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant());

    }

    /**
     * now Date
     * @return
     */
    public static Date parseLocalDate(LocalDate src) {
        return Date.from(src.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
    }

    /**
     * default yyyyMMddHHmmss
     * @return
     */
    public static LocalDateTime nowLocalDateTime_yyyyMMddHHmm() {
        String time = DateTimeFormatter.ofPattern(P_YYYYMMDDHHMM).format(LocalDateTime.now());
        return parseDateTime(time, P_YYYYMMDDHHMM);
    }

    /**
     * default yyyyMMddHHmmss
     * @return
     */
    public static String nowDateTimeStr_yyyyMMddHHmm() {
        return DateTimeFormatter.ofPattern(P_YYYYMMDDHHMM).format(LocalDateTime.now());
    }

    public static String nowDateByStr_YYYYMMDD() {
//        return LocalDateTime.now().format(DateTimeFormatter.ISO_DATE_TIME);
        return LocalDate.now().format(DateTimeFormatter.BASIC_ISO_DATE);
    }

    public static String getDateTimeByStr_YYYMMDD(LocalDateTime src) {
        return src.format(DateTimeFormatter.BASIC_ISO_DATE);
    }

    /**
     * 2011-12-03T10:15:30
     * @param src
     * @return
     */
    public static String getDateTimeByStr_ISO_DATE_TIME(LocalDateTime src) {
        if (ObjectUtils.isEmpty(src)) {
            return null;
        }
        return src.format(DateTimeFormatter.ISO_DATE_TIME);
    }

    public static String getDateByStr_YYYMMDD(Date src) {
        if (ObjectUtils.isEmpty(src)) {
            return null;
        }

        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
        return format.format(src);
    }

    public static String getDateByStr_YYYMMDD(LocalDate src) {
        if (ObjectUtils.isEmpty(src)) {
            return null;
        }
        return src.format(DateTimeFormatter.BASIC_ISO_DATE);
    }
    /**
     *
     * @param minute 분
     * @return
     */
    public static LocalDateTime nowDateByPlusMinute(long minute) {
        if (ObjectUtils.isEmpty(minute)) {
            return null;
        }
        return LocalDateTime.now().plusMinutes(minute);

    }

    public static Long convertLocalDateTimeToTime(LocalDateTime src) {
        return src.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
    }

    public static LocalDate convertDateToLocalDate(Date source) {
        return source == null ? null : Instant.ofEpochMilli(source.getTime()).atZone(ZoneId.systemDefault()).toLocalDate();
    }

    public static LocalDateTime convertDateToLocalDateTime(Date source) {
        return source == null ? null : Instant.ofEpochMilli(source.getTime()).atZone(ZoneId.systemDefault()).toLocalDateTime();
    }


    public static String getNowDayOfWeek_yyyymmdd(DayOfWeek dayOfWeek) {
        if (ObjectUtils.isEmpty(dayOfWeek)) {
            return null;
        }
        return getDateByStr_YYYMMDD(getNowDayOfWeek(dayOfWeek));
    }

    public static LocalDate getNowDayOfWeek(DayOfWeek dayOfWeek) {
        if (ObjectUtils.isEmpty(dayOfWeek)) {
            return null;
        }
        return getDayOfWeek(LocalDate.now(), dayOfWeek);
    }

    public static String getDayOfWeek_yyyymmdd(LocalDate src, DayOfWeek dayOfWeek) {
        if (ObjectUtils.isEmpty(src) || ObjectUtils.isEmpty(dayOfWeek)) {
            return null;
        }
        return getDateByStr_YYYMMDD(getDayOfWeek(src, dayOfWeek));
    }

    public static LocalDate getDayOfWeek(LocalDate src, DayOfWeek dayOfWeek) {
        if (ObjectUtils.isEmpty(src) || ObjectUtils.isEmpty(dayOfWeek)) {
            return null;
        }
        return src.with(dayOfWeek);
    }

    public static LocalTime parseLocalTimeByAHHMM(String src) {
        LocalTime localTime = null;
        try {
            localTime = LocalTime.parse(src, DateTimeFormatter.ofPattern("a hh:mm", Locale.US));
        } catch (Exception e) {
            localTime = LocalTime.parse(src, DateTimeFormatter.ofPattern("HH:mm", Locale.US));
        }
        return localTime;
    }

    public static LocalTime parseLocalTimeByHHMM(String src) {
        return LocalTime.parse(src, DateTimeFormatter.ofPattern("HHmm", Locale.US));
    }


    public static LocalTime parseLocalTime(String src, String pattern) {
        return LocalTime.parse(src, DateTimeFormatter.ofPattern(pattern, Locale.US));
    }

    public static String parseLocalTime(LocalTime time) {
        return time.format(DateTimeFormatter.ofPattern("HHmm"));
    }

    public static String parseLocalTime(LocalTime time, String pattern) {
        return time.format(DateTimeFormatter.ofPattern(pattern));
    }

    /**
     *
     * @param src- date time
     * @param date- D: day, W: week
     * @param count- plus count number
     * @return localDateTime
     */
    public static LocalDateTime getDayOrWeek(LocalDateTime src, String date, Long count) {
        LocalDateTime resultDateTime = src;

        if (date.equals(DAY)) {
            resultDateTime = src.plusDays(count);
        } else if (date.equals(WEEK)) {
            resultDateTime = src.plusWeeks(count);
        } else if (date.equals(EVERYDAY)) {
            resultDateTime = src.plusDays(1L);
        }
        return resultDateTime;
    }

    public static boolean isEqualDate(LocalDate srcDate, DayOfWeek dayOfWeek) {
        return srcDate.getDayOfWeek() == dayOfWeek;
    }


    public static DayOfWeek getDayOfWeek(LocalDate srcDate) {
        return srcDate.getDayOfWeek();
    }

    /**
     * 주말여부
     * @param src date
     * @return boolean
     */
    public static boolean isWeekend(LocalDate src) {
        return isEqualDate(src, DayOfWeek.SATURDAY) || isEqualDate(src, DayOfWeek.SUNDAY);
    }



    /**
     * format : yyyy_mm_dd_hh_mm_ss
     * @return
     */
    public static String genCurrentDate() {
        LocalDateTime dateTime = LocalDateTime.now();
        StringBuffer sb = new StringBuffer();
        sb.append(dateTime.getYear());
        sb.append("_");
        sb.append(new DecimalFormat("00").format(dateTime.getMonthValue()));
        sb.append("_");
        sb.append(new DecimalFormat("00").format(dateTime.getDayOfMonth()));
        sb.append("_");
        sb.append(new DecimalFormat("00").format(dateTime.getHour()));
        sb.append("_");
        sb.append(new DecimalFormat("00").format(dateTime.getMinute()));
        sb.append("_");
        sb.append(new DecimalFormat("00").format(dateTime.getSecond()));
        return sb.toString();
    }

    /**
     * 두 날짜 비교
     * @param startDate : 시작날짜
     * @param endDate : 종료 날짜
     * @return
     */
    public static long daysBetweenByDate(LocalDate startDate, LocalDate endDate) {
        return ChronoUnit.DAYS.between(startDate, endDate);
    }
}
