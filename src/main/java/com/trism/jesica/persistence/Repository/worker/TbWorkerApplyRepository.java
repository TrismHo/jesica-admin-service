package com.trism.jesica.persistence.Repository.worker;

import com.trism.jesica.persistence.Entitiy.worker.TbWorkerApply;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

public interface TbWorkerApplyRepository extends JpaRepository<TbWorkerApply, Integer>, JpaSpecificationExecutor<TbWorkerApply> {
    @Modifying
    @Query(value = "update tb_worker_apply set " +
            "auth_status = :authStatus, " +
            "auth_date = now() " +
            "where apply_no = :applyNo "+
            "", nativeQuery = true)
    int updateAuthStatus(@Param("applyNo") Integer applyNo, @Param("authStatus") Integer authStatus);

    @Query(value = "select count(apply_no) as cnt " +
            "from tb_worker_apply " +
            "where auth_status = 1 "+
            /*"and service_type = 1 "+*/
            "order by cnt desc "+
            "", nativeQuery = true)
    List<Map<String,Object>> getWorkerApplyChart();
   /* @Modifying
    @Query(value = "update tb_worker_apply set " +
            "auth_status = :authStatus, " +
            "license_num = :param1 ," +
            "license_type  = :param2 ," +
            "license_exp_date  = :param3 " +
            "where apply_no = :applyNo "+
            "", nativeQuery = true)
    int updateAuthStatusLicense(@Param("applyNo") Integer applyNo ,
                         @Param("param1") String param1,
                         @Param("param2") String param2,
                         @Param("param3") String param3,
                         @Param("authStatus") Integer authStatus);
    @Modifying
    @Query(value = "update tb_worker_apply set " +
            "auth_status = :authStatus, " +
            "name = :param1 ," +
            "resident_num  = :param2, " +
            "phone  = :param3 " +
            "where apply_no = :applyNo "+
            "", nativeQuery = true)
    int updateAuthStatusProfile(@Param("applyNo") Integer applyNo ,
                         @Param("param1") String param1,
                         @Param("param2") String param2,
                         @Param("param3") String param3,
                         @Param("authStatus") Integer authStatus);*/

}