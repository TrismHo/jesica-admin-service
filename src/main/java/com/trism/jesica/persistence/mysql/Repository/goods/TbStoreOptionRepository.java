package com.trism.jesica.persistence.mysql.Repository.goods;

import com.trism.jesica.dto.TbStoreOptionSubDTO;
import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreOption;
import com.trism.jesica.persistence.mysql.Repository.querydsl.goods.TbStoreOptionRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbStoreOptionRepository extends  JpaRepository<TbStoreOption, Long>, JpaSpecificationExecutor<TbStoreOption>, TbStoreOptionRepositorySupport {

    @Query(value = "select " +
            "ifnull(MAX(opt_item_no),0) as optItemNo " +
            "from tb_store_option_item " +
            "where store_opt_no = :storeOptNo " +
            "", nativeQuery = true)
    int getTbStoreOptionItemMaxNo(@Param("storeOptNo") Long storeOptNo);



    @Query(value = "select q1.store_opt_no as storeOptNo, " +
            "q1.store_no as storeNo, " +
            "q1.data_status as dataStatus, " +
            "q1.opt_name as optName, " +
            "q1.mandatory_yn as mandatoryYn, " +
            "q1.min_select_cnt as minSelectCnt, " +
            "q1.max_select_cnt as maxSelectCnt " +
            "from tb_store_option q1  " +
            "where q1.store_no = :storeNo " +
            "and q1.mandatory_yn = :mandatoryYn"+
            "", nativeQuery = true)
    List<TbStoreOptionSubDTO> findByStoreNoAndMandatoryYn(@Param("storeNo") Integer storeNo, @Param("mandatoryYn") Integer mandatoryYn);

    @Query(value = "select q1.store_opt_no as storeOptNo, " +
            "q1.store_no as storeNo, " +
            "q1.data_status as dataStatus, " +
            "q1.opt_name as optName, " +
            "q1.mandatory_yn as mandatoryYn, " +
            "q1.min_select_cnt as minSelectCnt, " +
            "q1.max_select_cnt as maxSelectCnt " +
            "from tb_store_option q1 left outer join tb_store_goods_option q2 " +
            "on (q2.store_opt_no = q1.store_opt_no) " +
            "where q2.store_goods_no = :storeGoodsNo " +
            "order by q2.view_order asc", nativeQuery = true)
    List<TbStoreOptionSubDTO> getStoreGoodsNo(@Param("storeGoodsNo") Long storeGoodsNo);
}
