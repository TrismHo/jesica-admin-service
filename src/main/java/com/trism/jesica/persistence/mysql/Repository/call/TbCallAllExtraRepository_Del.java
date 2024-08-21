package com.trism.jesica.persistence.mysql.Repository.call;

import com.trism.jesica.persistence.mysql.Entitiy.call.TbCallAllExtra_Del;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbCallAllExtraRepository_Del extends JpaRepository<TbCallAllExtra_Del, Long>, JpaSpecificationExecutor<TbCallAllExtra_Del> {

}
