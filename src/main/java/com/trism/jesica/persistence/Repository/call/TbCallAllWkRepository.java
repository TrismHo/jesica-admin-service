package com.trism.jesica.persistence.Repository.call;

import com.trism.jesica.persistence.Entitiy.call.TbCallAllWk;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbCallAllWkRepository extends JpaRepository<TbCallAllWk, Long>, JpaSpecificationExecutor<TbCallAllWk> {

}