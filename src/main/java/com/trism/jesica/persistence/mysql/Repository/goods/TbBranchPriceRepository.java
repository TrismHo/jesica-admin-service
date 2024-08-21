package com.trism.jesica.persistence.mysql.Repository.goods;

import com.trism.jesica.persistence.mysql.Entitiy.goods.TbBranchPrice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbBranchPriceRepository extends JpaRepository<TbBranchPrice, Long>, JpaSpecificationExecutor<TbBranchPrice> {

}
