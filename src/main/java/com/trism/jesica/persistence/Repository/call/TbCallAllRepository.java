package com.trism.jesica.persistence.Repository.call;

import com.trism.jesica.persistence.Entitiy.call.TbCallAll;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

public interface TbCallAllRepository extends JpaRepository<TbCallAll, Long>, JpaSpecificationExecutor<TbCallAll> {

//OS = 41 취소
//OS = 40 완료
//GENDER = N 모름 M 남자 F 여자
//order_pay_status 1로 바꿔야함 지금은 테스트


    /*@Query(value = "select count(*) as cnt, DATE_FORMAT(finish_date, '%Y/%m/%d') as dayDate" +
            " from tb_call_all " +
            "where order_type_code = 20 " +
            "and order_pay_status = 4 " +
            "and order_status_code = 40 "+
            "and finish_date BETWEEN DATE_ADD(NOW(),INTERVAL -1 MONTH ) AND NOW() " +
            *//*"and DATE_FORMAT(finish_date, '%m') = DATE_FORMAT( NOW(), '%m' )" +*//*
            "group by dayDate " +
            "order by finish_date "+
            "", nativeQuery = true)
    List<Map<String,Object>> getCallAllListType2040();*/

//    /**
//     * june
//     * @param searchDate
//     * @return + 인수대행완료
//     */
//    @Query(value = "select count(*) as cnt, " +
//                          "DATE_FORMAT(finish_date, '%m-%d') as dayDate " +
//            "from tb_call_all " +
//            "where order_type_code = 20 " +
//            //"and order_pay_status = 1 " +
//            "and order_status_code = 40 "+
//            "and finish_date BETWEEN DATE_ADD(NOW(),INTERVAL -1 MONTH ) AND NOW() "+
//            "group by dayDate " +
//            "order by finish_date asc"+
//            "", nativeQuery = true)
//    List<Map<String,Object>> getCallAllListType2040(@Param("searchDate") String searchDate);
    /**
     * june
     * @param searchDate
     * @return + 인수대행완료
     */
    @Query(value = "select b.yyyymmdd as dayDate, IFNULL(a.cnt, 0) as cnt , b.n " +
            "from " +
            "( " +
            "select date_format(finish_date, '%m-%d')as yyyymmdd, count(*) cnt " +
            "from tb_call_all  " +
            "where finish_date BETWEEN DATE_ADD(NOW(),INTERVAL -1 MONTH ) AND NOW() " +
            "and order_type_code = 20 " +
            "and order_status_code = 40 " +
            "group by yyyymmdd " +
            ") a  " +
            "right join  " +
            "( " +
            "select  @N\\:=@N -1 AS n ,  " +
            "date_format( date_add( now() , interval @N  day),'%m-%d') as yyyymmdd  " +
            "from (tb_call_all), (select @N\\:=0 from dual ) a  " +
            "limit 30 " +
            ") b on a.yyyymmdd = b.yyyymmdd " +
            "order by b.n asc"+
            "", nativeQuery = true)
    List<Map<String,Object>> getCallAllListType2040(@Param("searchDate") String searchDate);

    /*@Query(value = "select count(*) as cnt, DATE_FORMAT(finish_date, '%Y/%m/%d') as dayDate" +
            " from tb_call_all " +
            "where order_type_code = 20 " +
            "and order_pay_status = 4 " +
            "and order_status_code = 41 "+
            "and finish_date BETWEEN DATE_ADD(NOW(),INTERVAL -1 MONTH ) AND NOW() "+
            *//*"and DATE_FORMAT(finish_date, '%m') = DATE_FORMAT( NOW(), '%m' )" +*//*
            "group by dayDate " +
            "order by finish_date "+
            "", nativeQuery = true)
    List<Map<String,Object>> getCallAllListType2041();*/

    /**
     * june + 인수대행 취소
     * @param searchDate
     * @return
     */
    @Query(value = "select count(*) as cnt, " +
                          "DATE_FORMAT(cancel_date, '%m-%d') as dayDate " +
            "from tb_call_all " +
            "where order_type_code = 20 " +
            //"and (order_pay_status = 4 or order_pay_status = 5) " +
            "and order_status_code = 41 "+
            "and finish_date BETWEEN DATE_ADD(NOW(),INTERVAL -1 MONTH ) AND NOW() "+
            "group by dayDate " +
            "order by cancel_date asc"+
            "", nativeQuery = true)
    List<Map<String,Object>> getCallAllListType2041(@Param("searchDate") String searchDate);


    /**
     *
     * @param searchDate
     * @return + 신규고객 변화추이
     */
  /*  @Query(value = "select count(*) as cnt, " +
            "DATE_FORMAT(insert_date, '%m-%d') as dayDate " +
            "from tb_cust " +
            "where data_status = 1 " +
            "and is_member = 1 "+
            "and insert_date BETWEEN DATE_ADD(NOW(),INTERVAL -1 MONTH ) AND NOW() "+
            "group by dayDate " +
            "order by dayDate asc"+
            "", nativeQuery = true)
    List<Map<String,Object>> getUserCount(@Param("searchDate") String searchDate);*/

    /**
     *
     * @param searchDate
     * @return + 신규고객 변화추이
     */
    @Query(value = "select b.yyyymmdd as dayDate, IFNULL(a.cnt, 0) as cnt , b.n " +
            "from " +
            "( " +
            "select date_format(insert_date, '%m-%d')as yyyymmdd, count(*) cnt " +
            "from tb_cust " +
            "where insert_date BETWEEN DATE_ADD(NOW(),INTERVAL -1 MONTH ) AND NOW() " +
            "and data_status = 1 " +
            "and is_member = 1 "+
            "group by yyyymmdd " +
            "order by yyyymmdd asc"+
            ") a  " +
            "right join  " +
            "( " +
            "select  @N\\:=@N -1 AS n ,  " +
            "date_format( date_add( now() , interval @N  day),'%m-%d') as yyyymmdd  " +
            "from (tb_cust), (select @N\\:=0 from dual ) a  " +
            "limit 30 " +
            ") b on a.yyyymmdd = b.yyyymmdd " +
            "order by b.n asc"+
            "", nativeQuery = true)
    List<Map<String,Object>> getUserCount(@Param("searchDate") String searchDate);

    /*@Query(value = "select count(*) as cnt, DATE_FORMAT(finish_date, '%Y/%m/%d') as dayDate" +
            " from tb_call_all " +
            "where order_type_code = 21 " +
            "and order_pay_status = 4 " +
            "and order_status_code = 40 "+
            "and finish_date BETWEEN DATE_ADD(NOW(),INTERVAL -1 MONTH ) AND NOW() "+
            *//*"and DATE_FORMAT(finish_date, '%m') = DATE_FORMAT( NOW(), '%m' )"+ *//*
            "group by dayDate " +
            "order by finish_date "+
            "", nativeQuery = true)
    List<Map<String,Object>> getCallAllListType2140();*/

    /**
     * june
     * @param searchDate
     * @return+ 반납대행완료
     */
//    @Query(value = "select count(*) as cnt, " +
//                          "DATE_FORMAT(finish_date, '%m-%d') as dayDate " +
//            "from tb_call_all " +
//            "where order_type_code = 21 " +
//            //"and order_pay_status = 1 " +
//            "and order_status_code = 40 "+
//            "and finish_date BETWEEN DATE_ADD(NOW(),INTERVAL -1 MONTH ) AND NOW() "+
//            "group by dayDate " +
//            "order by finish_date asc"+
//            "", nativeQuery = true)
//    List<Map<String,Object>> getCallAllListType2140(@Param("searchDate") String searchDate);

