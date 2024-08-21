package com.trism.jesica.persistence.mysql.Repository.storedlvy;

import com.trism.jesica.persistence.mysql.Entitiy.storedlvy.TbStoreDlvyCharge;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TbStoreDlvyChargeRepository extends JpaRepository<TbStoreDlvyCharge, Long>, JpaSpecificationExecutor<TbStoreDlvyCharge> {

    @Modifying(clearAutomatically = true)
    @Query(value = "insert into tb_store_dlvy_charge " +
            "( " +
            "store_no "+
            ") "+
            "value " +
            "( " +
            ":storeNo " +
            ") " +
            "", nativeQuery = true)
    int saveDefault(@Param("storeNo") Long storeNo);
}
