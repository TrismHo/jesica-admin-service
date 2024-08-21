package com.trism.jesica.persistence.mysql.Repository.manna;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaOrder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

public interface TbMannaOrderRepository extends JpaRepository<TbMannaOrder, Long>, JpaSpecificationExecutor<TbMannaOrder> {
    @Query(value = "select  " +
            " ord_no as ordNo, " +
            " ord_date as ordDate, " +
            " data_status as dataStatus, " +
            " ord_path_cd as ordPathCd, " +
            " ord_st_code as ordStCode, " +
            " pay_amt as payAmt, " +
            " dvry_service_type as dvryServiceType, " +
            " ord_cu_tel as ordCuTel, " +
            " ord_type as ordType, " +
            " st_tel as stTel, " +
            " ord_confirm_type as ordConfirmType, " +
            " cancel_memo as cancelMemo, " +
            " st_image as stImage, " +
            " takeout_date as takeoutDate, " +
            " table_type as tableType, " +
            " table_no as tableNo, " +
            " adult_cnt as adultCnt, " +
            " child_cnt as childCnt, " +
            " ord_st_wait_no as ordStWaitNo, " +
            " resv_date as resv_date , " +
            " mod_date as modDate, " +
            " cth_date as cthDate, " +
            " pickup_date as pickupDate, " +
            " end_date as endDate, " +
            " cancel_date as cancelDate, " +
            " cth_wk_name as cthWkName, " +
            " cth_wk_tel as cthWkTel, " +
            " srv_amt as srvAmt, " +
            " ea_addr_4 as eaAddr4, " +
            " ea_addr_5 as eaAddr5, " +
            " ea_addr_6 as eaAddr6, " +
            " ea_lat_y as eaLayY, " +
            " ea_lng_x as eaLngX " +
            "from manna_order   " +
            "where data_status = 1  " +
            "order by end_date  desc", nativeQuery = true)
    List<Map<String, Object>> findAllManna();


    @Query(value = "select         " +
            "    DATE_FORMAT(yyyymmdd, '%Y/%m/%d') as yyyymmdd,        " +
            "    dw ,        " +
            "    totalCnt ,         " +
            "    delivery   ,         " +
            "    takeout," +
            "    wait," +
            "    reserv," +
            "    tables," +
            "   (delivery+takeout+wait+reserv+tables) as sumCount" +
            "    from(        " +
            "        select        " +
            "            date_format(ab.ordDate, '%y-%m-%d') AS yyyymmdd           " +
            "            , DAYOFWEEK(ab.ordDate) as dw           " +
            "            , count(1) as totalCnt           " +
            "            , SUM(CASE WHEN ab.ordType = 1  THEN 1 ELSE 0 END) AS delivery " +
            "            , SUM(CASE WHEN ab.ordType = 2  THEN 1 ELSE 0 END) AS takeout  " +
            "            , SUM(CASE WHEN ab.ordType = 3  THEN 1 ELSE 0 END) AS wait  " +
            "            , SUM(CASE WHEN ab.ordType = 4  THEN 1 ELSE 0 END) AS reserv " +
            "            , SUM(CASE WHEN ab.ordType = 5  THEN 1 ELSE 0 END) AS tables  " +
            "               from      " +
            "                   (select            " +
            "                           ord_no as ordNo,     " +
            "                             ord_date as ordDate,     " +
            "                             data_status as dataStatus,     " +
            "                             ord_path_cd as ordPathCd,     " +
            "                             ord_st_code as ordStCode,     " +
            "                             pay_amt as payAmt,     " +
            "                             dvry_service_type as dvryServiceType,     " +
            "                             ord_cu_tel as ordCuTel,     " +
            "                             ord_type as ordType,     " +
            "                             st_tel as stTel,     " +
            "                             ord_confirm_type as ordConfirmType,     " +
            "                             takeout_date as takeoutDate,     " +
            "                             table_type as tableType,     " +
            "                             table_no as tableNo,     " +
            "                             adult_cnt as adultCnt,     " +
            "                             child_cnt as childCnt,     " +
            "                             ord_status as ordStatus,     " +
            "                             ord_st_wait_no as ordStWaitNo,     " +
            "                             resv_date as resv_date ,     " +
            "                             end_date as endDate,     " +
            "                             cancel_date as cancelDate,     " +
            "                             srv_amt as srvAmt     " +
            "                    FROM manna_order a           " +
            "                   where a.ord_date BETWEEN :startDate AND :endDate      " +
            "                   and data_status = 1       " +
            "                   and ord_path_cd = :ordPathCd" +
            "                   and ((:brCode is null and 1=1) or (:brCode is not null and a.br_code = :brCode))      " +
            "                   and ((:ordStatus is null and 1=1) or (:ordStatus is not null and a.ord_status = :ordStatus))) ab       " +
            "           group by yyyymmdd          " +
            "        )c        " +
            "    group by yyyymmdd" +
            "", nativeQuery = true)
    List<Map<String,Object>> getMannaOrderList(@Param("startDate") LocalDateTime startDate
            , @Param("endDate") LocalDateTime endDate
            , @Param("ordPathCd") String ordPathCd
            , @Param("brCode") String brCode
            , @Param("ordStatus") String ordStatus
    );