    /**
     * june
     * @param searchDate
     * @return+ 반납대행완료
     */
    @Query(value = "select b.yyyymmdd as dayDate, IFNULL(a.cnt, 0) as cnt, b.n " +
            "from " +
            "( " +
            "select date_format(finish_date, '%m-%d')as yyyymmdd, count(*) cnt " +
            "from tb_call_all  " +
            "where finish_date BETWEEN DATE_ADD(NOW(),INTERVAL -1 MONTH ) AND NOW() " +
            "and order_type_code = 21 " +
            "and order_status_code = 40 " +
            "group by yyyymmdd " +
            ") a  " +
            "right join  " +
            "( " +
            "select  @N\\:=@N -1 AS n ,  " +
            "date_format( date_add( now() , interval @N  day),'%m-%d') as yyyymmdd  " +
            "from (tb_call_all), (select @N\\:=0 from dual ) a  " +
            "limit 30 " +
            ") b on a.yyyymmdd = b.yyyymmdd " +
            "order by b.n asc"+
            "", nativeQuery = true)
    List<Map<String,Object>> getCallAllListType2140(@Param("searchDate") String searchDate);

    /*@Query(value = "select count(*) as cnt, DATE_FORMAT(finish_date, '%Y/%m/%d') as dayDate" +
            " from tb_call_all " +
            "where order_type_code = 21 " +
            "and order_pay_status = 4 " +
            "and order_status_code = 41 "+
            *//*"and DATE_FORMAT(finish_date, '%m') = DATE_FORMAT( NOW(), '%m' )" +*//*
            "and finish_date BETWEEN DATE_ADD(NOW(),INTERVAL -1 MONTH ) AND NOW() "+
            "group by dayDate " +
            "order by finish_date "+
            "", nativeQuery = true)
    List<Map<String,Object>> getCallAllListType2141();*/

    /**
     * june
     * @param searchDate
     * @return + 반납대행취소
     */
    @Query(value = "select count(*) as cnt, " +
                          "DATE_FORMAT(cancel_date, '%m-%d') as dayDate " +
            "from tb_call_all " +
            "where order_type_code = 21 " +
            //"and (order_pay_status = 4 or order_pay_status = 5) " +
            "and order_status_code = 41 " +
            "and cancel_date BETWEEN DATE_ADD(NOW(),INTERVAL -1 MONTH ) AND NOW() "+
            "group by dayDate " +
            "order by cancel_date asc" +
            "", nativeQuery = true)
    List<Map<String,Object>> getCallAllListType2141(@Param("searchDate") String searchDate);


    /**
     * @param searchDate
     * @return + 시간대별 통계
     */
    @Query(value = "select  " +
            " dayDate, " +
            " sum(cnt) as cnt, " +
            " sum(orderAmt) as orderAmt , " +
            " sum(discountAmt) as discountAmt  , " +
            " sum(totalAmt) as totalAmt , " +
            " ROUND(sum(cnt)/totalCnt*100,1) as per " +
            "from " +
            " ( " +
            " select " +
            "  case " +
            "   when b.n >= 22 then 22 " +
            "   when b.n < 6 then 22 " +
            "   else b.n " +
            "  end as dayDate, " +
            "  IFNULL(a.cnt, 0) as cnt , " +
            "  IFNULL(a.orderAmt, 0) as orderAmt, " +
            "  IFNULL(a.discountAmt, 0) as discountAmt, " +
            "  IFNULL(a.totalAmt, 0) as totalAmt, " +
            "  sum(a.cnt) over() as totalCnt " +
            " from " +
            "  ( " +
            "  select " +
            "   date_format(finish_date, '%H')as yyyymmdd, " +
            "   count(1) as cnt  , " +
            "   sum(order_amt) as orderAmt, " +
            "   sum(discount_amt) as discountAmt, " +
            "   sum(total_amt) as totalAmt " +
            "  from " +
            "   tb_call_all " +
            "   where finish_date " +
            "   BETWEEN :startDate AND :endDate " +
            "   and DAYOFWEEK(finish_date) = :day " +
            "   and order_type_code = :orderTypeCode " +
            "   and order_status_code = 40 " +
            "  group by " +
            "   yyyymmdd " +
            " ) a " +
            " right join " +
            " ( " +
            "  select " +
            "   n " +
            "  from " +
            "   tb_numbers " +
            "  where " +
            "   n between 0 and 24 " +
            " ) b on " +
            "  a.yyyymmdd = b.n " +
            " ) as c " +
            "group by " +
            " dayDate " +
            "order by " +
            " dayDate asc" +
            " ", nativeQuery = true)
    List<Map<String,Object>> getTimeList(@Param("orderTypeCode") String orderTypeCode,
                                         @Param("startDate") LocalDateTime startDate,
                                         @Param("endDate") LocalDateTime endDate,
                                         @Param("day") String day);

    /**
     * @param searchDate
     * @return + 시간대별 통계
     */
    @Query(value = "select  " +
            " dayDate, " +
            " sum(cnt) as cnt, " +
            " sum(orderAmt) as orderAmt , " +
            " sum(discountAmt) as discountAmt  , " +
            " sum(totalAmt) as totalAmt , " +
            " ROUND(sum(cnt)/totalCnt*100,1) as per " +
            "from " +
            " ( " +
            " select " +
            "  case " +
            "   when b.n >= 22 then 22 " +
            "   when b.n < 6 then 22 " +
            "   else b.n " +
            "  end as dayDate, " +
            "  IFNULL(a.cnt, 0) as cnt , " +
            "  IFNULL(a.orderAmt, 0) as orderAmt, " +
            "  IFNULL(a.discountAmt, 0) as discountAmt, " +
            "  IFNULL(a.totalAmt, 0) as totalAmt, " +
            "  sum(a.cnt) over() as totalCnt " +
            " from " +
            "  ( " +
            "  select " +
            "   date_format(finish_date, '%H')as yyyymmdd, " +
            "   count(1) as cnt  , " +
            "   sum(order_amt) as orderAmt, " +
            "   sum(discount_amt) as discountAmt, " +
            "   sum(total_amt) as totalAmt " +
            "  from " +
            "   tb_call_all " +
            "   where finish_date " +
            "   BETWEEN :startDate AND :endDate " +
            "   and order_type_code in(20 ,21) " +
            "   and order_status_code = 40 " +
            "  group by " +
            "   yyyymmdd " +
            " ) a " +
            " right join " +
            " ( " +
            "  select " +
            "   n " +
            "  from " +
            "   tb_numbers " +
            "  where " +
            "   n between 0 and 24 " +
            " ) b on " +
            "  a.yyyymmdd = b.n " +
            " ) as c " +
            "group by " +
            " dayDate " +
            "order by " +
            " dayDate asc" +
            " ", nativeQuery = true)
    List<Map<String,Object>> getTimeListAll(@Param("startDate") LocalDateTime startDate,
                                            @Param("endDate") LocalDateTime endDate);

    /**
     * @param searchDate
     * @return + 시간대별 통계
     */
    @Query(value = "select  " +
            " dayDate, " +
            " sum(cnt) as cnt, " +
            " sum(orderAmt) as orderAmt , " +
            " sum(discountAmt) as discountAmt  , " +
            " sum(totalAmt) as totalAmt , " +
            " ROUND(sum(cnt)/totalCnt*100,1) as per " +
            "from " +
            " ( " +
            " select " +
            "  case " +
            "   when b.n >= 22 then 22 " +
            "   when b.n < 6 then 22 " +
            "   else b.n " +
            "  end as dayDate, " +
            "  IFNULL(a.cnt, 0) as cnt , " +
            "  IFNULL(a.orderAmt, 0) as orderAmt, " +
            "  IFNULL(a.discountAmt, 0) as discountAmt, " +
            "  IFNULL(a.totalAmt, 0) as totalAmt, " +
            "  sum(a.cnt) over() as totalCnt " +
            " from " +
            "  ( " +
            "  select " +
            "   date_format(finish_date, '%H')as yyyymmdd, " +
            "   count(1) as cnt  , " +
            "   sum(order_amt) as orderAmt, " +
            "   sum(discount_amt) as discountAmt, " +
            "   sum(total_amt) as totalAmt " +
            "  from " +
            "   tb_call_all " +
            "   where finish_date " +
            "   BETWEEN :startDate AND :endDate " +
            "   and DAYOFWEEK(finish_date) = :day " +
            "   and order_type_code in( 20, 21) " +
            "   and order_status_code = 40 " +
            "  group by " +
            "   yyyymmdd " +
            " ) a " +
            " right join " +
            " ( " +
            "  select " +
            "   n " +
            "  from " +
            "   tb_numbers " +
            "  where " +
            "   n between 0 and 24 " +
            " ) b on " +
            "  a.yyyymmdd = b.n " +
            " ) as c " +
            "group by " +
            " dayDate " +
            "order by " +
            " dayDate asc" +
            " ", nativeQuery = true)
    List<Map<String,Object>> getTimeListDay(
                                         @Param("startDate") LocalDateTime startDate,
                                         @Param("endDate") LocalDateTime endDate,
                                         @Param("day") String day);

