package com.trism.jesica.persistence.mysql.Repository.board;

import com.trism.jesica.persistence.mysql.Entitiy.board.TbAppBanner;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

public interface TbAppBannerRepositoryCustom {
    Page<Long> findAllIds(Specification<TbAppBanner> spec, Pageable pageable);

}
