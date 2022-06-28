package com.trism.jesica.persistence.Repository.business;

import com.trism.jesica.dto.TbStoreDTO;
import com.trism.jesica.persistence.Entitiy.business.TbStore;
import com.trism.jesica.persistence.Repository.querydsl.business.TbStoreRepositorySupport;
import com.trism.jesica.persistence.type.ServiceType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public interface TbStoreRepository extends JpaRepository<TbStore, Long>, JpaSpecificationExecutor<TbStore>, TbStoreRepositorySupport {


    @Modifying(clearAutomatically = true)
    @Query(value = "insert into tb_store " +
            "( " +
            "insert_date " +
            ",insert_user_id " +
            ",update_date " +
            ",data_status " +
            ",service_yn " +
            ",head_no " +
            ",branch_no " +
            ",master_yn " +
            ",auth_tel " +
            ",deposit " +
            ",cash " +
            ",cash_default " +
            ",store_name " +
            ",store_name_inapp " +
            ",store_tel " +
            ",store_intro " +
            ",cybank_type_code " +
            ",cybank_account " +
            ",pin_num " +
            ",bank_type_code " +
            ",bank_account " +
            ",bank_owner " +
            ",mngr_name " +
            ",memo " +
            ",allday_open_yn " +
            ",store_type " +
            ",poi " +
            ",lat " +
            ",lng " +
            ",addr_1" +
            ",addr_2" +
            ",addr_3" +
            ",addr_4" +
            ",addr_5" +
            ",img_file_small" +
            ",img_file_1) " +
            "values " +
            "(now() " +
            ",:insertUserId" +
            ",null" +
            ",:dataStatus" +
            ",:serviceYn " +
            ",:headNo " +
            ",:branchNo " +
            ",:masterYn " +
            ",:authTel " +
            ",:deposit " +
            ",:cash " +
            ",:cashDefault " +
            ",:storeName " +
            ",:storeNameInapp " +
            ",:storeTel " +
            ",:storeIntro " +
            ",:cybankTypeCode " +
            ",:cybankAccount " +
            ",:pinNum " +
            ",:bankTypeCode " +
            ",:bankAccount " +
            ",:bankOwner " +
            ",:mngrName " +
            ",:memo " +
            ",:alldayOpenYn " +
            ",:storeType " +
            ",:poi " +
            ",:lat " +
            ",:lng " +
            ",:addr1 " +
            ",:addr2 " +
            ",:addr3 " +
            ",:addr4 " +
            ",:addr5" +
            ",:imgFileSmall" +
            ",:imgFile1) " +
            "", nativeQuery = true)
    int insertTbStore(@Param("insertUserId") String insertUserId,
                      @Param("dataStatus") Integer dataStatus,
                      @Param("serviceYn") Integer serviceYn,
                      @Param("headNo") Integer headNo,
                      @Param("branchNo") Integer branchNo,
                      @Param("masterYn") Integer masterYn,
                      @Param("authTel") String authTel,
                      @Param("deposit") Integer deposit,
                      @Param("cash") Integer cash,
                      @Param("cashDefault") Integer cashDefault,
                      @Param("storeName") String storeName,
                      @Param("storeNameInapp") String storeNameInapp,
                      @Param("storeTel") String storeTel,
                      @Param("storeIntro") String storeIntro,
                      @Param("cybankTypeCode") String cybankTypeCode,
                      @Param("cybankAccount") String cybankAccount,
                      @Param("pinNum") String pinNum,
                      @Param("bankTypeCode") String bankTypeCode,
                      @Param("bankAccount") String bankAccount,
                      @Param("bankOwner") String bankOwner,
                      @Param("mngrName") String mngrName,
                      @Param("memo") String memo,
                      @Param("alldayOpenYn") Integer alldayOpenYn,
                      @Param("storeType") Integer storeType,
                      @Param("poi") String poi,
                      @Param("lat") BigDecimal lat,
                      @Param("lng") BigDecimal lng,
                      @Param("addr1") String addr1,
                      @Param("addr2") String addr2,
                      @Param("addr3") String addr3,
                      @Param("addr4") String addr4,
                      @Param("addr5") String addr5,
                      @Param("imgFileSmall") String imgFileSmall,
                      @Param("imgFile1") String imgFile1
                      );


    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_store set " +
            "store_url = :storeUrl " +
            "where store_no = :storeNo", nativeQuery = true)
    int saveStoreUrl(
            @Param("storeNo") Long storeNo,
            @Param("storeUrl") String storeUrl
    );

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_store set " +
            "update_user_id = :updateUserId, " +
            "update_date = now(), " +
            "data_status = :dataStatus, " +
            "service_yn = :serviceYn, " +
            "head_no = :headNo, " +
            "branch_no = :branchNo, " +
            "master_yn = :masterYn, " +
            "auth_tel = :authTel, " +
            "deposit = :deposit, " +
            "cash = :cash, " +
            "cash_default = :cashDefault, " +
            "store_name = :storeName, " +
            "store_name_inapp = :storeNameInapp, " +
            "store_tel = :storeTel, " +
            "store_intro = :storeIntro, " +
            "cybank_type_code = :cybankTypeCode, " +
            "cybank_account = :cybankAccount, " +
            "pin_num = :pinNum, " +
            "bank_type_code = :bankTypeCode, " +
            "bank_account = :bankAccount, " +
            "bank_owner = :bankOwner, " +
            "mngr_name = :mngrName, " +
            "memo = :memo, " +
            "allday_open_yn = :alldayOpenYn, " +
            "store_type = :storeType, " +
            "poi = :poi, " +
            "lat = :lat, " +
            "lng = :lng, " +
            "addr_1 = :addr1, " +
            "addr_2 = :addr2, " +
            "addr_3 = :addr3, " +
            "addr_4 = :addr4, " +
            "addr_5 = :addr5, " +

            "img_file_small = :imgFileSmall, " +
            "img_file_1 = :imgFile1 " +


            "where store_no = :storeNo", nativeQuery = true)
    int updateTbStore(
            @Param("storeNo") Long storeNo,
            @Param("updateUserId") String updateUserId,
            @Param("dataStatus") Integer dataStatus,
            @Param("serviceYn") Integer serviceYn,
            @Param("headNo") Integer headNo,
            @Param("branchNo") Integer branchNo,
            @Param("masterYn") Integer masterYn,
            @Param("authTel") String authTel,
            @Param("deposit") Integer deposit,
            @Param("cash") Integer cash,
            @Param("cashDefault") Integer cashDefault,
            @Param("storeName") String storeName,
            @Param("storeNameInapp") String storeNameInapp,
            @Param("storeTel") String storeTel,
            @Param("storeIntro") String storeIntro,
            @Param("cybankTypeCode") String cybankTypeCode,
            @Param("cybankAccount") String cybankAccoun,
            @Param("pinNum") String pinNum,
            @Param("bankTypeCode") String bankTypeCode,
            @Param("bankAccount") String bankAccount,
            @Param("bankOwner") String bankOwner,
            @Param("mngrName") String mngrName,
            @Param("memo") String memo,
            @Param("alldayOpenYn") Integer alldayOpenYn,
            @Param("storeType") Integer storeType,
            @Param("poi") String poi,
            @Param("lat") BigDecimal lat,
            @Param("lng") BigDecimal lng,
            @Param("addr1") String addr1,
            @Param("addr2") String addr2,
            @Param("addr3") String addr3,
            @Param("addr4") String addr4,
            @Param("addr5") String addr5,
            @Param("imgFileSmall") String imgFileSmall,
            @Param("imgFile1") String imgFile1
    );

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_store set " +
            "multi_type = :multiType, " +
            "master_charge_yn = :masterChargeYn, " +
            "master_goods_yn = :masterGoodsYn, " +
            "master_store_no = :masterStoreNo " +
            "where store_no = :storeNo", nativeQuery = true)
    int multiUpdate(
            @Param("storeNo") Long storeNo,
            @Param("multiType") Integer multiType,
            @Param("masterChargeYn") Integer masterChargeYn,
            @Param("masterGoodsYn") Integer masterGoodsYn,
            @Param("masterStoreNo") Integer masterStoreNo
    );

    @Query(value = "select store_no as storeNo, " +
            "store_name as storeName, " +
            "store_tel as storeTel, " +
            "master_store_no as masterStoreNo " +
            "from tb_store " +
            "where store_name like :storeName " +
            "and data_status != 0 " +
            "and head_no = :headNo " +
            "and branch_no = :branchNo", nativeQuery = true)
    List<TbStoreDTO> findByStoreNameAndHeadNoAndBranchNo(@Param("storeName") String storeName ,
                                     @Param("headNo") Long headNo,
                                     @Param("branchNo") Long branchNo);

    @Query(value = "select store_no as storeNo, " +
            "store_name as storeName, " +
            "store_tel as storeTel, " +
            "head_no as headNo, " +
            "branch_no as branchNo, " +
            "master_store_no as masterStoreNo " +
            "from tb_store " +
            "where store_name like :storeName " +
            "and data_status != 0 ", nativeQuery = true)
    List<TbStoreDTO> findByStoreName(@Param("storeName") String storeName);

    @Query(value = "select store_no as storeNo, " +
            "store_name as storeName, " +
            "store_tel as storeTel, " +
            "branch_no as branchNo, " +
            "head_no as headNo, " +
            "master_store_no as masterStoreNo, " +
            "(select head_name  from tb_head where head_no = headNo) as headName, " +
            "(select branch_name from tb_branch where branch_no = branchNo) as branchName " +
            "from tb_store " +
            "where store_name like :storeName " +
            "and data_status != 0 ", nativeQuery = true)
    List<TbStoreDTO> findByStoreNameLike(@Param("storeName") String storeName);

    @Query(value = "select store_no as storeNo, " +
            "store_name as storeName, " +
            "store_tel as storeTel, " +
            "head_no as headNo, " +
            "branch_no as branchNo, " +
            "(select head_name  from tb_head where head_no = headNo) as headName, " +
            "(select branch_name from tb_branch where branch_no = branchNo) as branchName, " +
            "master_store_no as masterStoreNo " +
            "from tb_store " +
            "where data_status != 0 ", nativeQuery = true)
    List<TbStoreDTO> findByStoreAll(@Param("storeName") String storeName);

    @Query(value = "select store_no as storeNo, " +
            "store_name as storeName, " +
            "store_tel as storeTel, " +
            "master_store_no as masterStoreNo " +
            "from tb_store " +
            "where data_status != 0 " +
            "and multi_type = :multiType", nativeQuery = true)
    List<TbStoreDTO> findByMultiType(@Param("multiType") Integer multiType);

    @Query(value = "select store_no as storeNo, " +
            "store_name as storeName, " +
            "store_tel as storeTel, " +
            "master_store_no as masterStoreNo " +
            "from tb_store " +
            "where data_status != 0 " +
            "and head_no = :headNo", nativeQuery = true)
    List<TbStoreDTO> findByHeadNo(@Param("headNo") Long headNo);

    @Query(value = "select store_no as storeNo, " +
            "store_name as storeName, " +
            "store_tel as storeTel, " +
            "master_store_no as masterStoreNo " +
            "from tb_store " +
            "where data_status != 0 " +
            "and head_no = :headNo " +
            "and branch_no = :branchNo", nativeQuery = true)
    List<TbStoreDTO> findByAll(@Param("headNo") Long headNo,
                                @Param("branchNo") Long branchNo);


    @Query(value = "select count(store_no) as cnt " +
            "from tb_store " +
            "where data_status = 1 " +
            "and service_type = 1 "+
            "and branch_no = 10007 "+
            "order by cnt desc "+
            "", nativeQuery = true)
    List<Map<String,Object>> getStoreRentChart();

    List<TbStore> findByServiceType(@Param("serviceType") ServiceType serviceType);

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_store set " +
            "cybank_type_code = :cybankTypeCode, " +
            "cybank_account = :cybankAccount, " +
            "cybank_owner = :cybankOnwer " +
            "where store_no = :storeNo", nativeQuery = true)
    int setCyAccountSet(
            @Param("cybankTypeCode") String cybankTypeCode,
            @Param("cybankAccount") String cybankAccount,
            @Param("cybankOnwer") String cybankOnwer,
            @Param("storeNo") Long storeNo
    );

}
