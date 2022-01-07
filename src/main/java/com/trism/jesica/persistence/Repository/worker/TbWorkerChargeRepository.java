package com.trism.jesica.persistence.Repository.worker;

import com.trism.jesica.persistence.Entitiy.worker.TbWorkerCharge;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbWorkerChargeRepository extends JpaRepository<TbWorkerCharge, Integer>, JpaSpecificationExecutor<TbWorkerCharge> {

}