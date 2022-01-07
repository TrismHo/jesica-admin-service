package com.trism.jesica.persistence.Repository.goods;

import com.trism.jesica.persistence.Entitiy.goods.TbStoreCharge;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbStoreChargeRepository extends JpaRepository<TbStoreCharge, Long>, JpaSpecificationExecutor<TbStoreCharge> {

}