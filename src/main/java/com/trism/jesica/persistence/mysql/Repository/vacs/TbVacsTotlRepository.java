package com.trism.jesica.persistence.mysql.Repository.vacs;

import com.trism.jesica.persistence.mysql.Entitiy.vacs.TbVacsTotl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbVacsTotlRepository extends JpaRepository<TbVacsTotl, String>, JpaSpecificationExecutor<TbVacsTotl> {

}
