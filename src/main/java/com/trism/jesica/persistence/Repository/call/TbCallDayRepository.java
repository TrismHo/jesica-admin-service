package com.trism.jesica.persistence.Repository.call;

import com.trism.jesica.persistence.Entitiy.call.TbCallDay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbCallDayRepository extends JpaRepository<TbCallDay, Long>, JpaSpecificationExecutor<TbCallDay> {

}