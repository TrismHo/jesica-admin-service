package com.trism.jesica.persistence.Repository.vacs;

import com.trism.jesica.persistence.Entitiy.vacs.TbVacsAhst;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbVacsAhstRepository extends JpaRepository<TbVacsAhst, String>, JpaSpecificationExecutor<TbVacsAhst> {

}