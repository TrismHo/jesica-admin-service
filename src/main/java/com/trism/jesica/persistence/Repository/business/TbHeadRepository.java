package com.trism.jesica.persistence.Repository.business;

/*import com.trism.manna.dto.TbHeadDTO;*/
import com.trism.jesica.dto.TbHeadDTO;
import com.trism.jesica.persistence.Entitiy.business.TbHead;
import com.trism.jesica.persistence.Repository.querydsl.business.TbHeadRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbHeadRepository extends JpaRepository<TbHead, Long>, JpaSpecificationExecutor<TbHead>, TbHeadRepositorySupport {


    @Query(value = "select head_no as headNo, " +
                "head_name as headName, " +
                "head_tel as headTel " +
            "from tb_head " +
            "where head_name like :headName " +
            "and data_status != 0", nativeQuery = true)
    List<TbHeadDTO> findByHeadName(@Param("headName") String headName);

    @Query(value = "select head_no as headNo, " +
                "head_name as headName, " +
                "head_tel as headTel " +
            "from tb_head " +
            "where head_no = :headNo " +
            "and data_status != 0", nativeQuery = true)
    List<TbHeadDTO> findByHeadNo(@Param("headNo") Long headNo);

    @Query(value = "select head_no as headNo, " +
                "head_name as headName, " +
                "head_tel as headTel " +
            "from tb_head " +
            "where data_status != 0", nativeQuery = true)
    List<TbHeadDTO> findByAll();

   /* @Modifying(clearAutomatically = true)
    @Query(value = "insert into tb_head " +
            "( " +
            "insert_date " +
            ",insert_user_id " +
            ",update_date " +
            ",data_status " +
            ",service_yn " +
            ",brand_no " +
            ",head_name " +
            ",head_tel " +
            ",auth_tel " +
            ",deposit " +
            ",cash " +
            ",cash_default " +
            ",memo_service " +
            ",memo_area " +
            ",memo_etc " +
            ",cybank_type_code " +
            ",cybank_account " +
            ",pin_num " +
            ",bank_type_code " +
            ",bank_account " +
            ",bank_owner " +
            ",dlvy_mng_yn " +
            ",actual_owner " +
            ",actual_addr" +
            ",actual_tel) " +
            "value " +
            "(now() " +
            ",:insertUserId" +
            ",null" +
            ",:dataStatus" +
            ",:serviceYn " +
            ",:brandNo " +
            ",:headName " +
            ",:headTel " +
            ",:authTel " +
            ",:deposit " +
            ",:cash " +
            ",:cashDefault " +
            ",:memoService " +
            ",:memoArea " +
            ",:memoEtc " +
            ",:cybankTypeCode " +
            ",:cybankAccount " +
            ",:pinNum " +
            ",:bankTypeCode " +
            ",:bankAccount " +
            ",:bankOwner " +
            ",:dlvyMngYn " +
            ",:actualOwner " +
            ",:actualAddr " +
            ",:actualTel) " +
            "", nativeQuery = true)
    int insertTbHead(@Param("insertUserId") Integer insertUserId,
               @Param("dataStatus") Integer dataStatus,
               @Param("serviceYn") Integer serviceYn,
               @Param("brandNo") Integer brandNo,
               @Param("headName") String headName,
               @Param("headTel") String headTel,
               @Param("authTel") String authTel,
               @Param("deposit") Integer deposit,
               @Param("cash") Integer cash,
               @Param("cashDefault") Integer cashDefault,
               @Param("memoService") String memoService,
               @Param("memoArea") String memoArea,
               @Param("memoEtc") String memoEtc,
               @Param("cybankTypeCode") String cybankTypeCode,
               @Param("cybankAccount") String cybankAccount,
               @Param("pinNum") String pinNum,
               @Param("bankTypeCode") String bankTypeCode,
               @Param("bankAccount") String bankAccount,
               @Param("bankOwner") String bankOwner,
               @Param("dlvyMngYn") Integer dlvyMngYn,
               @Param("actualOwner") String actualOwner,
               @Param("actualAddr") String actualAddr,
               @Param("actualTel") String actualTel
    );*/

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_head set " +
            "update_user_id = :updateUserId, " +
            "update_date = now(), " +
            "data_status = :dataStatus, " +
            "service_yn = :serviceYn, " +
            "brand_no = :brandNo, " +
            "head_name = :headName, " +
            "head_tel = :headTel, " +
            "auth_tel = :authTel, " +
            "deposit = :deposit, " +
            "cash = :cash, " +
            "cash_default = :cashDefault, " +
            "memo_service = :memoService, " +
            "memo_area = :memoArea, " +
            "memo_etc = :memoEtc, " +
            "cybank_type_code = :cybankTypeCode, " +
            "cybank_account = :cybankAccount, " +
            "pin_num = :pinNum, " +
            "bank_type_code = :bankTypeCode, " +
            "bank_account = :bankAccount, " +
            "bank_owner = :bankOwner, " +
            "dlvy_mng_yn = :dlvyMngYn, " +
            "actual_owner = :actualOwner, " +
            "actual_addr = :actualAddr, " +
            "actual_tel = :actualTel " +
            "where head_no = :headNo", nativeQuery = true)
    int updateTbHead(
                @Param("headNo") Long headNo,
                @Param("updateUserId") Integer updateUserId,
                @Param("dataStatus") Integer dataStatus,
                @Param("serviceYn") Integer serviceYn,
                @Param("brandNo") Integer brandNo,
                @Param("headName") String headName,
                @Param("headTel") String headTel,
                @Param("authTel") String authTel,
                @Param("deposit") Integer deposit,
                @Param("cash") Integer cash,
                @Param("cashDefault") Integer cashDefault,
                @Param("memoService") String memoService,
                @Param("memoArea") String memoArea,
                @Param("memoEtc") String memoEtc,
                @Param("cybankTypeCode") String cybankTypeCode,
                @Param("cybankAccount") String cybankAccount,
                @Param("pinNum") String pinNum,
                @Param("bankTypeCode") String bankTypeCode,
                @Param("bankAccount") String bankAccount,
                @Param("bankOwner") String bankOwner,
                @Param("dlvyMngYn") Integer dlvyMngYn,
                @Param("actualOwner") String actualOwner,
                @Param("actualAddr") String actualAddr,
                @Param("actualTel") String actualTel
        );
}