    @Query(value =
            /*"        select    " +
                    "            date_format(ab.ordDate, '%y-%m-%d') AS yyyymmdd           " +
                    "            , DAYOFWEEK(ab.ordDate) as dw           " +
                    "            , count(1) as totalCnt           " +
                    "            , SUM(CASE WHEN ab.endDate != null THEN 1 ELSE 0 END) AS endCnt       " +
                    "            , SUM(CASE WHEN ab.cancelDate != null THEN 1 ELSE 0 END) AS cancelCnt       " +
                    "               from  " +
                    "                   (select            " +
                    "                           ord_no as ordNo,     " +
                    "                             ord_date as ordDate,     " +
                    "                             data_status as dataStatus,     " +
                    "                             ord_path_cd as ordPathCd,     " +
                    "                             ord_st_code as ordStCode,     " +
                    "                             pay_amt as payAmt,     " +
                    "                             dvry_service_type as dvryServiceType,     " +
                    "                             ord_cu_tel as ordCuTel,     " +
                    "                             ord_type as ordType,     " +
                    "                             st_tel as stTel,     " +
                    "                             ord_confirm_type as ordConfirmType,     " +
                    "                             takeout_date as takeoutDate,     " +
                    "                             table_type as tableType,     " +
                    "                             table_no as tableNo,     " +
                    "                             adult_cnt as adultCnt,     " +
                    "                             child_cnt as childCnt,     " +
                    "                             ord_st_wait_no as ordStWaitNo,     " +
                    "                             resv_date as resv_date ,     " +
                    "                             end_date as endDate,     " +
                    "                             cancel_date as cancelDate,     " +
                    "                             srv_amt as srvAmt     " +
                    "                    FROM manna_order a           " +
                    "                   where a.ord_date BETWEEN :startDate AND :endDate      " +
                    "                   and data_status = 1       " +
                    "                   and ord_path_cd = :ordPathCd) ab       " +
                    "           group by yyyymmdd      " +
                    "           order by yyyymmdd "+*/
                    "select         " +
                            "    DATE_FORMAT(yyyymmdd, '%Y/%m/%d') as yyyymmdd      " +
                           /* " ,start" +
                            " ,end" +*/
                            "    ,dw         " +
                            "    ,totalCnt         " +
                            "    ,delivery            " +
                            "    ,takeout" +
                            "    ,wait" +
                            "    ,reserv" +
                            "    ,tables " +
                            "    ,(delivery + takeout + wait + reserv + tables) as sumcount" +
                            "    ,weekdate" +
                            "    from(        " +
                            "        select        " +
                            "            date_format(ab.ordDate, '%y-%m-%d') AS yyyymmdd           " +
                            "            , DAYOFWEEK(ab.ordDate) as dw           " +
                            "            , count(1) as totalCnt           " +
                            "            , SUM(CASE WHEN ab.ordType = 1 THEN 1 ELSE 0 END) AS delivery " +
                            "            , SUM(CASE WHEN ab.ordType = 2 THEN 1 ELSE 0 END) AS takeout  " +
                            "            , SUM(CASE WHEN ab.ordType = 3 THEN 1 ELSE 0 END) AS wait  " +
                            "            , SUM(CASE WHEN ab.ordType = 4 THEN 1 ELSE 0 END) AS reserv " +
                            "            , SUM(CASE WHEN ab.ordType = 5 THEN 1 ELSE 0 END) AS tables  " +
                            "            ,DATE_FORMAT(DATE_SUB(date_format(ab.ordDate, '%Y/%m/%d'), INTERVAL (DAYOFWEEK(date_format(ab.ordDate, '%Y/%m/%d'))-1) DAY), '%Y/%m/%d') as start " +
                            "    ,DATE_FORMAT(DATE_SUB(date_format(ab.ordDate, '%Y/%m/%d'), INTERVAL (DAYOFWEEK(date_format(ab.ordDate, '%Y/%m/%d'))-7) DAY), '%Y/%m/%d') as end " +
                            "    ,DATE_FORMAT(date_format(ab.ordDate, '%Y/%m/%d'), '%Y%U') AS `weekdate`" +
                            "               from      " +
                            "                   (select            " +
                            "                           ord_no as ordNo,     " +
                            "                             ord_date as ordDate,     " +
                            "                             data_status as dataStatus,     " +
                            "                             ord_path_cd as ordPathCd,     " +
                            "                             ord_st_code as ordStCode,     " +
                            "                             pay_amt as payAmt,     " +
                            "                             dvry_service_type as dvryServiceType,     " +
                            "                             ord_cu_tel as ordCuTel,     " +
                            "                             ord_type as ordType,     " +
                            "                             st_tel as stTel,     " +
                            "                             ord_confirm_type as ordConfirmType,     " +
                            "                             takeout_date as takeoutDate,     " +
                            "                             table_type as tableType,     " +
                            "                             table_no as tableNo,     " +
                            "                             adult_cnt as adultCnt,     " +
                            "                             child_cnt as childCnt,     " +
                            "                             ord_status as ordStatus,     " +
                            "                             ord_st_wait_no as ordStWaitNo,     " +
                            "                             resv_date as resv_date ,     " +
                            "                             end_date as endDate,     " +
                            "                             cancel_date as cancelDate,     " +
                            "                             srv_amt as srvAmt     " +
                            "                    FROM manna_order a   " +
                            "                    where a.ord_date BETWEEN :startDate AND :endDate"+
                            "                    and data_status = 1       " +
                            "                    and ord_path_cd = :ordPathCd " +
                            "                    and ((:brCode is null and 1=1) or (:brCode is not null and a.br_code = :brCode))       " +
                            "                    and ((:ordStatus is null and 1=1) or (:ordStatus is not null and ord_status = :ordStatus))) ab      " +
                            "           group by yyyymmdd          " +
                            "        )c        " +
                            "   group by yyyymmdd" +
                            "   order by yyyymmdd "+
                    "", nativeQuery = true)
    List<Map<String,Object>> getMannaLineDayList(@Param("startDate") LocalDateTime startDate,
                                                 @Param("endDate") LocalDateTime endDate,
                                                 @Param("ordPathCd") String ordPathCd,
                                                 @Param("brCode") String brCode,
                                                 @Param("ordStatus") String ordStatus
    );

