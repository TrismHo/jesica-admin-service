package com.trism.jesica.persistence.Repository.call;

import com.trism.jesica.persistence.Entitiy.call.TbCallDayWk;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbCallDayWkRepository extends JpaRepository<TbCallDayWk, Long>, JpaSpecificationExecutor<TbCallDayWk> {

}