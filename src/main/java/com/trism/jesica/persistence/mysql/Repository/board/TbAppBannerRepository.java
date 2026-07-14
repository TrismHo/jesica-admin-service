package com.trism.jesica.persistence.mysql.Repository.board;

import com.trism.jesica.dto.TbAppBannerDTO;
import com.trism.jesica.persistence.mysql.Entitiy.board.TbAppBanner;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbAppBannerRepository extends JpaRepository<TbAppBanner, Long>, JpaSpecificationExecutor<TbAppBanner>, TbAppBannerRepositoryCustom {

    List<TbAppBanner> findAllByViewYnAndDataStatus(Integer viewYn, Integer dataStatus);
    List<TbAppBanner> findAllByViewYnAndDataStatusAndServiceNo(Integer viewYn, Integer dataStatus, Integer serviceNo);
    List<TbAppBanner> findAllByViewYnAndDataStatusAndViewOrderIsGreaterThan(Integer viewYn, Integer dataStatus, Integer viewOrder);



/*    @Query("select b.bannerNo " +
            "from TbAppBanner b " +
            "where b.dataStatus = 1 " +
            "  and b.serviceType = 1 " +
            "  and (:bannerType is null or b.bannerType = :bannerType) " +
            "order by b.viewYn desc, b.viewOrder asc, b.insertDate desc")
    Page<Long> findLocalBannerIds(@Param("bannerType") Integer bannerType, Pageable pageable);*/

    @Query("select distinct b " +
        "from TbAppBanner b "+
        "left join fetch b.locations l "+
        "where b.bannerNo in :ids")
    List<TbAppBanner> findLocalBannersWithLocations(@Param("ids") List<Long> ids);

    @Query(value =
            "select " +
                    "tab.banner_no as bannerNo, " +
                    "tab.view_order as viewOrder, " +
                    "tab.banner_file as bannerFile, " +
                    "tab.board_type as boardType, " +

                    // 🎯 board_type 에 따라 제목 선택
                    "case " +
                    "   when tab.board_type = 1 then te.title " +
                    "   when tab.board_type = 2 then tnp.title " +
                    "   else null " +
                    "end as title, " +

                    "tab.insert_date as insertDate " +

                    "from tb_app_banner tab " +

                    // 이벤트
                    "left join tb_event te " +
                    "   on tab.board_type = 1 " +
                    "   and tab.board_no = te.event_no " +
                    "   and te.data_status = 1 " +

                    // 공지
                    "left join tb_notice_platform tnp " +
                    "   on tab.board_type = 2 " +
                    "   and tab.board_no = tnp.notice_no " +
                    "   and tnp.data_status = 1 " +
                    "   and tnp.group_type = 5 " +

                    "where tab.data_status = 1 " +
                    "and tab.view_yn = 1 " +
                    "and tab.view_order > 0 " +
                    "and tab.platform_type = :platformType " +
                    "and tab.service_type = :serviceType " +
                    "and (:serviceNo is null or tab.service_no = :serviceNo) " +

                    "order by tab.view_order asc",
            nativeQuery = true)
    List<TbAppBannerDTO> getSortBannerList(
            @Param("serviceType") Integer serviceType,
            @Param("platformType") Integer platformType,
            @Param("serviceNo") Long serviceNo
    );



    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_app_banner set " +
            "view_order = :idx " +
            "where banner_no = :bannerNo", nativeQuery = true)
    int updateViewOrder(@Param("idx") int idx, @Param("bannerNo") Long bannerNo);
}
