package com.trism.jesica.persistence.mysql.Repository.manna;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaCoupon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbMannaCouponRepository extends JpaRepository<TbMannaCoupon, Long>, JpaSpecificationExecutor<TbMannaCoupon> {
}