    /**
     * @param searchDate
     * @return + 시간대별 통계
     */
    @Query(value = "select  " +
            " dayDate, " +
            " sum(cnt) as cnt, " +
            " sum(orderAmt) as orderAmt , " +
            " sum(discountAmt) as discountAmt  , " +
            " sum(totalAmt) as totalAmt , " +
            " ROUND(sum(cnt)/totalCnt*100,1) as per " +
            "from " +
            " ( " +
            " select " +
            "  case " +
            "   when b.n >= 22 then 22 " +
            "   when b.n < 6 then 22 " +
            "   else b.n " +
            "  end as dayDate, " +
            "  IFNULL(a.cnt, 0) as cnt , " +
            "  IFNULL(a.orderAmt, 0) as orderAmt, " +
            "  IFNULL(a.discountAmt, 0) as discountAmt, " +
            "  IFNULL(a.totalAmt, 0) as totalAmt, " +
            "  sum(a.cnt) over() as totalCnt " +
            " from " +
            "  ( " +
            "  select " +
            "   date_format(finish_date, '%H')as yyyymmdd, " +
            "   count(1) as cnt  , " +
            "   sum(order_amt) as orderAmt, " +
            "   sum(discount_amt) as discountAmt, " +
            "   sum(total_amt) as totalAmt " +
            "  from " +
            "   tb_call_all " +
            "   where finish_date " +
            "   BETWEEN :startDate AND :endDate " +
            "   and order_type_code = :orderTypeCode " +
            "   and order_status_code = 40 " +
            "  group by " +
            "   yyyymmdd " +
            " ) a " +
            " right join " +
            " ( " +
            "  select " +
            "   n " +
            "  from " +
            "   tb_numbers " +
            "  where " +
            "   n between 0 and 24 " +
            " ) b on " +
            "  a.yyyymmdd = b.n " +
            " ) as c " +
            "group by " +
            " dayDate " +
            "order by " +
            " dayDate asc" +
            " ", nativeQuery = true)
    List<Map<String,Object>> getTimeListOrderType(@Param("orderTypeCode") String orderTypeCode,
            @Param("startDate") LocalDateTime startDate,
            @Param("endDate") LocalDateTime endDate);


    /**
     * @param searchDate
     * @return + 일별통계 통계
     */
    @Query(value = "SELECT    " +
            "  DATE_FORMAT(yyyymmdd, '%Y/%m/%d') as dayDate,    " +
            "  DAYOFWEEK(yyyymmdd) AS dw,    " +
            "  totalCall,    " +
            "  successCall,    " +
            "  cancelCall,    " +
            "  ROUND(cancelCall / totalCall * 100, 1) AS cancelPer,    " +
            "  orderAmt,    " +
            "  discountAmt,    " +
            "  totalAmt,    " +
            "  ROUND((successCall - beforeCall) / beforeCall * 100, 1) AS beforePer    " +
            "FROM (    " +
            "  SELECT    " +
            "    yyyymmdd, (successCall + cancelCall) AS totalCall, successCall, cancelCall, orderAmt, discountAmt, totalAmt,    " +
            "    IFNULL(LAG(successCall) OVER (ORDER BY yyyymmdd), '') AS beforeCall    " +
            "  FROM (    " +
            "    SELECT    " +
            "      date_format(IFNULL(finish_date, cancel_date), '%y-%m-%d') AS yyyymmdd,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN 1 ELSE 0 END) AS successCall,    " +
            "      SUM(CASE WHEN order_status_code = 41 THEN 1 ELSE 0 END) AS cancelCall,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN order_amt ELSE 0 END) AS orderAmt,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN discount_amt ELSE 0 END) AS discountAmt,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN total_amt ELSE 0 END) AS totalAmt    " +
            "    FROM    " +
            "      tb_call_all    " +
            "    WHERE    " +
            "      (    " +
            "        order_status_code = 40 OR    " +
            "        (order_status_code = 41 AND order_pay_status = 5)    " +
            "      )    " +
            "      and IFNULL(finish_date, cancel_date) BETWEEN :startDate AND :endDate    " +
            "      and DAYOFWEEK(IFNULL(finish_date, cancel_date)) = :day    " +
            "      and order_type_code = :orderTypeCode    " +
            "    GROUP BY yyyymmdd    " +
            "  ) dd    " +
            ") a    " +
            "ORDER BY yyyymmdd ASC;" +
            "", nativeQuery = true)
    List<Map<String,Object>> getDayList(@Param("orderTypeCode") String orderTypeCode,
                                         @Param("startDate") LocalDateTime startDate,
                                         @Param("endDate") LocalDateTime endDate,
                                         @Param("day") String day
                                         );
    /**
     * @param searchDate
     * @return + 일별통계 통계
     */
    @Query(value = "SELECT    " +
            "  DATE_FORMAT(yyyymmdd, '%Y/%m/%d') as dayDate,    " +
            "  DAYOFWEEK(yyyymmdd) AS dw,    " +
            "  totalCall,    " +
            "  successCall,    " +
            "  cancelCall,    " +
            "  ROUND(cancelCall / totalCall * 100, 1) AS cancelPer,    " +
            "  orderAmt,    " +
            "  discountAmt,    " +
            "  totalAmt,    " +
            "  ROUND((successCall - beforeCall) / beforeCall * 100, 1) AS beforePer    " +
            "FROM (    " +
            "  SELECT    " +
            "    yyyymmdd, (successCall + cancelCall) AS totalCall, successCall, cancelCall, orderAmt, discountAmt, totalAmt,    " +
            "    IFNULL(LAG(successCall) OVER (ORDER BY yyyymmdd), '') AS beforeCall    " +
            "  FROM (    " +
            "    SELECT    " +
            "      date_format(IFNULL(finish_date, cancel_date), '%y-%m-%d') AS yyyymmdd,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN 1 ELSE 0 END) AS successCall,    " +
            "      SUM(CASE WHEN order_status_code = 41 THEN 1 ELSE 0 END) AS cancelCall,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN order_amt ELSE 0 END) AS orderAmt,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN discount_amt ELSE 0 END) AS discountAmt,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN total_amt ELSE 0 END) AS totalAmt    " +
            "    FROM    " +
            "      tb_call_all    " +
            "    WHERE    " +
            "      (    " +
            "        order_status_code = 40 OR    " +
            "        (order_status_code = 41 AND order_pay_status = 5)    " +
            "      )    " +
            "      and IFNULL(finish_date, cancel_date) BETWEEN :startDate AND :endDate    " +
            "      and DAYOFWEEK(IFNULL(finish_date, cancel_date)) = :day    " +
            "      and order_type_code = :orderTypeCode    " +
            "      and rental_store_no = :storeNo    " +
            "    GROUP BY yyyymmdd    " +
            "  ) dd    " +
            ") a    " +
            "ORDER BY yyyymmdd ASC;" +
            "", nativeQuery = true)
    List<Map<String,Object>> getDayList(@Param("orderTypeCode") String orderTypeCode,
                                         @Param("startDate") LocalDateTime startDate,
                                         @Param("endDate") LocalDateTime endDate,
                                         @Param("day") String day,
                                         @Param("storeNo") String storeNo
                                         );

