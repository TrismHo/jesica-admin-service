package com.trism.jesica.persistence.mysql.Repository.goods;

import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStorePrice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbStorePriceRepository extends JpaRepository<TbStorePrice, Long>, JpaSpecificationExecutor<TbStorePrice> {

}
