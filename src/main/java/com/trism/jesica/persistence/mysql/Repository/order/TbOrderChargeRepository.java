package com.trism.jesica.persistence.mysql.Repository.order;

import com.trism.jesica.persistence.mysql.Entitiy.order.TbOrderCharge;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbOrderChargeRepository extends JpaRepository<TbOrderCharge, Long>, JpaSpecificationExecutor<TbOrderCharge> {

}
