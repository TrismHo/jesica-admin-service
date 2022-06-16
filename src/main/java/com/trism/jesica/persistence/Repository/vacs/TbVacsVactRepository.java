package com.trism.jesica.persistence.Repository.vacs;

import com.trism.jesica.persistence.Entitiy.vacs.TbVacsVact;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbVacsVactRepository extends JpaRepository<TbVacsVact, String>, JpaSpecificationExecutor<TbVacsVact> {
    List<TbVacsVact> findByBankCdAndAcctSt(String bankCd, String acctSt);

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_vacs_vact set " +
            "acct_st = :acctSt, " +
            "open_il = :openLi " +
            "where acct_no = :acctNo " +
            "and bank_cd = :bankCd", nativeQuery = true)
    int updateAcctst(
            @Param("acctSt") String acctSt,
            @Param("acctNo") String acctNo,
            @Param("bankCd") String bankCd,
            @Param("openLi") String openLi
    );

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_vacs_vact set " +
            "acct_st = :acctSt, " +
            "close_il = :closeLi " +
            "where acct_no = :acctNo " +
            "and bank_cd = :bankCd", nativeQuery = true)
    int updateAcctstClose(
            @Param("acctSt") String acctSt,
            @Param("acctNo") String acctNo,
            @Param("bankCd") String bankCd,
            @Param("closeLi") String closeLi
    );
}