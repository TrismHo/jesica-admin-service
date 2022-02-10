package com.trism.jesica.persistence.Repository.coupon;

import com.trism.jesica.persistence.Entitiy.coupon.TbCoupon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbCouponRepository extends JpaRepository<TbCoupon, Long>, JpaSpecificationExecutor<TbCoupon> {

}