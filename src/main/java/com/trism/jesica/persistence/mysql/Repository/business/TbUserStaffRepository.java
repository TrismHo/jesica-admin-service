package com.trism.jesica.persistence.mysql.Repository.business;

/*import com.trism.manna.dto.TbHeadDTO;*/

import com.trism.jesica.dto.TbUserStaffDTO;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbUserStaff;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.List;

public interface TbUserStaffRepository extends JpaRepository<TbUserStaff, Long>, JpaSpecificationExecutor<TbUserStaff> {

    @Query(value = "select " +
            "a.staff_no as staffNo,  a.name as name , a.phone , a.memo , a.data_status as dataStatus, a.block_type_code as blockTypeCode, " +
            "b.user_id as userId " +
            "from tb_user_staff a left outer join tb_user b " +
            "on b.user_no = a.staff_no " +
            "where a.store_no = :storeNo " +
            "and b.user_type = :userType " +
            "and a.data_status != 0" +
            "", nativeQuery = true)
    List<TbUserStaffDTO> findByStoreNoAndUserTypeNative(@Param("storeNo") Integer storeNo, @Param("userType") Integer userType);

    @Query(value = "select " +
            "a.staff_no as staffNo,  a.name as name , a.phone , a.memo , a.data_status as dataStatus,  a.block_type_code as blockTypeCode ," +
            "b.user_id as userId " +
            "from tb_user_staff a left outer join tb_user b " +
            "on b.user_no = a.staff_no " +
            "where a.branch_no = :branchNo " +
            "and b.user_type = :userType " +
            "and a.data_status != 0" +
            "", nativeQuery = true)
    List<TbUserStaffDTO> findByBranchNoNoAndUserTypeNative(@Param("branchNo") Integer branchNo, @Param("userType") Integer userType);

    @Query(value = "select " +
            "a.staff_no as staffNo,  a.name as name , a.phone , a.memo , a.data_status as dataStatus, a.block_type_code as blockTypeCode, " +
            "b.user_id as userId " +
            "from tb_user_staff a left outer join tb_user b " +
            "on b.user_no = a.staff_no " +
            "where a.head_no = :headNo " +
            "and b.user_type = :userType " +
            "and a.data_status != 0" +
            "", nativeQuery = true)
    List<TbUserStaffDTO> findByHeadNoAndUserTypeNative(@Param("headNo") Integer headNo, @Param("userType") Integer userType);

    @Query(value = "select " +
            "a.staff_no as staffNo, " +
            " a.name as name " +
            ", a.phone as phone " +
            ", a.memo as memo " +
            ", a.role_type as roleType " +
            ", a.block_type_code as blockTypeCode " +
            ", a.data_status as dataStatus" +
            ", a.app_code as appCode" +
            ", b.user_id as userId" +
            ", b.last_login_dtm as lastLoginDtm " +
            ", b.insert_date as insertDate " +
            ", b.insert_user_id as insertUserId " +
            "from tb_user_staff a left outer join tb_user b " +
            "on b.user_no = a.staff_no " +
            "where b.user_no = :userNo " +
            "and (b.user_type = 6)" +
            "and a.data_status != 0" +
            "", nativeQuery = true)
    TbUserStaffDTO findByUserStaffNative(@Param("userNo") Long userNo);

    @Modifying
    @Query(value = "update tb_user_staff set " +
            "name = :name, " +
            "phone = :phone, " +
            "memo = :memo, " +
            "block_type_code = :blockTypeCode, " +
            "update_user_id = :updateUserId, " +
            "data_status = :dataStatus " +
            "where staff_no = :staffNo", nativeQuery = true)
    int updateUserStaff(@Param("staffNo") Long staffNo,
                      @Param("name") String name,
                      @Param("phone") String phone,
                      @Param("memo") String memo,
                      @Param("blockTypeCode") String blockTypeCode,
                      @Param("updateUserId") String updateUserId,
                      @Param("dataStatus") Integer dataStatus
    );

    TbUserStaff findByUserId(@Param("userId") String userId);






