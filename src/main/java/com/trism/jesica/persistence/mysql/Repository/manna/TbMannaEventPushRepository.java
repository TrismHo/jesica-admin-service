package com.trism.jesica.persistence.mysql.Repository.manna;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaEventPush;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface TbMannaEventPushRepository extends JpaRepository<TbMannaEventPush, Long>, JpaSpecificationExecutor<TbMannaEventPush> {
    Page<TbMannaEventPush> findAll(Specification<TbMannaEventPush> specification, Pageable pageable);
    Optional<TbMannaEventPush> findByLogNo(@Param("logNo") Long logNo);



           /* @Query(value = "        " +
            "           select " +
            "                  ab.logNo as logNo," +
            "                  ab.appCode as appCode, "+
            "                  ab.insertDate as insertDate," +
            "                  ab.evntSeqNo as evntSeqNo," +
            "                  ab.grCode as grCode," +
            "                  ab.grName as grName," +
            "                  ab.param1 as param1," +
            "                  ab.param2 as param2," +
            "                  ab.param3 as param3," +
            "                  ab.sendCnt as sendCnt," +
            "                  ab.evStartDate as evStartDate," +
            "                  ab.evEndDate as evEndDate," +
            "                  ab.evTitle as evTitle," +
            "                  ab.evType as evType," +
            "                  ab.evPrice as evPrice," +
            "                  ab.evPriceMax as evPriceMax," +
            "                  ab.evOrdType as evOrdType," +
            "                  ab.evDvryType as evDvryType " +
            "                  from ("+
            "                  select " +
            "                               a.log_no as logNo," +
            "                               (select app_code from tb_cust where cust_no = b.cust_no ) as appCode, "+
            "                               a.insert_date as insertDate," +
            "                               a.evnt_seq_no as evntSeqNo," +
            "                               a.gr_code as grCode," +
            "                               a.gr_name as grName," +
            "                               a.param1 as param1," +
            "                               a.param2 as param2," +
            "                               a.param3 as param3," +
            "                               a.send_cnt as sendCnt," +
            "                               a.ev_start_date as evStartDate," +
            "                               a.ev_end_date as evEndDate," +
            "                               a.ev_title as evTitle," +
            "                               a.ev_type as evType," +
            "                               a.ev_price as evPrice," +
            "                               a.ev_price_max as evPriceMax," +
            "                               a.ev_ord_type as evOrdType," +
            "                               a.ev_dvry_type as evDvryType " +
            "                   FROM manna_event_push a  left outer join manna_event_push_log b      " +
            "                   on a.log_no = b.log_no"+
            "                   where ((:evTitle is null and 1=1) or (:evTitle is not null and a.ev_title like :evTitle))      " +
            "                   and ((:param1 is null and 1=1) or (:param1 is not null and a.param1 = :param1))      " +
            "                   and ((:evType is null and 1=1) or (:evType is not null and a.ev_type = :evType))      " +
            "                   and ((:evOrdType is null and 1=1) or (:evOrdType is not null and a.ev_ord_type = :evOrdType))      " +
            "                   and ((:evDvryType is null and 1=1) or (:evDvryType is not null and a.ev_dvry_type = :evDvryType)) " +
            "                   and  a.insert_date BETWEEN :startDate AND :endDate) ab" +
            "                   where ((:appCode is null and 1=1) or (:appCode is not null and ab.appCode = :appCode))  ",
            countQuery = "           select " +
                    "                  ab.logNo as logNo," +
                    "                  ab.appCode as appCode, "+
                    "                  ab.insertDate as insertDate," +
                    "                  ab.evntSeqNo as evntSeqNo," +
                    "                  ab.grCode as grCode," +
                    "                  ab.grName as grName," +
                    "                  ab.param1 as param1," +
                    "                  ab.param2 as param2," +
                    "                  ab.param3 as param3," +
                    "                  ab.sendCnt as sendCnt," +
                    "                  ab.evStartDate as evStartDate," +
                    "                  ab.evEndDate as evEndDate," +
                    "                  ab.evTitle as evTitle," +
                    "                  ab.evType as evType," +
                    "                  ab.evPrice as evPrice," +
                    "                  ab.evPriceMax as evPriceMax," +
                    "                  ab.evOrdType as evOrdType," +
                    "                  ab.evDvryType as evDvryType " +
                    "                  from ("+
                    "                  select " +
                    "                               a.log_no as logNo," +
                    "                               (select app_code from tb_cust where cust_no = b.cust_no ) as appCode, "+
                    "                               a.insert_date as insertDate," +
                    "                               a.evnt_seq_no as evntSeqNo," +
                    "                               a.gr_code as grCode," +
                    "                               a.gr_name as grName," +
                    "                               a.param1 as param1," +
                    "                               a.param2 as param2," +
                    "                               a.param3 as param3," +
                    "                               a.send_cnt as sendCnt," +
                    "                               a.ev_start_date as evStartDate," +
                    "                               a.ev_end_date as evEndDate," +
                    "                               a.ev_title as evTitle," +
                    "                               a.ev_type as evType," +
                    "                               a.ev_price as evPrice," +
                    "                               a.ev_price_max as evPriceMax," +
                    "                               a.ev_ord_type as evOrdType," +
                    "                               a.ev_dvry_type as evDvryType " +
                    "                   FROM manna_event_push a  left outer join manna_event_push_log b      " +
                    "                   on a.log_no = b.log_no"+
                    "                   where ((:evTitle is null and 1=1) or (:evTitle is not null and a.ev_title like :evTitle))      " +
                    "                   and ((:param1 is null and 1=1) or (:param1 is not null and a.param1 = :param1))      " +
                    "                   and ((:evType is null and 1=1) or (:evType is not null and a.ev_type = :evType))      " +
                    "                   and ((:evOrdType is null and 1=1) or (:evOrdType is not null and a.ev_ord_type = :evOrdType))      " +
                    "                   and ((:evDvryType is null and 1=1) or (:evDvryType is not null and a.ev_dvry_type = :evDvryType)) " +
                    "                   and  a.insert_date BETWEEN :startDate AND :endDate) ab" +
                    "                   where ((:appCode is null and 1=1) or (:appCode is not null and ab.appCode = :appCode))  ",
            nativeQuery = true)
    Page<Map<String,Object>> getEventPushList(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate
            , @Param("evTitle") String evTitle
            , @Param("param1") String param1
            , @Param("evType") String evType
            , @Param("evOrdType") String evOrdType
            , @Param("evDvryType") String evDvryType
            , @Param("appCode") String appCode
            , Pageable pageable
    );*/
}
