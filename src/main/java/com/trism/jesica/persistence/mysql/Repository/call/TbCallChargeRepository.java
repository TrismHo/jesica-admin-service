package com.trism.jesica.persistence.mysql.Repository.call;

import com.trism.jesica.persistence.mysql.Entitiy.call.TbCallCharge;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbCallChargeRepository extends JpaRepository<TbCallCharge, Long>, JpaSpecificationExecutor<TbCallCharge> {

}
