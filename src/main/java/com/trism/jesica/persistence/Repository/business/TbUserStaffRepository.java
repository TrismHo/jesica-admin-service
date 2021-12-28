package com.trism.jesica.persistence.Repository.business;

/*import com.trism.manna.dto.TbHeadDTO;*/

import com.trism.jesica.dto.TbUserStaffDTO;
import com.trism.jesica.persistence.Entitiy.business.TbUserStaff;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbUserStaffRepository extends JpaRepository<TbUserStaff, Long>, JpaSpecificationExecutor<TbUserStaff> {

    @Query(value = "select " +
            "a.staff_no as staffNo,  a.name as name , a.phone , a.memo , a.data_status as dataStatus, " +
            "b.user_id as userId " +
            "from tb_user_staff a left outer join tb_user b " +
            "on b.user_no = a.staff_no " +
            "where a.store_no = :storeNo " +
            "and b.user_type = :userType " +
            "and a.data_status != 0" +
            "", nativeQuery = true)
    List<TbUserStaffDTO> findByStoreNoAndUserTypeNative(@Param("storeNo") Integer storeNo, @Param("userType") Integer userType);

    @Query(value = "select " +
            "a.staff_no as staffNo,  a.name as name , a.phone , a.memo , a.data_status as dataStatus, " +
            "b.user_id as userId " +
            "from tb_user_staff a left outer join tb_user b " +
            "on b.user_no = a.staff_no " +
            "where a.branch_no = :branchNo " +
            "and b.user_type = :userType " +
            "and a.data_status != 0" +
            "", nativeQuery = true)
    List<TbUserStaffDTO> findByBranchNoNoAndUserTypeNative(@Param("branchNo") Integer branchNo, @Param("userType") Integer userType);

    @Query(value = "select " +
            "a.staff_no as staffNo,  a.name as name , a.phone , a.memo , a.data_status as dataStatus, " +
            "b.user_id as userId " +
            "from tb_user_staff a left outer join tb_user b " +
            "on b.user_no = a.staff_no " +
            "where a.head_no = :headNo " +
            "and b.user_type = :userType " +
            "and a.data_status != 0" +
            "", nativeQuery = true)
    List<TbUserStaffDTO> findByHeadNoAndUserTypeNative(@Param("headNo") Integer headNo, @Param("userType") Integer userType);

    @Modifying
    @Query(value = "update tb_user_staff set " +
            "name = :name, " +
            "phone = :phone, " +
            "memo = :memo, " +
            "data_status = :dataStatus " +
            "where staff_no = :staffNo", nativeQuery = true)
    int updateUserStaff(@Param("staffNo") Long staffNo,
                      @Param("name") String name,
                      @Param("phone") String phone,
                      @Param("memo") String memo,
                      @Param("dataStatus") Integer dataStatus
    );

/*    @Modifying
    @Query(value = "update tb_user_staff set " +
            "data_status = 2 ," +
            "update_user_id = 'master'" +
            "where staff_no = :staffNo", nativeQuery = true)
    int setUserStop(@Param("staffNo") Long staffNo);*/

    TbUserStaff findByUserId(@Param("userId") String userId);
    /*TbUserStaff findByStaffNo(@Param("staffNo") String staffNo);*/

}
