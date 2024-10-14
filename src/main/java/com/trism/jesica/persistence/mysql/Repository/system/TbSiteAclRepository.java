package com.trism.jesica.persistence.mysql.Repository.system;

import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteAcl;
import com.trism.jesica.persistence.mysql.id.TbSiteAclID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbSiteAclRepository extends JpaRepository<TbSiteAcl, TbSiteAclID>, JpaSpecificationExecutor<TbSiteAcl> {

    TbSiteAcl findByStaffNoAndMenuNo(Long staffNo, Long menuNo);

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_site_acl set " +
            "download_able = :downloadAble " +
            "where staff_no = :staffNo " +
            "and menu_no = :menuNo", nativeQuery = true)
    int updateAcl(
            @Param("staffNo") Long staffNo,
            @Param("menuNo") Long menuNo,
            @Param("downloadAble") Long downloadAble
    );

    @Modifying(clearAutomatically = true)
    @Query(value = "DELETE FROM tb_site_acl WHERE " +
            "staff_no = :staffNo " +
            "and menu_no = :menuNo " +
            "", nativeQuery = true)
    int deleteAcl(@Param("staffNo") Long staffNo,
                        @Param("menuNo") Long menuNo);


    @Modifying(clearAutomatically = true)
    @Query(value = "DELETE FROM tb_site_acl WHERE " +
            "staff_no = :staffNo" +
            "", nativeQuery = true)
    int deleteAcl(@Param("staffNo") Long staffNo);

    List<TbSiteAcl> findByStaffNo(Long staffNo);



}
