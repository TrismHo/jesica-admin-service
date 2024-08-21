package com.trism.jesica.persistence.mysql.Repository.call;

import com.trism.jesica.persistence.mysql.Entitiy.call.TbCallDayWk;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbCallDayWkRepository extends JpaRepository<TbCallDayWk, Long>, JpaSpecificationExecutor<TbCallDayWk> {

}
