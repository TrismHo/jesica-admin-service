package com.trism.jesica.persistence.Repository.call;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import com.trism.jesica.persistence.Entitiy.call.TbCallDayExtra;

public interface TbCallDayExtraRepository extends JpaRepository<TbCallDayExtra, Long>, JpaSpecificationExecutor<TbCallDayExtra> {

}