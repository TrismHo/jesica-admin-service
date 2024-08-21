package com.trism.jesica.persistence.mysql.Repository.manna;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaCouponRegist;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface TbMannaCouponRegistRepository extends JpaRepository<TbMannaCouponRegist, Long>, JpaSpecificationExecutor<TbMannaCouponRegist> {

    Page<TbMannaCouponRegist> findAll(Specification<TbMannaCouponRegist> specification, Pageable pageable);

    /*@Query(value = "select "+
            "", nativeQuery = true)
    List<Map<String,Object>> getMembershipCouponInfo(@Param("searchDate") String searchDate);*/
    Optional<TbMannaCouponRegist> findByPublishNo(@Param("publishNo") Long publishNo);
}
