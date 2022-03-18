package com.trism.jesica.persistence.Repository.system;

import com.trism.jesica.persistence.Entitiy.system.TbServiceProperty;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbServicePropertyRepository extends JpaRepository<TbServiceProperty, String>, JpaSpecificationExecutor<TbServiceProperty> {

}