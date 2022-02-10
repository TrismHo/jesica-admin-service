package com.trism.jesica.persistence.Repository.coupon;

import com.trism.jesica.persistence.Entitiy.coupon.TbCouponPublish;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

public interface TbCouponPublishRepository extends JpaRepository<TbCouponPublish, Long>, JpaSpecificationExecutor<TbCouponPublish> {

    @Query(value = "select * " +
            "from tb_coupon_publish as tcp " +
            "inner join tb_cust as tc " +
            "where tcp.cust_no = tc.cust_no and tcp.coupon_no = :couponNo " +
            "order by tcp.insert_date asc", nativeQuery = true)
    List<Map<String, Object>> findByCouponNo(@Param("couponNo") Long couponNo);
}