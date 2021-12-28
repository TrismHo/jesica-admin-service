package com.trism.jesica.persistence.Repository.call;

import com.trism.jesica.persistence.Entitiy.call.TbCallCharge;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbCallChargeRepository extends JpaRepository<TbCallCharge, Long>, JpaSpecificationExecutor<TbCallCharge> {

}