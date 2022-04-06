package com.trism.jesica.persistence.Repository.call;

import com.trism.jesica.persistence.Entitiy.call.TbCallAll;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

public interface TbCallAllRepository extends JpaRepository<TbCallAll, Long>, JpaSpecificationExecutor<TbCallAll> {

//OS = 41 취소
//OS = 40 완료
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

    /**
     * june
     * @param searchDate
     * @return
     */
    @Query(value = "select count(*) as cnt, " +
                          "DATE_FORMAT(finish_date, '%d') as dayDate " +
            "from tb_call_all " +
            "where order_type_code = 20 " +
            "and order_pay_status = 1 " +
            "and order_status_code = 40 "+
            "and finish_date >= :searchDate AND finish_date <= LAST_DAY(:searchDate) " +
            "group by dayDate " +
            "order by finish_date "+
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
     * june
     * @param searchDate
     * @return
     */
    @Query(value = "select count(*) as cnt, " +
                          "DATE_FORMAT(cancel_date, '%d') as dayDate " +
            "from tb_call_all " +
            "where order_type_code = 20 " +
            "and (order_pay_status = 4 or order_pay_status = 5) " +
            "and order_status_code = 41 "+
            "and cancel_date >= :searchDate AND cancel_date <= LAST_DAY(:searchDate) " +
            "group by dayDate " +
            "order by cancel_date "+
            "", nativeQuery = true)
    List<Map<String,Object>> getCallAllListType2041(@Param("searchDate") String searchDate);

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
     * @return
     */
    @Query(value = "select count(*) as cnt, " +
                          "DATE_FORMAT(finish_date, '%d') as dayDate " +
            "from tb_call_all " +
            "where order_type_code = 21 " +
            "and order_pay_status = 1 " +
            "and order_status_code = 40 "+
            "and finish_date >= :searchDate AND finish_date <= LAST_DAY(:searchDate) " +
            "group by dayDate " +
            "order by finish_date "+
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
     * @return
     */
    @Query(value = "select count(*) as cnt, " +
                          "DATE_FORMAT(cancel_date, '%d') as dayDate " +
            "from tb_call_all " +
            "where order_type_code = 21 " +
            "and (order_pay_status = 4 or order_pay_status = 5) " +
            "and order_status_code = 41 " +
            "and cancel_date >= :searchDate AND cancel_date <= LAST_DAY(:searchDate) " +
            "group by dayDate " +
            "order by cancel_date " +
            "", nativeQuery = true)
    List<Map<String,Object>> getCallAllListType2141(@Param("searchDate") String searchDate);
}