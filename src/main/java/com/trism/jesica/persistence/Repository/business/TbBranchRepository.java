package com.trism.jesica.persistence.Repository.business;

import com.trism.jesica.dto.TbBranchDTO;
import com.trism.jesica.dto.TbStoreDTO;
import com.trism.jesica.persistence.Entitiy.business.TbBranch;
import com.trism.jesica.persistence.Repository.querydsl.business.TbBranchRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

public interface TbBranchRepository extends JpaRepository<TbBranch, Long>, JpaSpecificationExecutor<TbBranch>, TbBranchRepositorySupport {
    @Modifying(clearAutomatically = true)
    @Query(value = "insert into tb_branch " +
            "( " +
            "insert_date " +
            ",insert_user_id " +
            ",update_date " +
            ",data_status " +
            ",service_yn " +
            ",dlvy_no " +
            ",branch_name " +
            ",branch_tel " +
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
            ",actual_owner " +
            ",actual_addr" +
            ",actual_tel) " +
            "value " +
            "(now() " +
            ",:insertUserId" +
            ",null" +
            ",:dataStatus" +
            ",:serviceYn " +
            ",:dlvyNo " +
            ",:branchName " +
            ",:branchTel " +
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
            ",:actualOwner " +
            ",:actualAddr " +
            ",:actualTel) " +
            "", nativeQuery = true)
    int insertTbBranch(@Param("insertUserId") Integer insertUserId,
                     @Param("dataStatus") Integer dataStatus,
                     @Param("serviceYn") Integer serviceYn,
                     @Param("dlvyNo") Integer dlvyNo,
                     @Param("branchName") String branchName,
                     @Param("branchTel") String branchTel,
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
                     @Param("actualOwner") String actualOwner,
                     @Param("actualAddr") String actualAddr,
                     @Param("actualTel") String actualTel
    );

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_branch set " +
            "update_user_id = :updateUserId, " +
            "update_date = now(), " +
            "data_status = :dataStatus, " +
            "service_yn = :serviceYn, " +
            "dlvy_no = :dlvyNo, " +
            "branch_name = :branchName, " +
            "branch_tel = :branchTel, " +
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
            "actual_owner = :actualOwner, " +
            "actual_addr = :actualAddr, " +
            "actual_tel = :actualTel " +
            "where branch_no = :branchNo", nativeQuery = true)
    int updateTbBranch(
            @Param("branchNo") Long branchNo,
            @Param("updateUserId") Integer updateUserId,
            @Param("dataStatus") Integer dataStatus,
            @Param("serviceYn") Integer serviceYn,
            @Param("dlvyNo") Integer dlvyNo,
            @Param("branchName") String branchName,
            @Param("branchTel") String branchTel,
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
            @Param("actualOwner") String actualOwner,
            @Param("actualAddr") String actualAddr,
            @Param("actualTel") String actualTel
    );

    @Query(value = "select branch_no as branchNo, " +
            "branch_name as branchName, " +
            "branch_tel as branchTel, " +
            "head_no as headNo " +
            "from tb_branch " +
            "where branch_name like :branchName " +
            "and data_status != 0 " +
            "and head_no = :headNo", nativeQuery = true)
    List<TbBranchDTO> findByBranchName(@Param("branchName") String branchName , @Param("headNo") Long headNo);

    @Query(value = "select branch_no as branchNo, " +
            "branch_name as branchName, " +
            "branch_tel as branchTel, " +
            "head_no as headNo " +
            "from tb_branch " +
            "where data_status != 0 " +
            "and head_no = :headNo", nativeQuery = true)
    List<TbBranchDTO> findByHeadNo(@Param("headNo") Long headNo);

    @Query(value = "select branch_no as branchNo, " +
            "branch_name as branchName, " +
            "branch_tel as branchTel " +
            "from tb_branch " +
            "where data_status != 0 " +
            "and head_no = :headNo", nativeQuery = true)
    List<TbBranchDTO> findByAll(@Param("headNo") Long headNo);

    @Query(value = "select branch_no as branchNo, " +
            "branch_name as branchName, " +
            "branch_tel as branchTel " +
            "from tb_branch " +
            "where data_status != 0 " +
            "", nativeQuery = true)
    List<TbBranchDTO> findByAll();

    @Query(value = "select " +
            "(select count(*) from tb_head where data_status= 1) as count_live_head " +
            ",(select count(*) from tb_head where data_status= 2) as count_stop_head " +
            ",(select count(*) from tb_branch where data_status= 1) as count_live_branch " +
            ",(select count(*) from tb_branch where data_status= 2) as count_stop_branch " +
            ",(select count(*) from tb_store where data_status = 1) as count_live_store " +
            ",(select count(*) from tb_store where data_status = 2) as count_stop_store " +
            "from dual", nativeQuery = true)
    Map<String,Object> countChart();

    @Query(value = "select store_no as storeNo, store_name as storeName ,sum(total_amt) as totalAmt from tb_order_day group by store_no order by totalAmt desc LIMIT 6" +
            "", nativeQuery = true)
    List<Map<String,Object>> getMaxSellChart();

    @Query(value = "select count(store_no) as cnt" +
            ",store_no as storeNo " +
            ", order_no as orderNo, " +
            "goods_name as goodsName, " +
            "SUM(total_amt) as totalAmt " +
            "from tb_order_all_goods " +
            "group by store_goods_no " +
            "order by cnt desc " +
            "limit 5" +
            "", nativeQuery = true)
    List<Map<String,Object>> getMaxGoodsChart();

    @Query(value = "select count(worker_no) as cnt " +
            ", worker_name as workerName " +
            ", store_name as storeName " +
            ", SUM(total_amt) as totalAmt  " +
            "from tb_order_all " +
            "group by worker_no  " +
            "order by cnt desc " +
            "limit 5" +
            "", nativeQuery = true)
    List<Map<String,Object>> getMaxDlvyManChart();

    @Query(value = "select branch_no as branchNo, " +
            "branch_name as branchName, " +
            "branch_tel as branchTel, " +
            "head_no as headNo " +
            "(select head_name  from tb_head where head_no = headNo) as headName " +
            "from tb_branch " +
            "where branch_name like :branchName " +
            "and data_status != 0 " +
            "", nativeQuery = true)
    List<TbStoreDTO> findByBranchNameLike(@Param("branchName") String branchName);

    @Query(value = "select  " +
            "head_no as headNo, " +
            "branch_no as branchNo, " +
            "branch_name as branchName, " +
            "(select head_name  from tb_head where head_no = headNo) as headName " +
            "from tb_branch " +
            "where data_status != 0 ", nativeQuery = true)
    List<TbStoreDTO> findByBranchNameAll(@Param("branchName") String branchName);

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_branch set " +
            "cybank_type_code = :cybankTypeCode, " +
            "cybank_account = :cybankAccount, " +
            "cybank_owner = :cybankOwner " +
            "where branch_no = :branchNo", nativeQuery = true)
    int setCyAccountSet(
            @Param("cybankTypeCode") String cybankTypeCode,
            @Param("cybankAccount") String cybankAccount,
            @Param("cybankOwner") String cybankOwner,
            @Param("branchNo") Long branchNo
    );
}
