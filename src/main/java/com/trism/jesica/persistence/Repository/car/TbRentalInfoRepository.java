package com.trism.jesica.persistence.Repository.car;

import com.trism.jesica.persistence.Entitiy.car.TbRentalInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

public interface TbRentalInfoRepository extends JpaRepository<TbRentalInfo, Long>, JpaSpecificationExecutor<TbRentalInfo> {
    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_rental_info " +
            "set safen_num = :safenNum " +
            "where rental_no = :rentalNo " +
            "", nativeQuery = true)
    int updateSafenNum(@Param("rentalNo") Integer rentalNo , @Param("safenNum") String safenNum);

    @Query(value = "SELECT  " +
            "  t1.yyyymmdd AS dayDate,  " +
            "  IFNULL(t2.rentCnt, 0) AS rentCnt,  " +
            "  IFNULL(t2.safenCnt, 0) AS safenCnt,  " +
            "  t1.takeoverCnt,  " +
            "  t1.returnCnt,  " +
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
    List<Map<String,Object>> getSafenNumberListAll(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate
    );

    @Query(value = "SELECT  " +
            "  t1.yyyymmdd AS dayDate,  " +
            "  IFNULL(t2.rentCnt, 0) AS rentCnt,  " +
            "  IFNULL(t2.safenCnt, 0) AS safenCnt,  " +
            "  t1.takeoverCnt,  " +
            "  t1.returnCnt,  " +
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
            "    and IFNULL(finish_date, cancel_date) BETWEEN :startDate AND :endDate " +
            "    and store_no = :storeNo " +
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
    List<Map<String,Object>> getSafenNumberList(@Param("storeNo") String storeNo, @Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate
    );
}