    /**
     * @param searchDate
     * @return + 일별통계 통계
     */
    @Query(value = "SELECT    " +
            "  DATE_FORMAT(yyyymmdd, '%Y/%m/%d') as dayDate,    " +
            "  DAYOFWEEK(yyyymmdd) AS dw,    " +
            "  totalCall,    " +
            "  successCall,    " +
            "  cancelCall,    " +
            "  ROUND(cancelCall / totalCall * 100, 1) AS cancelPer,    " +
            "  orderAmt,    " +
            "  discountAmt,    " +
            "  totalAmt,    " +
            "  ROUND((successCall - beforeCall) / beforeCall * 100, 1) AS beforePer    " +
            "FROM (    " +
            "  SELECT    " +
            "    yyyymmdd, (successCall + cancelCall) AS totalCall, successCall, cancelCall, orderAmt, discountAmt, totalAmt,    " +
            "    IFNULL(LAG(successCall) OVER (ORDER BY yyyymmdd), '') AS beforeCall    " +
            "  FROM (    " +
            "    SELECT    " +
            "      date_format(IFNULL(finish_date, cancel_date), '%y-%m-%d') AS yyyymmdd,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN 1 ELSE 0 END) AS successCall,    " +
            "      SUM(CASE WHEN order_status_code = 41 THEN 1 ELSE 0 END) AS cancelCall,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN order_amt ELSE 0 END) AS orderAmt,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN discount_amt ELSE 0 END) AS discountAmt,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN total_amt ELSE 0 END) AS totalAmt    " +
            "    FROM    " +
            "      tb_call_all    " +
            "    WHERE    " +
            "      (    " +
            "        order_status_code = 40 OR    " +
            "        (order_status_code = 41 AND order_pay_status = 5)    " +
            "      )    " +
            "      and IFNULL(finish_date, cancel_date) BETWEEN :startDate AND :endDate    " +
            "      and order_type_code in (20 ,21)    " +
            "    GROUP BY yyyymmdd    " +
            "  ) dd    " +
            ") a    " +
            "ORDER BY yyyymmdd ASC;" +
            "", nativeQuery = true)
    List<Map<String,Object>> getDayListAll(
                                        @Param("startDate") LocalDateTime startDate,
                                        @Param("endDate") LocalDateTime endDate
                                       );
    /**
     * @param searchDate
     * @return + 일별통계 통계
     */
    @Query(value = "SELECT    " +
            "  DATE_FORMAT(yyyymmdd, '%Y/%m/%d') as dayDate,    " +
            "  DAYOFWEEK(yyyymmdd) AS dw,    " +
            "  totalCall,    " +
            "  successCall,    " +
            "  cancelCall,    " +
            "  ROUND(cancelCall / totalCall * 100, 1) AS cancelPer,    " +
            "  orderAmt,    " +
            "  discountAmt,    " +
            "  totalAmt,    " +
            "  ROUND((successCall - beforeCall) / beforeCall * 100, 1) AS beforePer    " +
            "FROM (    " +
            "  SELECT    " +
            "    yyyymmdd, (successCall + cancelCall) AS totalCall, successCall, cancelCall, orderAmt, discountAmt, totalAmt,    " +
            "    IFNULL(LAG(successCall) OVER (ORDER BY yyyymmdd), '') AS beforeCall    " +
            "  FROM (    " +
            "    SELECT    " +
            "      date_format(IFNULL(finish_date, cancel_date), '%y-%m-%d') AS yyyymmdd,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN 1 ELSE 0 END) AS successCall,    " +
            "      SUM(CASE WHEN order_status_code = 41 THEN 1 ELSE 0 END) AS cancelCall,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN order_amt ELSE 0 END) AS orderAmt,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN discount_amt ELSE 0 END) AS discountAmt,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN total_amt ELSE 0 END) AS totalAmt    " +
            "    FROM    " +
            "      tb_call_all    " +
            "    WHERE    " +
            "      (    " +
            "        order_status_code = 40 OR    " +
            "        (order_status_code = 41 AND order_pay_status = 5)    " +
            "      )    " +
            "      and IFNULL(finish_date, cancel_date) BETWEEN :startDate AND :endDate    " +
            "      and order_type_code in (20 ,21)    " +
            "      and rental_store_no = :storeNo    " +
            "    GROUP BY yyyymmdd    " +
            "  ) dd    " +
            ") a    " +
            "ORDER BY yyyymmdd ASC;" +
            "", nativeQuery = true)
    List<Map<String,Object>> getDayListAll(
                                        @Param("startDate") LocalDateTime startDate,
                                        @Param("endDate") LocalDateTime endDate,
                                        @Param("storeNo") String storeNo
                                       );

    /**
     * @param searchDate
     * @return + 일별통계 통계
     */
    @Query(value = "SELECT    " +
            "  DATE_FORMAT(yyyymmdd, '%Y/%m/%d') as dayDate,    " +
            "  DAYOFWEEK(yyyymmdd) AS dw,    " +
            "  totalCall,    " +
            "  successCall,    " +
            "  cancelCall,    " +
            "  ROUND(cancelCall / totalCall * 100, 1) AS cancelPer,    " +
            "  orderAmt,    " +
            "  discountAmt,    " +
            "  totalAmt,    " +
            "  ROUND((successCall - beforeCall) / beforeCall * 100, 1) AS beforePer    " +
            "FROM (    " +
            "  SELECT    " +
            "    yyyymmdd, (successCall + cancelCall) AS totalCall, successCall, cancelCall, orderAmt, discountAmt, totalAmt,    " +
            "    IFNULL(LAG(successCall) OVER (ORDER BY yyyymmdd), '') AS beforeCall    " +
            "  FROM (    " +
            "    SELECT    " +
            "      date_format(IFNULL(finish_date, cancel_date), '%y-%m-%d') AS yyyymmdd,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN 1 ELSE 0 END) AS successCall,    " +
            "      SUM(CASE WHEN order_status_code = 41 THEN 1 ELSE 0 END) AS cancelCall,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN order_amt ELSE 0 END) AS orderAmt,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN discount_amt ELSE 0 END) AS discountAmt,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN total_amt ELSE 0 END) AS totalAmt    " +
            "    FROM    " +
            "      tb_call_all    " +
            "    WHERE    " +
            "      (    " +
            "        order_status_code = 40 OR    " +
            "        (order_status_code = 41 AND order_pay_status = 5)    " +
            "      )    " +
            "      and IFNULL(finish_date, cancel_date) BETWEEN :startDate AND :endDate    " +
            "      and order_type_code = :orderTypeCode    " +
            "    GROUP BY yyyymmdd    " +
            "  ) dd    " +
            ") a    " +
            "ORDER BY yyyymmdd ASC;" +
            "", nativeQuery = true)
    List<Map<String,Object>> getDayListOrderType(@Param("orderTypeCode") String orderTypeCode,
                                        @Param("startDate") LocalDateTime startDate,
                                        @Param("endDate") LocalDateTime endDate
                                       );
    /**
     * @param searchDate
     * @return + 일별통계 통계
     */
    @Query(value = "SELECT    " +
            "  DATE_FORMAT(yyyymmdd, '%Y/%m/%d') as dayDate,    " +
            "  DAYOFWEEK(yyyymmdd) AS dw,    " +
            "  totalCall,    " +
            "  successCall,    " +
            "  cancelCall,    " +
            "  ROUND(cancelCall / totalCall * 100, 1) AS cancelPer,    " +
            "  orderAmt,    " +
            "  discountAmt,    " +
            "  totalAmt,    " +
            "  ROUND((successCall - beforeCall) / beforeCall * 100, 1) AS beforePer    " +
            "FROM (    " +
            "  SELECT    " +
            "    yyyymmdd, (successCall + cancelCall) AS totalCall, successCall, cancelCall, orderAmt, discountAmt, totalAmt,    " +
            "    IFNULL(LAG(successCall) OVER (ORDER BY yyyymmdd), '') AS beforeCall    " +
            "  FROM (    " +
            "    SELECT    " +
            "      date_format(IFNULL(finish_date, cancel_date), '%y-%m-%d') AS yyyymmdd,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN 1 ELSE 0 END) AS successCall,    " +
            "      SUM(CASE WHEN order_status_code = 41 THEN 1 ELSE 0 END) AS cancelCall,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN order_amt ELSE 0 END) AS orderAmt,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN discount_amt ELSE 0 END) AS discountAmt,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN total_amt ELSE 0 END) AS totalAmt    " +
            "    FROM    " +
            "      tb_call_all    " +
            "    WHERE    " +
            "      (    " +
            "        order_status_code = 40 OR    " +
            "        (order_status_code = 41 AND order_pay_status = 5)    " +
            "      )    " +
            "      and IFNULL(finish_date, cancel_date) BETWEEN :startDate AND :endDate    " +
            "      and order_type_code = :orderTypeCode    " +
            "      and rental_store_no=:storeNo    " +
            "    GROUP BY yyyymmdd    " +
            "  ) dd    " +
            ") a    " +
            "ORDER BY yyyymmdd ASC;" +
            "", nativeQuery = true)
    List<Map<String,Object>> getDayListOrderType(@Param("orderTypeCode") String orderTypeCode,
                                        @Param("startDate") LocalDateTime startDate,
                                        @Param("endDate") LocalDateTime endDate,
                                        @Param("storeNo") String storeNo
                                       );

