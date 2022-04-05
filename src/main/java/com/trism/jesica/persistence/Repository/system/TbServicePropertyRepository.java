package com.trism.jesica.persistence.Repository.system;

import com.trism.jesica.persistence.Entitiy.system.TbServiceProperty;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TbServicePropertyRepository extends JpaRepository<TbServiceProperty, String>, JpaSpecificationExecutor<TbServiceProperty> {

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_service_property set " +
            "prop_value = :propValue " +
            ",memo = :memo " +
            ",update_date = now() " +
            "where prop_name = :propName", nativeQuery = true)
    int update(@Param("propName") String propName,
               @Param("propValue") String propValue,
               @Param("memo") String memo
     );
}