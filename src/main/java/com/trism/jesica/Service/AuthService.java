package com.trism.jesica.Service;

import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteAcl;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteMenu;
import com.trism.jesica.persistence.mysql.Repository.system.TbSiteAclRepository;
import com.trism.jesica.persistence.mysql.Repository.system.TbSiteMenuRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Service
@Slf4j
public class AuthService {

    private final TbSiteAclRepository tbSiteAclRepository;
    private final TbSiteMenuRepository tbSiteMenuRepository;

    @Transactional(readOnly = true)
    public TbSiteAcl getTbSiteAcl(Long staffNo, Long menuNo) {
        return tbSiteAclRepository.findByStaffNoAndMenuNo(staffNo, menuNo);
    }

    @Transactional(readOnly = true)
    public TbSiteMenu getTbSiteMenu(String menuUrl) {
        return tbSiteMenuRepository.findByMenuUrlLike(menuUrl);
    }


    @Transactional(readOnly = true)
    public List<TbSiteAcl> getSiteAcl(Long staffNo) {
        return tbSiteAclRepository.findByStaffNo(staffNo);
    }

    @Transactional(readOnly = true)
    public List<TbSiteMenu> getTbSiteMenuList() {
        return tbSiteMenuRepository.findByDataStatus(1);
    }
    @Transactional(readOnly = true)
    public List<Map<String, Object>>  getTbSiteMenuAclList(Long staffNo) {
        return tbSiteMenuRepository.getTbSiteMenuAclList(staffNo);
    }
}