    /**
     * @param searchDate
     * @return + 일별통계 통계
     */
    @Query(value = "SELECT    " +
            "  DATE_FORMAT(yyyymmdd, '%Y/%m/%d') as dayDate,    " +
            "  DAYOFWEEK(yyyymmdd) AS dw,    " +
            "  totalCall,    " +
            "  successCall,    " +
            "  cancelCall,    " +
            "  ROUND(cancelCall / totalCall * 100, 1) AS cancelPer,    " +
            "  orderAmt,    " +
            "  discountAmt,    " +
            "  totalAmt,    " +
            "  ROUND((successCall - beforeCall) / beforeCall * 100, 1) AS beforePer    " +
            "FROM (    " +
            "  SELECT    " +
            "    yyyymmdd, (successCall + cancelCall) AS totalCall, successCall, cancelCall, orderAmt, discountAmt, totalAmt,    " +
            "    IFNULL(LAG(successCall) OVER (ORDER BY yyyymmdd), '') AS beforeCall    " +
            "  FROM (    " +
            "    SELECT    " +
            "      date_format(IFNULL(finish_date, cancel_date), '%y-%m-%d') AS yyyymmdd,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN 1 ELSE 0 END) AS successCall,    " +
            "      SUM(CASE WHEN order_status_code = 41 THEN 1 ELSE 0 END) AS cancelCall,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN order_amt ELSE 0 END) AS orderAmt,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN discount_amt ELSE 0 END) AS discountAmt,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN total_amt ELSE 0 END) AS totalAmt    " +
            "    FROM    " +
            "      tb_call_all    " +
            "    WHERE    " +
            "      (    " +
            "        order_status_code = 40 OR    " +
            "        (order_status_code = 41 AND order_pay_status = 5)    " +
            "      )    " +
            "      and IFNULL(finish_date, cancel_date) BETWEEN :startDate AND :endDate    " +
            "      and DAYOFWEEK(IFNULL(finish_date, cancel_date)) =:day   " +
            "       and order_type_code in (20, 21)    " +
            "    GROUP BY yyyymmdd    " +
            "  ) dd    " +
            ") a    " +
            "ORDER BY yyyymmdd ASC;" +
            "", nativeQuery = true)
    List<Map<String,Object>> getDayListDay(
                                        @Param("startDate") LocalDateTime startDate,
                                        @Param("endDate") LocalDateTime endDate,
                                        @Param("day") String day);
    /**
     * @param searchDate
     * @return + 일별통계 통계
     */
    @Query(value = "SELECT    " +
            "  DATE_FORMAT(yyyymmdd, '%Y/%m/%d') as dayDate,    " +
            "  DAYOFWEEK(yyyymmdd) AS dw,    " +
            "  totalCall,    " +
            "  successCall,    " +
            "  cancelCall,    " +
            "  ROUND(cancelCall / totalCall * 100, 1) AS cancelPer,    " +
            "  orderAmt,    " +
            "  discountAmt,    " +
            "  totalAmt,    " +
            "  ROUND((successCall - beforeCall) / beforeCall * 100, 1) AS beforePer    " +
            "FROM (    " +
            "  SELECT    " +
            "    yyyymmdd, (successCall + cancelCall) AS totalCall, successCall, cancelCall, orderAmt, discountAmt, totalAmt,    " +
            "    IFNULL(LAG(successCall) OVER (ORDER BY yyyymmdd), '') AS beforeCall    " +
            "  FROM (    " +
            "    SELECT    " +
            "      date_format(IFNULL(finish_date, cancel_date), '%y-%m-%d') AS yyyymmdd,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN 1 ELSE 0 END) AS successCall,    " +
            "      SUM(CASE WHEN order_status_code = 41 THEN 1 ELSE 0 END) AS cancelCall,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN order_amt ELSE 0 END) AS orderAmt,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN discount_amt ELSE 0 END) AS discountAmt,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN total_amt ELSE 0 END) AS totalAmt    " +
            "    FROM    " +
            "      tb_call_all    " +
            "    WHERE    " +
            "      (    " +
            "        order_status_code = 40 OR    " +
            "        (order_status_code = 41 AND order_pay_status = 5)    " +
            "      )    " +
            "      and IFNULL(finish_date, cancel_date) BETWEEN :startDate AND :endDate    " +
            "      and DAYOFWEEK(IFNULL(finish_date, cancel_date)) = :day     " +
            "       and order_type_code in (20, 21)    " +
            "       and rental_store_no = :storeNo    " +
            "    GROUP BY yyyymmdd    " +
            "  ) dd    " +
            ") a    " +
            "ORDER BY yyyymmdd ASC;" +
            "", nativeQuery = true)
    List<Map<String,Object>> getDayListDay(
                                        @Param("startDate") LocalDateTime startDate,
                                        @Param("endDate") LocalDateTime endDate,
                                        @Param("day") String day,
                                        @Param("storeNo") String storeNo
                                        );








    /**
     * @param searchDate
     * @return + 월별통계
     */
    @Query(value = "SELECT    " +
            "  yyyymmdd,    " +
            "  DAYOFWEEK(yyyymmdd) AS dw,    " +
            "  totalCall,    " +
            "  successCall,    " +
            "  cancelCall,    " +
            "  ROUND(cancelCall / totalCall * 100, 1) AS cancelPer,    " +
            "  orderAmt,    " +
            "  discountAmt,    " +
            "  totalAmt,    " +
            "  ROUND((successCall - beforeCall) / beforeCall * 100, 1) AS beforePer    " +
            "FROM (    " +
            "  SELECT    " +
            "    yyyymmdd, (successCall + cancelCall) AS totalCall, successCall, cancelCall, orderAmt, discountAmt, totalAmt,    " +
            "    IFNULL(LAG(successCall) OVER (ORDER BY yyyymmdd), '') AS beforeCall    " +
            "  FROM (    " +
            "    SELECT    " +
            "      date_format(IFNULL(finish_date, cancel_date), '%Y/%m') AS yyyymmdd,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN 1 ELSE 0 END) AS successCall,    " +
            "      SUM(CASE WHEN order_status_code = 41 THEN 1 ELSE 0 END) AS cancelCall,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN order_amt ELSE 0 END) AS orderAmt,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN discount_amt ELSE 0 END) AS discountAmt,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN total_amt ELSE 0 END) AS totalAmt    " +
            "    FROM    " +
            "      tb_call_all    " +
            "    WHERE    " +
            "      (    " +
            "        order_status_code = 40 OR    " +
            "        (order_status_code = 41 AND order_pay_status = 5)    " +
            "      )    " +
            "      and IFNULL(finish_date, cancel_date) BETWEEN :startDate AND :endDate    " +
            "       and order_type_code in (20, 21)    " +
            "    GROUP BY yyyymmdd    " +
            "  ) dd    " +
            ") a    " +
            "ORDER BY yyyymmdd ASC;" +
            "", nativeQuery = true)
    List<Map<String,Object>> getMonthListAll(
            @Param("startDate") LocalDateTime startDate,
            @Param("endDate") LocalDateTime endDate
    );

