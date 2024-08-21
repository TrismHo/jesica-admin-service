package com.trism.jesica.persistence.mysql.Repository.worker;

import com.trism.jesica.persistence.mysql.Entitiy.worker.TbWorkerCharge;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TbWorkerChargeRepository extends JpaRepository<TbWorkerCharge, Integer>, JpaSpecificationExecutor<TbWorkerCharge> {

    @Modifying
    @Query(value = " " +
            "delete from tb_worker_charge " +
            "where worker_no in (select a.worker_no from tb_worker_apply a " +
            "where phone = :phone) "+
            "", nativeQuery = true)
    int deleteWorkerCharge(@Param("phone") String phone);
}
