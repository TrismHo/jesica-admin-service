package com.trism.jesica.persistence.Repository.call;

import com.trism.jesica.persistence.Entitiy.call.TbCallAllRelay;
import com.trism.jesica.persistence.id.TbOrderGoodsOptionID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbCallAllRelayRepository extends JpaRepository<TbCallAllRelay, TbOrderGoodsOptionID>, JpaSpecificationExecutor<TbCallAllRelay> {

}