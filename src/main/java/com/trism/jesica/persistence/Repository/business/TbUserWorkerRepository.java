package com.trism.jesica.persistence.Repository.business;

/*import com.trism.manna.dto.TbHeadDTO;*/

import com.trism.jesica.persistence.Entitiy.business.TbUserWorker;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;


public interface TbUserWorkerRepository extends JpaRepository<TbUserWorker, Long>, JpaSpecificationExecutor<TbUserWorker> {

    @Modifying(clearAutomatically = true)
    @Query(value = " insert " +
            "        into" +
            "            tb_user_worker" +
            "            (branch_no, " +
            "data_status, " +
            "head_no, " +
            "license_exp_date, " +
            "license_file, " +
            "license_num, " +
            "license_type, " +
            "name, " +
            "phone, " +
            "profile_file, " +
            "profile_file_small, " +
            "join_date, " +
            "store_no, " +
            "worker_no) " +
            "        values" +
            "            (:branchNo, " +
            ":dataStatus, " +
            ":headNo, " +
            ":licenseExpDate, " +
            ":licenseFile, " +
            ":licenseNum, " +
            ":licenseType, " +
            ":name, " +
            ":phone, " +
            ":profileFile, " +
            ":profileFileSmall, " +
            ":joinDate, " +
            ":storeNo, " +
            ":workerNo); "+
            "", nativeQuery = true)
    int saveUserWorker(
            @Param("workerNo") Long workerNo,
            @Param("name") String name,
            @Param("phone") String phone,
            @Param("dataStatus") Integer dataStatus,
            @Param("licenseFile") String licenseFile,
            @Param("licenseType") String licenseType,
            @Param("licenseExpDate") String licenseExpDate,
            @Param("licenseNum") String licenseNum,
            @Param("profileFile") String profileFile,
            @Param("profileFileSmall") String profileFileSmall,
            @Param("joinDate") String joinDate,
            @Param("headNo") Integer headNo,
            @Param("branchNo") Integer branchNo,
            @Param("storeNo") Integer storeNo
    );

    @Modifying(clearAutomatically = true)
    @Query(value = " UPDATE tb_user_worker " +
            " SET " +
            " update_date= now(), " +
            " data_status= :dataStatus, " +
            " attend_status= :attendStatus, " +
            " block_type_code= :blockTypeCode, " +
            " head_no= :headNo, " +
            " store_no= :storeNo, " +
            " branch_no= :branchNo, " +
            " name= :name, " +
            " phone= :phone, " +
            " gender= :gender, " +
            " regist_num= :registNum, " +
            " branch_no= :branchNo, " +
            " join_date= :joinDate, " +
            " retire_date= :retireDate, " +
            " addr= :addr, " +
            " deposit= :deposit, " +
            " cash= :cash, " +
            " cash_default= :cashDefault, " +
            " cybank_type_code= :cybankTypeCode, " +
            " cybank_account= :cybankAccount, " +
            " pin_num= :pinNum, " +
            " bank_type_code= :bankTypeCode, " +
            " bank_account= :bankAccount, " +
            " bank_owner= :bankOwner, " +
            " profile_file= :profileFile, " +
            " profile_file_small= :profileFileSmall, " +
            " license_file= :licenseFile, " +
            " license_num= :licenseNum, " +
            " license_type= :licenseType, " +
            " license_exp_date= :licenseExpDate, " +
            " license_exp_yn= :licenseExpYn, " +
            " memo= :memo, " +
            " worker_pay_type= :workerPayType " +
            " WHERE worker_no = :workerNo" +
            "", nativeQuery = true)
    int updateUserWorker(
            @Param("workerNo") Long workerNo,
            @Param("dataStatus") Integer dataStatus,
            @Param("attendStatus") Integer attendStatus,
            @Param("blockTypeCode") String blockTypeCode,
            @Param("headNo") Integer headNo,
            @Param("storeNo") Integer storeNo,
            @Param("branchNo") Integer branchNo,
            @Param("name") String name,
            @Param("phone") String phone,
            @Param("gender") String gender,
            @Param("registNum") String registNum,
            @Param("joinDate") String joinDate,
            @Param("retireDate") String retireDate,
            @Param("addr") String addr,
            @Param("deposit") Integer deposit,
            @Param("cash") Integer cash,
            @Param("cashDefault") Integer cashDefault,
            @Param("cybankTypeCode") String cybankTypeCode,
            @Param("cybankAccount") String cybankAccount,
            @Param("pinNum") String pinNum,
            @Param("bankTypeCode") String bankTypeCode,
            @Param("bankAccount") String bankAccount,
            @Param("bankOwner") String bankOwner,
            @Param("profileFile") String profileFile,
            @Param("profileFileSmall") String profileFileSmall,
            @Param("licenseFile") String licenseFile,
            @Param("licenseNum") String licenseNum,
            @Param("licenseType") String licenseType,
            @Param("licenseExpDate") String licenseExpDate,
            @Param("licenseExpYn") Integer licenseExpYn,
            @Param("memo") String memo,
            @Param("workerPayType") Integer workerPayType
    );


    @Query(value = "select count(worker_no) as cnt " +
            "from tb_user_worker " +
            "where data_status = 1 "+
            "order by cnt desc "+
            "", nativeQuery = true)
    List<Map<String,Object>> getUserWorkerChart();
}
