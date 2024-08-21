package com.trism.jesica.persistence.mysql.Repository.system;

import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteMenu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

public interface TbSiteMenuRepository extends JpaRepository<TbSiteMenu, Integer>, JpaSpecificationExecutor<TbSiteMenu> {

    TbSiteMenu findByMenuUrlLike(String menuUrl);

    @Query(value = "select " +
            "tsm.menu_no as menuNo, " +
            "tsm.menu_name as menuName, " +
            "tsm.menu_url as menuUrl, " +
            "tsm.menu_icon as menuIcon, " +
            "tsa.permission as permission, " +
            "tsa.staff_no as staffNo, " +
            "tsm.menu_level as menuLevel, " +
            "tsm.menu_group as menuGroup " +
            "from tb_site_menu as tsm " +
            " left outer join tb_site_acl tsa " +
            " on tsm.menu_no = tsa.menu_no " +
            " where tsa.staff_no = :staffNo" +
            " order by tsm.menu_no asc", nativeQuery = true)
    //List<Map<String, Object>> getTbSiteMenuAclList(@Param("staffNo") Long staffNo);
    List<Map<String, Object>>  getTbSiteMenuAclList(@Param("staffNo") Long staffNo);

    List<TbSiteMenu> findByDataStatus(@Param("dataStatus") Integer dataStatus);
}
