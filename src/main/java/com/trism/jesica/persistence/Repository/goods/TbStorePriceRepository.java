package com.trism.jesica.persistence.Repository.goods;

import com.trism.jesica.persistence.Entitiy.goods.TbStorePrice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbStorePriceRepository extends JpaRepository<TbStorePrice, Long>, JpaSpecificationExecutor<TbStorePrice> {

}