    /**
     * @param searchDate
     * @return + 월별통계 통계
     */
    @Query(value = "SELECT    " +
            "  yyyymmdd,    " +
            "  DAYOFWEEK(yyyymmdd) AS dw,    " +
            "  totalCall,    " +
            "  successCall,    " +
            "  cancelCall,    " +
            "  ROUND(cancelCall / totalCall * 100, 1) AS cancelPer,    " +
            "  orderAmt,    " +
            "  discountAmt,    " +
            "  totalAmt,    " +
            "  ROUND((successCall - beforeCall) / beforeCall * 100, 1) AS beforePer    " +
            "FROM (    " +
            "  SELECT    " +
            "    yyyymmdd, (successCall + cancelCall) AS totalCall, successCall, cancelCall, orderAmt, discountAmt, totalAmt,    " +
            "    IFNULL(LAG(successCall) OVER (ORDER BY yyyymmdd), '') AS beforeCall    " +
            "  FROM (    " +
            "    SELECT    " +
            "      date_format(IFNULL(finish_date, cancel_date), '%Y/%m') AS yyyymmdd,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN 1 ELSE 0 END) AS successCall,    " +
            "      SUM(CASE WHEN order_status_code = 41 THEN 1 ELSE 0 END) AS cancelCall,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN order_amt ELSE 0 END) AS orderAmt,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN discount_amt ELSE 0 END) AS discountAmt,    " +
            "      SUM(CASE WHEN order_status_code = 40 THEN total_amt ELSE 0 END) AS totalAmt    " +
            "    FROM    " +
            "      tb_call_all    " +
            "    WHERE    " +
            "      (    " +
            "        order_status_code = 40 OR    " +
            "        (order_status_code = 41 AND order_pay_status = 5)    " +
            "      )    " +
            "      and IFNULL(finish_date, cancel_date) BETWEEN :startDate AND :endDate    " +
            "       and order_type_code = :orderTypeCode    " +
            "    GROUP BY yyyymmdd    " +
            "  ) dd    " +
            ") a    " +
            "ORDER BY yyyymmdd ASC;" +
            "", nativeQuery = true)
    List<Map<String,Object>> getMonthListOrderType(@Param("orderTypeCode") String orderTypeCode,
                                                 @Param("startDate") LocalDateTime startDate,
                                                 @Param("endDate") LocalDateTime endDate
    );








    /**
     * @param searchDate
     * @return + 주별통계
     */
    @Query(value = "SELECT    " +
            "    weekNum AS dayDate,    " +
            "    CONCAT(    " +
            "        DATE_FORMAT(DATE_ADD(:startDate, INTERVAL weekNum WEEK), '%Y/%m/%d'),    " +
            "        ' ~ ',    " +
            "        DATE_FORMAT(DATE_ADD(DATE_ADD(:startDate, INTERVAL weekNum WEEK), INTERVAL 6 DAY), '%Y/%m/%d')    " +
            "    ) AS weekStr,    " +
            "    totalCall,    " +
            "    successCall,    " +
            "    cancelCall,    " +
            "    ROUND(cancelCall / totalCall * 100, 1) AS cancelPer,    " +
            "    orderAmt,    " +
            "    discountAmt,    " +
            "    totalAmt,    " +
            "    ROUND((successCall - beforeCall) / beforeCall * 100, 1) AS beforePer    " +
            "FROM (    " +
            "    SELECT    " +
            "        weekNum, (successCall + cancelCall) AS totalCall, successCall, cancelCall, orderAmt, discountAmt, totalAmt,    " +
            "        IFNULL(LAG(successCall) OVER (ORDER BY weekNum), '') AS beforeCall    " +
            "    FROM (    " +
            "        SELECT    " +
            "            TRUNCATE(DATEDIFF(IFNULL(finish_date, cancel_date), :startDate) / 7, 0) AS weekNum,    " +
            "            SUM(CASE WHEN order_status_code = 40 THEN 1 ELSE 0 END) AS successCall,    " +
            "            SUM(CASE WHEN order_status_code = 41 THEN 1 ELSE 0 END) AS cancelCall,    " +
            "            SUM(CASE WHEN order_status_code = 40 THEN order_amt ELSE 0 END) AS orderAmt,    " +
            "            SUM(CASE WHEN order_status_code = 40 THEN discount_amt ELSE 0 END) AS discountAmt,    " +
            "            SUM(CASE WHEN order_status_code = 40 THEN total_amt ELSE 0 END) AS totalAmt    " +
            "        FROM    " +
            "            tb_call_all    " +
            "        WHERE    " +
            "        (    " +
            "            order_status_code = 40 OR    " +
            "            (order_status_code = 41 AND order_pay_status = 5)    " +
            "        )    " +
            "        and IFNULL(finish_date, cancel_date) BETWEEN :startDate AND :endDate    " +
            "        and order_type_code in (20, 21)    " +
            "        GROUP BY    " +
            "            weekNum    " +
            "    ) dd    " +
            ") a    " +
            "ORDER BY dayDate ASC;" +
            "", nativeQuery = true)
    List<Map<String,Object>> getWeekListAll(
            @Param("startDate") LocalDateTime startDate,
            @Param("endDate") LocalDateTime endDate
    );

    /**
     * @param searchDate
     * @return + 주별통계 통계
     */
    @Query(value = "SELECT    " +
            "    weekNum AS dayDate,    " +
            "    CONCAT(    " +
            "        DATE_FORMAT(DATE_ADD(:startDate, INTERVAL weekNum WEEK), '%Y/%m/%d'),    " +
            "        ' ~ ',    " +
            "        DATE_FORMAT(DATE_ADD(DATE_ADD(:startDate, INTERVAL weekNum WEEK), INTERVAL 6 DAY), '%Y/%m/%d')    " +
            "    ) AS weekStr,    " +
            "    totalCall,    " +
            "    successCall,    " +
            "    cancelCall,    " +
            "    ROUND(cancelCall / totalCall * 100, 1) AS cancelPer,    " +
            "    orderAmt,    " +
            "    discountAmt,    " +
            "    totalAmt,    " +
            "    ROUND((successCall - beforeCall) / beforeCall * 100, 1) AS beforePer    " +
            "FROM (    " +
            "    SELECT    " +
            "        weekNum, (successCall + cancelCall) AS totalCall, successCall, cancelCall, orderAmt, discountAmt, totalAmt,    " +
            "        IFNULL(LAG(successCall) OVER (ORDER BY weekNum), '') AS beforeCall    " +
            "    FROM (    " +
            "        SELECT    " +
            "            TRUNCATE(DATEDIFF(IFNULL(finish_date, cancel_date), :startDate) / 7, 0) AS weekNum,    " +
            "            SUM(CASE WHEN order_status_code = 40 THEN 1 ELSE 0 END) AS successCall,    " +
            "            SUM(CASE WHEN order_status_code = 41 THEN 1 ELSE 0 END) AS cancelCall,    " +
            "            SUM(CASE WHEN order_status_code = 40 THEN order_amt ELSE 0 END) AS orderAmt,    " +
            "            SUM(CASE WHEN order_status_code = 40 THEN discount_amt ELSE 0 END) AS discountAmt,    " +
            "            SUM(CASE WHEN order_status_code = 40 THEN total_amt ELSE 0 END) AS totalAmt    " +
            "        FROM    " +
            "            tb_call_all    " +
            "        WHERE    " +
            "        (    " +
            "            order_status_code = 40 OR    " +
            "            (order_status_code = 41 AND order_pay_status = 5)    " +
            "        )    " +
            "        and IFNULL(finish_date, cancel_date) BETWEEN :startDate AND :endDate    " +
            "        and order_type_code = :orderTypeCode    " +
            "        GROUP BY    " +
            "            weekNum    " +
            "    ) dd    " +
            ") a    " +
            "ORDER BY dayDate ASC;" +
            "", nativeQuery = true)
    List<Map<String,Object>> getWeekListOrderType(@Param("orderTypeCode") String orderTypeCode,
                                                   @Param("startDate") LocalDateTime startDate,
                                                   @Param("endDate") LocalDateTime endDate
    );

