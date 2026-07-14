package com.trism.jesica.persistence.mysql.Repository.manna;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaCouponPublish;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TbMannaCouponPublishRepository extends JpaRepository<TbMannaCouponPublish, Long>, JpaSpecificationExecutor<TbMannaCouponPublish> {

    Page<TbMannaCouponPublish> findAll(Specification<TbMannaCouponPublish> specification, Pageable pageable);

    @Modifying(clearAutomatically = true)
    @Query(value = "update manna_coupon_publish set " +
            " st_code = :stCode," +
            " cpn_status = :cpnStatus," +
            "regist_max = :registMax, "+
            "total_regist_max = :totalRegistMax  " +
            "where cpn_code = :cpnCode "+
            "", nativeQuery = true)
    int updateInfo (@Param("cpnCode") String cpnCode,
             @Param("cpnStatus") String cpnStatus,
             @Param("stCode") String stCode,
             @Param("registMax") Long registMax,
             @Param("totalRegistMax") Long totalRegistMax
    );

    @Modifying(clearAutomatically = true)
    @Query(value = "DELETE FROM manna_coupon_publish " +
        "WHERE cpn_code = :cpnCode "+
          "AND NOT EXISTS ( "+
              "SELECT 1 "+
              "FROM manna_coupon_regist "+
              "WHERE manna_coupon_regist.publish_no = manna_coupon_publish.publish_no "+
          ")"
        , nativeQuery = true)
    int deleteInfo(@Param("cpnCode") String cpnCode);
}
