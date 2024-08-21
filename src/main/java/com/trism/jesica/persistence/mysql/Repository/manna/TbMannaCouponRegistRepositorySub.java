package com.trism.jesica.persistence.mysql.Repository.manna;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaCouponRegistSub;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbMannaCouponRegistRepositorySub extends JpaRepository<TbMannaCouponRegistSub, Long>, JpaSpecificationExecutor<TbMannaCouponRegistSub> {

    Page<TbMannaCouponRegistSub> findAll(Specification<TbMannaCouponRegistSub> specification, Pageable pageable);


    /*@Query(value = "select "+
            "", nativeQuery = true)
    List<Map<String,Object>> getMembershipCouponInfo(@Param("searchDate") String searchDate);*/
}