    /**
     * @param searchDate
     * @return + 회원통계
     */
    /*@Query(value = "select     " +
            "    DATE_FORMAT(yyyymmdd, '%Y/%m/%d') as yyyymmdd,    " +
            "    dw ,    " +
            "    totalCnt ,    " +
            "    androidCnt ,    " +
            "    ROUND(androidCnt/ (androidCnt+iosCnt) * 100, 1) AS androidPer ,    " +
            "    iosCnt ,    " +
            "    ROUND(iosCnt/ (androidCnt+iosCnt) * 100, 1) AS iosPer ,    " +
            "    maleCnt ,    " +
            "    ROUND(maleCnt/ (maleCnt+feMaleCnt) * 100, 1) AS malePer ,    " +
            "    feMaleCnt ,    " +
            "    ROUND(femaleCnt/ (maleCnt+femaleCnt) * 100, 1) AS femalePer     " +
            "    from(    " +
            "        select     " +
            "            date_format(a.insert_date, '%y-%m-%d') AS yyyymmdd    " +
            "            , DAYOFWEEK(a.insert_date) as dw    " +
            "            , count(1) as totalCnt    " +
            "            , SUM(CASE WHEN device_type =1 THEN 1 ELSE 0 END) AS androidCnt    " +
            "            , SUM(CASE WHEN device_type =2 THEN 1 ELSE 0 END) AS iosCnt    " +
            "            , SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS maleCnt    " +
            "            , SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS femaleCnt    " +
            "        FROM tb_cust a    " +
            "        left outer join      " +
            "        tb_cust_device b     " +
            "        on a.cust_no = b.cust_no    " +
            "        where a.insert_date BETWEEN :startDate AND :endDate    " +
            "        and a.is_member =1" +
            "        and a.data_status = 1"+
            "        group by yyyymmdd      " +
            "        )c    " +
            "    group by yyyymmdd" +
            "", nativeQuery = true)
    List<Map<String,Object>> getUserList(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate
    );*/
    @Query(value = "select     " +
            "    DATE_FORMAT(yyyymmdd, '%Y/%m/%d') as yyyymmdd,    " +
            "    dw ,    " +
            "    totalCnt ,    " +
            "    androidCnt ,    " +
            "    ROUND(androidCnt/ (androidCnt+iosCnt) * 100, 1) AS androidPer ,    " +
            "    iosCnt ,    " +
            "    ROUND(iosCnt/ (androidCnt+iosCnt) * 100, 1) AS iosPer ,    " +
            "    maleCnt ,    " +
            "    ROUND(maleCnt/ (maleCnt+feMaleCnt) * 100, 1) AS malePer ,    " +
            "    feMaleCnt ,    " +
            "    ROUND(femaleCnt/ (maleCnt+femaleCnt) * 100, 1) AS femalePer,     " +
            "    platformJesicarCnt ,    " +
            "    ROUND(platformJesicarCnt/ (platformJesicarCnt+platformAnionCnt+platformNoneCnt) * 100, 1) AS platformJesicarPer ,    " +
            "    platformAnionCnt ,    " +
            "    ROUND(platformAnionCnt/ (platformJesicarCnt+platformAnionCnt+platformNoneCnt) * 100, 1) AS platformAnionPer,     " +
            "    platformNoneCnt ,    " +
            "    ROUND(platformNoneCnt/ (platformJesicarCnt+platformAnionCnt+platformNoneCnt) * 100, 1) AS platformNonePer     " +
            "    from(    " +
            "        select    " +
            "            date_format(ab.insert_date, '%y-%m-%d') AS yyyymmdd       " +
            "            , DAYOFWEEK(ab.insert_date) as dw       " +
            "            , count(1) as totalCnt       " +
            "            , SUM(CASE WHEN ab.device_type =1 THEN 1 ELSE 0 END) AS androidCnt       " +
            "            , SUM(CASE WHEN ab.device_type =2 THEN 1 ELSE 0 END) AS iosCnt       " +
            "            , SUM(CASE WHEN ab.gender = 'M' THEN 1 ELSE 0 END) AS maleCnt       " +
            "            , SUM(CASE WHEN ab.gender = 'F' THEN 1 ELSE 0 END) AS femaleCnt       " +
            "            , SUM(CASE WHEN ab.platform_type = '0' THEN 1 ELSE 0 END) AS platformNoneCnt       " +
            "            , SUM(CASE WHEN ab.platform_type = '1' THEN 1 ELSE 0 END) AS platformJesicarCnt       " +
            "            , SUM(CASE WHEN ab.platform_type = '2' THEN 1 ELSE 0 END) AS platformAnionCnt     " +
            "               from  " +
            "                   (select        " +
            "                           a.cust_no   " +
            "                           ,a.cust_name   " +
            "                           ,a.cust_tel   " +
            "                           ,b.device_type   " +
            "                           ,a.gender   " +
            "                           ,a.insert_date   " +
            "                           ,a.platform_type  " +
            "                    FROM tb_cust a       " +
            "                   left outer join         " +
            "                   tb_cust_device b        " +
            "                   on a.cust_no = b.cust_no       " +
            "                   where a.insert_date BETWEEN :startDate AND :endDate  " +
            "                   and a.is_member =1   " +
            "                   and a.data_status = 1   " +
            "                   and a.platform_type = :platform   " +
            "                   group by a.cust_no) ab   " +
            "           group by yyyymmdd      " +
            "        )c    " +
            "    group by yyyymmdd" +
            "", nativeQuery = true)
    List<Map<String,Object>> getUserList(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate , @Param("platform") Integer platform
    );

    @Query(value = "select     " +
            "    DATE_FORMAT(yyyymmdd, '%Y/%m/%d') as yyyymmdd,    " +
            "    dw ,    " +
            "    totalCnt ,    " +
            "    androidCnt ,    " +
            "    ROUND(androidCnt/ (androidCnt+iosCnt) * 100, 1) AS androidPer ,    " +
            "    iosCnt ,    " +
            "    ROUND(iosCnt/ (androidCnt+iosCnt) * 100, 1) AS iosPer ,    " +
            "    maleCnt ,    " +
            "    ROUND(maleCnt/ (maleCnt+feMaleCnt) * 100, 1) AS malePer ,    " +
            "    feMaleCnt ,    " +
            "    ROUND(femaleCnt/ (maleCnt+femaleCnt) * 100, 1) AS femalePer,     " +
            "    platformJesicarCnt ,    " +
            "    ROUND(platformJesicarCnt/ (platformJesicarCnt+platformAnionCnt+platformNoneCnt) * 100, 1) AS platformJesicarPer ,    " +
            "    platformAnionCnt ,    " +
            "    ROUND(platformAnionCnt/ (platformJesicarCnt+platformAnionCnt+platformNoneCnt) * 100, 1) AS platformAnionPer,     " +
            "    platformNoneCnt ,    " +
            "    ROUND(platformNoneCnt/ (platformJesicarCnt+platformAnionCnt+platformNoneCnt) * 100, 1) AS platformNonePer     " +
            "    from(    " +
            "        select    " +
            "            date_format(ab.insert_date, '%y-%m-%d') AS yyyymmdd       " +
            "            , DAYOFWEEK(ab.insert_date) as dw       " +
            "            , count(1) as totalCnt       " +
            "            , SUM(CASE WHEN ab.device_type =1 THEN 1 ELSE 0 END) AS androidCnt       " +
            "            , SUM(CASE WHEN ab.device_type =2 THEN 1 ELSE 0 END) AS iosCnt       " +
            "            , SUM(CASE WHEN ab.gender = 'M' THEN 1 ELSE 0 END) AS maleCnt       " +
            "            , SUM(CASE WHEN ab.gender = 'F' THEN 1 ELSE 0 END) AS femaleCnt       " +
            "            , SUM(CASE WHEN ab.platform_type = '0' THEN 1 ELSE 0 END) AS platformNoneCnt       " +
            "            , SUM(CASE WHEN ab.platform_type = '1' THEN 1 ELSE 0 END) AS platformJesicarCnt       " +
            "            , SUM(CASE WHEN ab.platform_type = '2' THEN 1 ELSE 0 END) AS platformAnionCnt     " +
            "               from  " +
            "                   (select        " +
            "                           a.cust_no   " +
            "                           ,a.cust_name   " +
            "                           ,a.cust_tel   " +
            "                           ,b.device_type   " +
            "                           ,a.gender   " +
            "                           ,a.insert_date   " +
            "                           ,a.platform_type  " +
            "                    FROM tb_cust a       " +
            "                   left outer join         " +
            "                   tb_cust_device b        " +
            "                   on a.cust_no = b.cust_no       " +
            "                   where a.insert_date BETWEEN :startDate AND :endDate  " +
            "                   and a.is_member =1   " +
            "                   and a.data_status = 1   " +
            "                   group by a.cust_no) ab   " +
            "           group by yyyymmdd      " +
            "        )c    " +
            "    group by yyyymmdd" +
            "", nativeQuery = true)
    List<Map<String,Object>> getUserList(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate
    );

