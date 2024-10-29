package com.trism.jesica.persistence.mysql.Repository.system;

import com.trism.jesica.persistence.mysql.Entitiy.system.TbSystemCode;
import com.trism.jesica.persistence.mysql.Repository.querydsl.system.TbSystemCodeRepositorySupport;
import com.trism.jesica.persistence.mysql.type.DataStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


public interface TbSystemCodeRepository extends JpaRepository<TbSystemCode, String>, JpaSpecificationExecutor<TbSystemCode>, TbSystemCodeRepositorySupport {
    List<TbSystemCode> findBySysType(@Param("sysType") String sysType);
    List<TbSystemCode> findBySysTypeAndDataStatusOrderByViewOrderAsc(@Param("sysType") String sysType,@Param("dataStatus") DataStatus dataStatus);
    List<TbSystemCode> findBySysTypeAndSysCodeLikeAndDataStatus(@Param("sysType") String sysType,@Param("sysCode") String sysCode,@Param("dataStatus") DataStatus dataStatus);
    TbSystemCode findBySysTypeAndSysCode(@Param("sysType") String sysType, @Param("sysCode") String sysCode);

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_system_code set " +
            /*"sys_code = :sysCode " +*/
            "sys_name = :sysName " +
            ",code_name = :codeName " +
            ",code_value = :codeValue " +
            ",memo = :memo " +
            ",update_date = now() " +
            "where sys_type = :sysType " +
            "and sys_code= :sysCode", nativeQuery = true)
    int update(@Param("sysCode") String sysCode,
               @Param("sysName") String sysName,
               @Param("codeName") String codeName,
               @Param("codeValue") String codeValue,
               @Param("sysType") String sysType,
               @Param("memo") String memo
    );
}
