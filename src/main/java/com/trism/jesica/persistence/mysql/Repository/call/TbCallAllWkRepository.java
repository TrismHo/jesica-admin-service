package com.trism.jesica.persistence.mysql.Repository.call;

import com.trism.jesica.persistence.mysql.Entitiy.call.TbCallAllWk;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbCallAllWkRepository extends JpaRepository<TbCallAllWk, Long>, JpaSpecificationExecutor<TbCallAllWk> {

}
