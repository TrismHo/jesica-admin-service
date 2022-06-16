package com.trism.jesica.persistence.Repository.vacs;

import com.trism.jesica.persistence.Entitiy.vacs.TbVacsTotl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbVacsTotlRepository extends JpaRepository<TbVacsTotl, String>, JpaSpecificationExecutor<TbVacsTotl> {

}