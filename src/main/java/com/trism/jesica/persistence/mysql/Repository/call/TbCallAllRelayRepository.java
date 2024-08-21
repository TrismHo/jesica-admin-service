package com.trism.jesica.persistence.mysql.Repository.call;

import com.trism.jesica.persistence.mysql.Entitiy.call.TbCallAllRelay;
import com.trism.jesica.persistence.mysql.id.TbOrderGoodsOptionID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbCallAllRelayRepository extends JpaRepository<TbCallAllRelay, TbOrderGoodsOptionID>, JpaSpecificationExecutor<TbCallAllRelay> {

}
