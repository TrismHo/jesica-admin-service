package com.trism.jesica.persistence.mysql.Repository.vacs;

import com.trism.jesica.persistence.mysql.Entitiy.vacs.TbVacsErrlog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbVacsErrlogRepository extends JpaRepository<TbVacsErrlog, Long>, JpaSpecificationExecutor<TbVacsErrlog> {

}
