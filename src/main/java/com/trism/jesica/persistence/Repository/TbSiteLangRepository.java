
package com.trism.jesica.persistence.Repository;

import com.trism.jesica.dto.LangUpdateProperty;
import com.trism.jesica.persistence.Entitiy.system.TbSiteLang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.List;

public interface TbSiteLangRepository extends JpaRepository<TbSiteLang, Long>, JpaSpecificationExecutor<TbSiteLang> {

    @Query(value = "select * " +
            "from tb_site_lang " +
            "where tsl_active = 1 ", nativeQuery = true)
    List<TbSiteLang> getAllAndActive();

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_site_lang set " +
            "tsl_name = :langName " +
            ",tsl_key_group = :langKeyGruop " +
            ",tsl_key_one = :langKeyOne " +
            ",tsl_key_two = :langKeyTwo " +
            ",tsl_key_three = :langKeyThree " +
            ",tsl_key_four = :langKeyFour " +
            ",tsl_value_ko = :langKo " +
            ",tsl_value_en = :langEn " +
            ",tsl_value_kh = :langKh " +
            ",tsl_update_dtm = now() " +
            "where tsl_id = :tslId " +
            "and tsl_active = 1", nativeQuery = true)
    int update(@Param("tslId") Long tslId,
               @Param("langName") String langName,
               @Param("langKeyGruop") String langKeyGruop,
               @Param("langKeyOne") String langKeyOne,
               @Param("langKeyTwo") String langKeyTwo,
               @Param("langKeyThree") String langKeyThree,
               @Param("langKeyFour") String langKeyFour,
               @Param("langKo") String langKo,
               @Param("langEn") String langEn,
               @Param("langKh") String langKh);

    @Query(value = "select  " +
            "tsl_id as tslId, " +
            "tsl_key_group as tslKeyGroup, " +
            "tsl_key_one as tslKeyOne, " +
            "tsl_key_two as tslKeyTwo, " +
            "tsl_key_three as tslKeyThree, " +
            "tsl_key_four as tslKeyFour, " +
            "tsl_value_ko as tslValueKo, " +
            "tsl_value_en as tslValueEn, " +
            "tsl_value_kh as tslValueKh, " +
            "tsl_update_dtm as tslUpdateDtm " +
            "from tb_site_lang " +
            "order by tsl_update_dtm desc limit 1"
            , nativeQuery = true)
    LangUpdateProperty getByMaxUpdateTime();

    @Query(value = "select " +
            "tsl_id as tslId, " +
            "tsl_key_group as tslKeyGroup, " +
            "tsl_key_one as tslKeyOne, " +
            "tsl_key_two as tslKeyTwo, " +
            "tsl_key_three as tslKeyThree, " +
            "tsl_key_four as tslKeyFour, " +
            "tsl_value_ko as tslValueKo, " +
            "tsl_value_en as tslValueEn, " +
            "tsl_value_kh as tslValueKh, " +
            "tsl_update_dtm as tslUpdateDtm " +
            "from tb_site_lang " +
            "where tsl_active = 1"
            , nativeQuery = true)
    List<LangUpdateProperty> getAllList();

    @Query(value =  "" +
            "SELECT " +
            "        tsl_update_dtm as tslUpdateDtm, " +
            "        tsl_id as tslId, " +
            "        tsl_key_group as tslKeyGroup, " +
            "        tsl_key_one as tslKeyOne, " +
            "        tsl_key_two as tslKeyTwo, " +
            "        tsl_key_three as tslKeyThree, " +
            "        tsl_key_four as tslKeyFour, " +
            "        tsl_value_ko as tslValueKo, " +
            "        tsl_value_en as tslValueEn, " +
            "        tsl_value_kh as tslValueKh        " +
            "from tb_site_lang " +
            "where tsl_active = 1 and tsl_update_dtm > :lastBuildTimeStrValue" +
            "" , nativeQuery = true)
    List<LangUpdateProperty> getUpdateProperty(@Param("lastBuildTimeStrValue") LocalDateTime lastUpdateTime);

}
/*    @Query(value =  "SELECT * " +
                        "FROM " +
                        "(SELECT " +
                        " TIMESTAMPDIFF(minute, date_format(tsl_update_dtm, '%Y-%m-%d %H:%i'), date_format(:lastBuildTimeStrValue, '%Y-%m-%d %H:%i')) as minutediff, " +
                        " TIMESTAMPDIFF(second, date_format(tsl_update_dtm, '%Y-%m-%d %H:%i'), date_format(:lastBuildTimeStrValue, '%Y-%m-%d %H:%i')) as secondiff, " +
                        " tsl_update_dtm as tslUpdateDtm, " +
                        "  tsl_id as tslId, " +
                        "        tsl_key_group as tslKeyGroup, " +
                        "        tsl_key_one as tslKeyOne, " +
                        "        tsl_key_two as tslKeyTwo, " +
                        "        tsl_key_three as tslKeyThree, " +
                        "        tsl_key_four as tslKeyFour, " +
                        "        tsl_value_ko as tslValueKo, " +
                        "        tsl_value_en as tslValueEn, " +
                        "        tsl_value_la as tslValueLa        " +
                        "from tb_sitete_lang " +
                        "where " +
                        "        tsl_update_dtm is not null) AS A " +
                    "WHERE A.minutediff < 0       " +
                    "and A.secondiff < 0       " +
                    "" , nativeQuery = true)
    List<LangUpdateProperty> getUpdateProperty(@Param("lastBuildTimeStrValue") String lastBuildTimeStrValue);


    @Query(value =  "" +
                        "SELECT " +
                        "        tsl_update_dtm as tslUpdateDtm, " +
                        "        tsl_id as tslId, " +
                        "        tsl_key_group as tslKeyGroup, " +
                        "        tsl_key_one as tslKeyOne, " +
                        "        tsl_key_two as tslKeyTwo, " +
                        "        tsl_key_three as tslKeyThree, " +
                        "        tsl_key_four as tslKeyFour, " +
                        "        tsl_value_ko as tslValueKo, " +
                        "        tsl_value_en as tslValueEn, " +
                        "        tsl_value_la as tslValueLa        " +
                        "from tb_sitete_lang " +
                        "where date_format(STR_TO_DATE(tsl_update_dtm ,'%Y-%m-%d %H:%i:%s') , '%Y-%m-%d %H:%i:%s') >= date_format(STR_TO_DATE(:lastBuildTimeStrValue ,'%Y-%m-%d %H:%i:%s') , '%Y-%m-%d %H:%i:%s')" +
                    "" , nativeQuery = true)
    List<LangUpdateProperty> getUpdateProperty(@Param("lastBuildTimeStrValue") String lastBuildTimeStrValue);
}
*/