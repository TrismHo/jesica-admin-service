package com.trism.jesica.persistence.mysql.Repository.vacs;

import com.trism.jesica.persistence.mysql.Entitiy.vacs.TbVacsAhst;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbVacsAhstRepository extends JpaRepository<TbVacsAhst, String>, JpaSpecificationExecutor<TbVacsAhst> {

}