    @Query(value =
            /*"        select    " +
                    "            date_format(ab.ordDate, '%y-%m-%d') AS yyyymmdd           " +
                    "            , DAYOFWEEK(ab.ordDate) as dw           " +
                    "            , count(1) as totalCnt           " +
                    "            , SUM(CASE WHEN ab.ordStatus != null THEN 1 ELSE 0 END) AS endCnt       " +
                    "            , SUM(CASE WHEN ab.ordType = 1 and ab.ordStatus = 5  THEN 1 ELSE 0 END) AS delivery " +
                    "            , SUM(CASE WHEN ab.ordType = 2 and ab.ordStatus = 5 THEN 1 ELSE 0 END) AS takeout  " +
                    "            , SUM(CASE WHEN ab.ordType = 3 and ab.ordStatus = 10 THEN 1 ELSE 0 END) AS wait  " +
                    "            , SUM(CASE WHEN ab.ordType = 4 and ab.ordStatus = 10 THEN 1 ELSE 0 END) AS reserv " +
                    "            , SUM(CASE WHEN ab.ordType = 5 and ab.ordStatus = 5  THEN 1 ELSE 0 END) AS tables  "+
                    "            ,DATE_FORMAT(DATE_SUB(date_format(ab.ordDate, '%Y/%m/%d'), INTERVAL (DAYOFWEEK(date_format(ab.ordDate, '%Y/%m/%d'))-1) DAY), '%Y/%m/%d') as start " +
                    "            ,DATE_FORMAT(DATE_SUB(date_format(ab.ordDate, '%Y/%m/%d'), INTERVAL (DAYOFWEEK(date_format(ab.ordDate, '%Y/%m/%d'))-7) DAY), '%Y/%m/%d') as end " +
                    "            ,DATE_FORMAT(date_format(ab.ordDate, '%Y/%m/%d'), '%Y%U') AS `weekdate`" +
                    "               from  " +
                    "                   (select            " +
                    "                           ord_no as ordNo,     " +
                    "                             ord_date as ordDate,     " +
                    "                             data_status as dataStatus,     " +
                    "                             ord_status as ordStatus,     " +
                    "                             ord_path_cd as ordPathCd,     " +
                    "                             ord_st_code as ordStCode,     " +
                    "                             pay_amt as payAmt,     " +
                    "                             dvry_service_type as dvryServiceType,     " +
                    "                             ord_cu_tel as ordCuTel,     " +
                    "                             ord_type as ordType,     " +
                    "                             st_tel as stTel,     " +
                    "                             ord_confirm_type as ordConfirmType,     " +
                    "                             takeout_date as takeoutDate,     " +
                    "                             table_type as tableType,     " +
                    "                             table_no as tableNo,     " +
                    "                             adult_cnt as adultCnt,     " +
                    "                             child_cnt as childCnt,     " +
                    "                             ord_st_wait_no as ordStWaitNo,     " +
                    "                             resv_date as resv_date ,     " +
                    "                             end_date as endDate,     " +
                    "                             cancel_date as cancelDate,     " +
                    "                             srv_amt as srvAmt     " +
                    "                    FROM manna_order a           " +
                    "                   where a.ord_date BETWEEN :startDate AND :endDate      " +
                    "                   and data_status = 1       " +
                    "                   and ord_path_cd = :ordPathCd) ab       " +
                    "           group by WEEK(yyyymmdd)      " +
                    "           order by weekdate      " +*/
                    "select         " +
                    "    DATE_FORMAT(yyyymmdd, '%Y/%m/%d') as yyyymmdd      " +
                    " ,start" +
                    " ,end" +
                    "    ,dw         " +
                    "    ,SUM(totalCnt) as totalCnt         " +
                    "    ,SUM(delivery) as delivery            " +
                    "    ,SUM(takeout) as takeout " +
                    "    ,SUM(wait) as wait " +
                    "    ,SUM(reserv) as reserv " +
                    "    ,SUM(tables) as tables " +
                    "    ,(SUM(delivery) + SUM(takeout) + SUM(wait) + SUM(reserv) + SUM(tables)) as sumcount" +
                    "    ,weekdate" +
                    "    from(        " +
                    "        select        " +
                    "            date_format(ab.ordDate, '%y-%m-%d') AS yyyymmdd           " +
                    "            , DAYOFWEEK(ab.ordDate) as dw           " +
                    "            , count(1) as totalCnt           " +
                    "            , SUM(CASE WHEN ab.ordType = 1 THEN 1 ELSE 0 END) AS delivery " +
                    "            , SUM(CASE WHEN ab.ordType = 2 THEN 1 ELSE 0 END) AS takeout  " +
                    "            , SUM(CASE WHEN ab.ordType = 3 THEN 1 ELSE 0 END) AS wait  " +
                    "            , SUM(CASE WHEN ab.ordType = 4 THEN 1 ELSE 0 END) AS reserv " +
                    "            , SUM(CASE WHEN ab.ordType = 5 THEN 1 ELSE 0 END) AS tables  " +
                    "            ,DATE_FORMAT(DATE_SUB(date_format(ab.ordDate, '%Y/%m/%d'), INTERVAL (DAYOFWEEK(date_format(ab.ordDate, '%Y/%m/%d'))-1) DAY), '%Y/%m/%d') as start " +
                    "    ,DATE_FORMAT(DATE_SUB(date_format(ab.ordDate, '%Y/%m/%d'), INTERVAL (DAYOFWEEK(date_format(ab.ordDate, '%Y/%m/%d'))-7) DAY), '%Y/%m/%d') as end " +
                    "    ,DATE_FORMAT(date_format(ab.ordDate, '%Y/%m/%d'), '%Y%U') AS `weekdate`" +
                    "               from      " +
                    "                   (select            " +
                    "                           ord_no as ordNo,     " +
                    "                             ord_date as ordDate,     " +
                    "                             data_status as dataStatus,     " +
                    "                             ord_path_cd as ordPathCd,     " +
                    "                             ord_st_code as ordStCode,     " +
                    "                             pay_amt as payAmt,     " +
                    "                             dvry_service_type as dvryServiceType,     " +
                    "                             ord_cu_tel as ordCuTel,     " +
                    "                             ord_type as ordType,     " +
                    "                             st_tel as stTel,     " +
                    "                             ord_confirm_type as ordConfirmType,     " +
                    "                             takeout_date as takeoutDate,     " +
                    "                             table_type as tableType,     " +
                    "                             table_no as tableNo,     " +
                    "                             adult_cnt as adultCnt,     " +
                    "                             child_cnt as childCnt,     " +
                    "                             ord_status as ordStatus,     " +
                    "                             ord_st_wait_no as ordStWaitNo,     " +
                    "                             resv_date as resv_date ,     " +
                    "                             end_date as endDate,     " +
                    "                             cancel_date as cancelDate,     " +
                    "                             srv_amt as srvAmt     " +
                    "                    FROM manna_order a   " +
                    "                    where a.ord_date BETWEEN :startDate AND :endDate " +
                    "                    and data_status = 1       " +
                    "                    and ord_path_cd = :ordPathCd " +
                    "                    and ((:brCode is null and 1=1) or (:brCode is not null and a.br_code = :brCode)) " +
                    "                    and ((:ordStatus is null and 1=1) or (:ordStatus is not null and ord_status = :ordStatus))) ab " +
                    "           group by yyyymmdd          " +
                    "        )c        " +
                    "   group by WEEK(yyyymmdd) " +
                    "   order by weekdate "+
                    "", nativeQuery = true)
    List<Map<String,Object>> getMannaLineWeekList(@Param("startDate") LocalDateTime startDate,
                                                  @Param("endDate") LocalDateTime endDate,
                                                  @Param("ordPathCd") String ordPathCd,
                                                  @Param("brCode") String brCode,
                                                  @Param("ordStatus") String ordStatus
    );
    Page<TbMannaOrder> findAll(Specification<TbMannaOrder> specification, Pageable pageable);

}
