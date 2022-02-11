package com.trism.jesica.persistence.Repository.board;

import com.trism.jesica.persistence.Entitiy.board.TbAppBanner;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbAppBannerRepository extends JpaRepository<TbAppBanner, Integer>, JpaSpecificationExecutor<TbAppBanner> {

}