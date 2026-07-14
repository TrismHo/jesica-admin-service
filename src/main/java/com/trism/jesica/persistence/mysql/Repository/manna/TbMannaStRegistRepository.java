package com.trism.jesica.persistence.mysql.Repository.manna;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaStRegist;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface TbMannaStRegistRepository extends JpaRepository<TbMannaStRegist, String>, JpaSpecificationExecutor<TbMannaStRegist> {
    Optional<TbMannaStRegist> findByStCode(@Param("stCode") String stCode);
    Page<TbMannaStRegist> findAll(Specification<TbMannaStRegist> specification, Pageable pageable);
   /* @Query(value =
            "SELECT " +
                    "    st_code AS stCode, " +
                    "    st_name AS stName, " +
                    "    br_code AS brCode, " +
                    "    br_name AS brName, " +
                    "    insert_date AS insertDate, " +
                    "    update_date AS updateDate, " +
                    "    baemin_yn AS baeminYn, " +
                    "    coupang_yn AS coupangYn, " +
                    "    yogiyo_yn AS yogiyoYn, " +
                    "    baemin_id AS baeminId, " +
                    "    baemin_pwd AS baeminPwd " +
                    "FROM manna_st_regist a " +
                    "WHERE a.insert_date BETWEEN :startDate AND :endDate " +
                    "  AND ((:stName IS NULL OR :stName = '') OR a.st_name LIKE CONCAT('%', :stName, '%'))",
            countQuery =
                    "SELECT COUNT(1) " +
                            "FROM manna_st_regist a " +
                            "WHERE a.insert_date BETWEEN :startDate AND :endDate " +
                            "  AND ((:stName IS NULL OR :stName = '') OR a.st_name LIKE CONCAT('%', :stName, '%'))",
            nativeQuery = true)
    Page<Map<String, Object>> getMannaStRegistListPage(
            @Param("startDate") LocalDateTime startDate,
            @Param("endDate") LocalDateTime endDate,
            @Param("stName") String stName,
            Pageable pageable
    );*/
}
