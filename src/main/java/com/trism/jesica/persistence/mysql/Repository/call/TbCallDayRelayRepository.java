package com.trism.jesica.persistence.mysql.Repository.call;

import com.trism.jesica.persistence.mysql.Entitiy.call.TbCallDayRelay;
import com.trism.jesica.persistence.mysql.id.TbCallRelayID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbCallDayRelayRepository extends JpaRepository<TbCallDayRelay, TbCallRelayID>, JpaSpecificationExecutor<TbCallDayRelay> {

}
