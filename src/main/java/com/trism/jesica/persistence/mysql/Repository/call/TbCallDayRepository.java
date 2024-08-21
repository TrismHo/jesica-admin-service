package com.trism.jesica.persistence.mysql.Repository.call;

import com.trism.jesica.persistence.mysql.Entitiy.call.TbCallDay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbCallDayRepository extends JpaRepository<TbCallDay, Long>, JpaSpecificationExecutor<TbCallDay> {

}
