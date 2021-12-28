package com.trism.jesica.persistence.Repository.event;

import com.trism.jesica.persistence.Entitiy.event.TbEvent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbEventRepository extends JpaRepository<TbEvent, Long>, JpaSpecificationExecutor<TbEvent> {

}