    @Query(value = "select " +
            "a.staff_no as staffNo, " +
            " a.name as name " +
            ", a.phone as phone " +
            ", a.memo as memo " +
            ", a.role_type as roleType " +
            ", a.data_status as dataStatus" +
            ", a.block_type_code as blockTypeCode " +
            ", b.user_id as userId " +
            ", b.last_login_dtm as lastLoginDtm " +
            ", b.insert_date as insertDate " +
            "from tb_user_staff a left outer join tb_user b " +
            "on b.user_no = a.staff_no " +
            "where ((:name is null and 1=1 ) or ( :name is not null and name like %:name% ))" +
            "and ((:appCode is null and 1=1 ) or ( :appCode is not null and app_code = :appCode))" +
            "and (b.user_type = 6) " +
            "and a.role_type != 0 " +
            " and ((:dataStatus is null and data_status != 0 ) or ( :dataStatus is not null and data_status = :dataStatus )) " +
            " and (" +
            " b.insert_date between :startDate and :endDate " +
            "  ) " +
            "order by b.insert_date desc" +
            "", nativeQuery = true)
    List<TbUserStaffDTO> findByUserStaffNativeList(@Param("name") Object name,
                                                   @Param("dataStatus") Object dataStatus,
                                                   @Param("appCode") Object appCode,
                                                   @Param("startDate") LocalDateTime startDate,
                                                   @Param("endDate") LocalDateTime endDate);

    @Query(value = "select " +
            "a.staff_no as staffNo, " +
            " a.name as name " +
            ", a.phone as phone " +
            ", (select code_name from tb_system_code where sys_type= 'AC' and sys_code = a.app_code) as appName " +
            ", a.app_code as appCode " +
            ", a.memo as memo " +
            ", a.role_type as roleType " +
            ", a.data_status as dataStatus" +
            ", a.block_type_code as blockTypeCode " +
            ", b.user_id as userId " +
            ", b.last_login_dtm as lastLoginDtm " +
            ", b.insert_date as insertDate " +
            "from tb_user_staff a left outer join tb_user b " +
            "on b.user_no = a.staff_no " +
            "where ((:name is null and 1=1 ) or ( :name is not null and name like %:name% )) " +
            "and ((:appCode is null and 1=1 ) or ( :appCode is not null and app_code = :appCode))" +
            "and (b.user_type = 6) " +
            "and a.role_type != 0 " +
            " and ((:dataStatus is null and data_status != 0 ) or ( :dataStatus is not null and data_status = :dataStatus )) " +
            " and (" +
            " b.insert_date between :startDate and :endDate " +
            "  ) " +
            "order by b.insert_date desc" +
            "",
            countQuery = "select " +
                    "a.staff_no as staffNo, " +
                    " a.name as name " +
                    ", a.phone as phone " +
                    ", (select code_name from tb_system_code where sys_type= 'AC' and sys_code = a.app_code) as appName " +
                    ", a.app_code as appCode " +
                    ", a.memo as memo " +
                    ", a.role_type as roleType " +
                    ", a.data_status as dataStatus" +
                    ", a.block_type_code as blockTypeCode " +
                    ", b.user_id as userId " +
                    ", b.last_login_dtm as lastLoginDtm " +
                    ", b.insert_date as insertDate " +
                    "from tb_user_staff a left outer join tb_user b " +
                    "on b.user_no = a.staff_no " +
                    "where ((:name is null and 1=1 ) or ( :name is not null and name like %:name% ))" +
                    "and ((:appCode is null and 1=1 ) or ( :appCode is not null and a.app_code = :appCode))" +
                    "and (b.user_type = 6) " +
                    "and a.role_type != 0 " +
                    " and ((:dataStatus is null and data_status != 0 ) or ( :dataStatus is not null and data_status = :dataStatus )) " +
                    " and (" +
                    " b.insert_date between :startDate and :endDate " +
                    "  ) ",
            nativeQuery = true)
    Page<TbUserStaffDTO> findByUserStaffNativePageList(@Param("name") Object name,
                                                       @Param("dataStatus") Object dataStatus,
                                                       @Param("appCode") Object appCode,
                                                       @Param("startDate") LocalDateTime startDate,
                                                       @Param("endDate") LocalDateTime endDate
                                                       , Pageable pageable);


}
