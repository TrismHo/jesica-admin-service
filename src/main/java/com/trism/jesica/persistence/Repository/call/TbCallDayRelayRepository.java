package com.trism.jesica.persistence.Repository.call;

import com.trism.jesica.persistence.Entitiy.call.TbCallDayRelay;
import com.trism.jesica.persistence.id.TbCallRelayID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbCallDayRelayRepository extends JpaRepository<TbCallDayRelay, TbCallRelayID>, JpaSpecificationExecutor<TbCallDayRelay> {

}