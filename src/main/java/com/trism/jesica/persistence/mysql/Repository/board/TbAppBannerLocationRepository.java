package com.trism.jesica.persistence.mysql.Repository.board;

import com.trism.jesica.dto.TbAppBannerLocationDTO;
import com.trism.jesica.persistence.mysql.Entitiy.board.TbAppBannerLocation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbAppBannerLocationRepository extends JpaRepository<TbAppBannerLocation, Long>, JpaSpecificationExecutor<TbAppBannerLocation> {


    @Modifying(clearAutomatically = true)
    @Query(value = "insert into tb_app_banner_location " +
            "( banner_no," +
            "addr_1, "+
            "addr_2 "+
            ") "+
            "value " +
            "(:bannerNo," +
            ":addr1, " +
            ":addr2 " +
            ") " +
            "", nativeQuery = true)
    int bannerLocationAreaAdd (@Param("bannerNo") Long bannerNo , @Param("addr1") String addr1, @Param("addr2") String addr2);


    @Modifying
    @Query(value = " " +
            "delete from tb_app_banner_location " +
            "where bnr_loc_no = :bnrLocNo " +
            "and banner_no = :bannerNo "+
            "", nativeQuery = true)
    int bannerLocationAreaDelete (@Param("bnrLocNo") Long bnrLocNo, @Param("bannerNo") Long bannerNo);


    @Query(value = "select a.bannerNo ," +
            "a.bnrLocNo," +
            "a.addr1," +
            "a.addr2, " +
            "(select code_name from  tb_system_code where sys_type = 'A1' and sys_code = a.addr1) as codeName1, " +
            "(select code_name from  tb_system_code where sys_type = 'A2' and sys_code = a.addr2) as codeName2 " +
            "from " +
            "(select" +
            "        banner_no as bannerNo, " +
            "        bnr_loc_no as bnrLocNo, " +
            "        addr_1 as addr1, " +
            "        addr_2 as addr2, " +
            "        insert_date as insertDate, " +
            "        update_date as updateDate  " +
            "    from " +
            "        tb_app_banner_location  " +
            "    where " +
            "        banner_no = :bannerNo) a " +
            "", nativeQuery = true)
    List<TbAppBannerLocationDTO> findByBannerNo (@Param("bannerNo") Long bannerNo);
}