    /**
     * @param searchDate
     * @return + 기본통계
     */
    @Query(value = "SELECT      " +
            "  t1.yyyymmdd AS dayDate,      " +
            "  DAYOFWEEK(t1.yyyymmdd) AS dw,      " +
            "  t1.storeName as storeName,  " +
            "  IFNULL(t1.rentCnt, 0) AS rentCnt,      " +
            "  IFNULL(t1.safenCnt, 0) AS safenCnt,      " +
            "  IFNULL(t2.reservEndCnt, 0) AS reservEndCnt,       " +
            "  ROUND(IFNULL(t1.safenCnt / t1.rentCnt * 100, 0), 1) AS safenPer    " +
            "FROM  (      " +
            "  SELECT       " +
            "    date_format(insert_date, '%y-%m-%d') AS yyyymmdd,       " +
            "    COUNT(1) AS rentCnt,    " +
            "    store_name as storeName,  " +
            "    SUM(CASE WHEN safen_num IS NOT NULL THEN 1 ELSE 0 END) AS safenCnt       " +
            "  FROM tb_rental_info      " +
            "  WHERE insert_date BETWEEN :startDate and :endDate " +
            "  AND store_name like :storeName   " +
            "  GROUP BY yyyymmdd      " +
            ") t1 left join (    " +
            "  select     " +
            "    al.yyyymmdd ,    " +
            "      al.reservEndDate,    " +
            "    count(al.reservEndDate) as reservEndCnt    " +
            "  from(    " +
            "    select     " +
            "      date_format(insert_date, '%y-%m-%d') AS yyyymmdd,    " +
            "      date_format(reserv_end_date, '%y-%m-%d') AS reservEndDate     " +
            "    from tb_rental_info    " +
            "    where store_name like :storeName   " +
            "    ) al    " +
            "  group by al.reservEndDate    " +
            " ) t2 on t1.yyyymmdd = t2.reservEndDate  " +
            "", nativeQuery = true)
    List<Map<String,Object>> getBaseList(@Param("storeName") String storeName, @Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate
    );
/*
    @Query(value = "SELECT    " +
            "  t1.yyyymmdd AS dayDate,    " +
            "  DAYOFWEEK(t1.yyyymmdd) AS dw,    " +
            "  t2.storeName as storeName, " +
            "  IFNULL(t2.rentCnt, 0) AS rentCnt,    " +
            "  IFNULL(t2.safenCnt, 0) AS safenCnt,    " +
            "  IFNULL(t3.reservEndCnt, 0) AS reservEndCnt,    " +
            "  ROUND(IFNULL(t2.safenCnt / t2.rentCnt * 100, 0), 1) AS safenPer,    " +
            "  t1.takeoverCnt,    " +
            "  ROUND(t1.takeoverCnt / t1.totalCnt * 100, 1) AS takeoverPer,    " +
            "  t1.returnCnt,    " +
            "  ROUND(t1.returnCnt / t1.totalCnt * 100, 1) AS returnPer,    " +
            "  t1.totalCnt    " +
            "FROM (    " +
            "  SELECT    " +
            "    date_format(IFNULL(finish_date, cancel_date), '%y-%m-%d') AS yyyymmdd,    " +
            "    SUM(CASE WHEN order_type_code = 20 THEN 1 ELSE 0 END) AS takeoverCnt,    " +
            "    SUM(CASE WHEN order_type_code = 21 THEN 1 ELSE 0 END) AS returnCnt,    " +
            "    COUNT(1) AS totalCnt    " +
            "  FROM    " +
            "    tb_call_all    " +
            "  WHERE    " +
            "    order_status_code = 40    " +
            "    and IFNULL(finish_date, cancel_date) BETWEEN :startDate AND :endDate    " +
            "  GROUP BY yyyymmdd    " +
            ") t1 left join (    " +
            "  SELECT     " +
            "    date_format(insert_date, '%y-%m-%d') AS yyyymmdd,     " +
            "    COUNT(1) AS rentCnt,    " +
            "    store_name as storeName,   " +
            "    SUM(CASE WHEN safen_num IS NOT NULL THEN 1 ELSE 0 END) AS safenCnt     " +
            "  FROM tb_rental_info    " +
            "  WHERE insert_date BETWEEN :startDate and :endDate    " +
            "  GROUP BY yyyymmdd    " +
            ") t2  ON t1.yyyymmdd = t2.yyyymmdd  " +
            " left join (  " +
            "  select   " +
            "    al.yyyymmdd ,  " +
            "      al.reservEndDate,  " +
            "    count(al.reservEndDate) as reservEndCnt  " +
            "  from(  " +
            "    select   " +
            "      date_format(insert_date, '%y-%m-%d') AS yyyymmdd,  " +
            "      date_format(reserv_end_date, '%y-%m-%d') AS reservEndDate   " +
            "    from tb_rental_info  " +
            "    ) al  " +
            "  group by al.reservEndDate  " +
            " ) t3 on t1.yyyymmdd = t3.reservEndDate  " +
            "", nativeQuery = true)
    List<Map<String,Object>> getBaseList(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate
    );
*/

/*
    */
/**
     * @param searchDate
     * @return + 기본통계
     *//*

    @Query(value = "SELECT  " +
            "  t1.yyyymmdd AS dayDate,  " +
            "  DAYOFWEEK(t1.yyyymmdd) AS dw,  " +
            "  IFNULL(t2.rentCnt, 0) AS rentCnt,  " +
            "  IFNULL(t2.safenCnt, 0) AS safenCnt,  " +
            "  ROUND(IFNULL(t2.safenCnt / t2.rentCnt * 100, 0), 1) AS safenPer,  " +
            "  t1.takeoverCnt,  " +
            "  ROUND(t1.takeoverCnt / t1.totalCnt * 100, 1) AS takeoverPer,  " +
            "  t1.returnCnt,  " +
            "  ROUND(t1.returnCnt / t1.totalCnt * 100, 1) AS returnPer,  " +
            "  t1.totalCnt  " +
            "FROM (  " +
            "  SELECT  " +
            "    date_format(IFNULL(finish_date, cancel_date), '%y-%m-%d') AS yyyymmdd,  " +
            "    SUM(CASE WHEN order_type_code = 20 THEN 1 ELSE 0 END) AS takeoverCnt,  " +
            "    SUM(CASE WHEN order_type_code = 21 THEN 1 ELSE 0 END) AS returnCnt,  " +
            "    COUNT(1) AS totalCnt  " +
            "  FROM  " +
            "    tb_call_all  " +
            "  WHERE  " +
            "    order_status_code = 40  " +
            "    and IFNULL(finish_date, cancel_date) BETWEEN :startDate AND :endDate  " +
            "  GROUP BY yyyymmdd  " +
            ") t1 left join (  " +
            "  SELECT   " +
            "    date_format(insert_date, '%y-%m-%d') AS yyyymmdd,   " +
            "    COUNT(1) AS rentCnt,  " +
            "    SUM(CASE WHEN safen_num IS NOT NULL THEN 1 ELSE 0 END) AS safenCnt   " +
            "  FROM tb_rental_info  " +
            "  WHERE insert_date BETWEEN :startDate and :endDate  " +
            "  GROUP BY yyyymmdd  " +
            ") t2  " +
            "ON t1.yyyymmdd = t2.yyyymmdd;" +
            "", nativeQuery = true)
    List<Map<String,Object>> getBaseList(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate
    );
*/

}