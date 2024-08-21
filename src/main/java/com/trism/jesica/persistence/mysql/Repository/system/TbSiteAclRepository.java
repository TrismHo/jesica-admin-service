package com.trism.jesica.persistence.mysql.Repository.system;

import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteAcl;
import com.trism.jesica.persistence.mysql.id.TbSiteAclID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface TbSiteAclRepository extends JpaRepository<TbSiteAcl, TbSiteAclID>, JpaSpecificationExecutor<TbSiteAcl> {

    TbSiteAcl findByStaffNoAndMenuNo(Long staffNo, Long menuNo);
    List<TbSiteAcl> findByStaffNo(Long staffNo);

}
