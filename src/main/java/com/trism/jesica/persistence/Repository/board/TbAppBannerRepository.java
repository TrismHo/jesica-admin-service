package com.trism.jesica.persistence.Repository.board;

import com.trism.jesica.dto.TbAppBannerDTO;
import com.trism.jesica.persistence.Entitiy.board.TbAppBanner;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbAppBannerRepository extends JpaRepository<TbAppBanner, Long>, JpaSpecificationExecutor<TbAppBanner> {

    List<TbAppBanner> findAllByViewYnAndDataStatus(Integer viewYn, Integer dataStatus);
    List<TbAppBanner> findAllByViewYnAndDataStatusAndViewOrderIsGreaterThan(Integer viewYn, Integer dataStatus, Integer viewOrder);
    List<TbAppBanner> findAllByViewYnAndDataStatusOrderByViewOrderAsc(Integer viewYn, Integer dataStatus);

    @Query(value = "select " +
            "tab.banner_no as bannerNo, " +
            "tab.view_order as viewOrder, " +
            "tab.banner_file as bannerFile, " +
            "tab.board_type as boardType, " +
            "te.title as title, " +
            "te.insert_date as insertDate " +
                "from tb_app_banner as tab " +
                    "inner join tb_event te " +
                        "on tab.board_no = te.event_no " +
                    "where tab.board_type = 1 and " +
                          "tab.data_status = 1 and " +
                          "tab.view_yn = 1 and " +
                          "te.data_status = 1 and " +
                          "tab.view_order > 0 and " +
                          "tab.service_type = :serviceType " +
                    "order by tab.view_order asc" +
            "", nativeQuery = true)
    List<TbAppBannerDTO> getSortEventList(@Param("serviceType") int serviceType);

    @Query(value = "select " +
            "tab.banner_no as bannerNo, " +
            "tab.view_order as viewOrder, " +
            "tab.banner_file as bannerFile, " +
            "tab.board_type as boardType, " +
            "tnp.title as title, " +
            "tnp.insert_date as insertDate " +
                "from tb_app_banner as tab " +
                    "inner join tb_notice_platform tnp " +
                        "on tab.board_no = tnp.notice_no " +
                    "where tab.board_type = 2 and " +
                          "tab.data_status = 1 and " +
                          "tab.view_yn = 1 and " +
                          "tnp.data_status = 1 and " +
                          "tnp.group_type = 5 and " +
                          "tab.view_order > 0 and " +
                          "tab.service_type = :serviceType " +
            "order by tab.view_order asc" +
            "", nativeQuery = true)
    List<TbAppBannerDTO> getSortNoticeList(@Param("serviceType") int serviceType);

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_app_banner set " +
            "view_order = :idx " +
            "where banner_no = :bannerNo", nativeQuery = true)
    int updateViewOrder(@Param("idx") int idx, @Param("bannerNo") Long bannerNo);
}