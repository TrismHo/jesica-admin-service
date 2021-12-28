package com.trism.jesica.persistence.Repository.call;

import com.trism.jesica.persistence.Entitiy.call.TbCallAllExtra;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbCallAllExtraRepository extends JpaRepository<TbCallAllExtra, Long>, JpaSpecificationExecutor<TbCallAllExtra> {

}