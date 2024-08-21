package com.trism.jesica.persistence.mysql.Repository.goods;

import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreCharge;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbStoreChargeRepository extends JpaRepository<TbStoreCharge, Long>, JpaSpecificationExecutor<TbStoreCharge> {

}
