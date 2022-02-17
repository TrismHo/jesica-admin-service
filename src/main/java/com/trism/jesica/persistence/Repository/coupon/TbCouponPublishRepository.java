package com.trism.jesica.persistence.Repository.coupon;

import com.trism.jesica.persistence.Entitiy.coupon.TbCouponPublish;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

public interface TbCouponPublishRepository extends JpaRepository<TbCouponPublish, Long>, JpaSpecificationExecutor<TbCouponPublish> {

    @Query(value = "select  " +
            "tc.cust_no as custNo, " +
            "tc.cust_name as custName, " +
            "tc.login_id as loginId, " +
            "tc.cust_tel as custTel, " +
            "tcp.insert_date as insertDate, " +
            "tcp.expire_date as expireDate, " +
            "tcp.use_date as useDate " +
            "from tb_coupon_publish as tcp " +
            "inner join tb_cust as tc " +
            "where tcp.cust_no = tc.cust_no and tcp.coupon_no = :couponNo and tcp.use_date is null " +
            "order by tcp.insert_date asc", nativeQuery = true)
    List<Map<String, Object>> findByCouponNoUnUsed(@Param("couponNo") Long couponNo);

    @Query(value = "select  " +
            "tc.cust_no as custNo, " +
            "tc.cust_name as custName, " +
            "tc.login_id as loginId, " +
            "tc.cust_tel as custTel, " +
            "tcp.insert_date as insertDate, " +
            "tcp.expire_date as expireDate, " +
            "tcp.use_date as useDate " +
            "from tb_coupon_publish as tcp " +
            "inner join tb_cust as tc " +
            "where tcp.cust_no = tc.cust_no and tcp.coupon_no = :couponNo and tcp.use_date is not null " +
            "order by tcp.insert_date asc", nativeQuery = true)
    List<Map<String, Object>> findByCouponNoUsed(@Param("couponNo") Long couponNo);
}