package com.trism.jesica.persistence.mysql.Repository.manna;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbBrCodeList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

public interface TbMannaBrCodeRepository extends JpaRepository<TbBrCodeList, Long>, JpaSpecificationExecutor<TbBrCodeList> {
    @Query(value =
            "  SELECT  " +
            "    br_code as brCode , " +
            "    br_name as brName , " +
            "    put_date as putDate ,  " +
            "    mod_date as modDate , " +
            "    put_user_id as putUserId ,  " +
            "    mod_user_id as modUserId , " +
            "    use_yn as useYn  " +
            "  FROM  " +
            "    manna_br_code_list  " +
            "  WHERE  use_yn = 'Y'  " +
            "  ORDER BY put_date ASC " +
            "", nativeQuery = true)
    List<Map<String,Object>> getBrCodeList();
    @Query(value =
            "  SELECT  " +
            "    br_code as brCode , " +
            "    br_name as brName , " +
            "    put_date as putDate ,  " +
            "    mod_date as modDate , " +
            "    put_user_id as putUserId ,  " +
            "    mod_user_id as modUserId , " +
            "    use_yn as useYn  " +
            "  FROM  " +
            "    manna_br_code_list  " +
            "  ORDER BY put_date ASC " +
            "", nativeQuery = true)
    List<Map<String,Object>> getBrCodeSystemList();

    @Modifying(clearAutomatically = true)
    @Query(value = "update manna_br_code_list set " +
            "br_name = :brName, " +
            "use_yn = :useYn, " +
            "mod_user_id = :modUserId " +
            ",mod_date = now() " +
            "where br_code = :brCode", nativeQuery = true)
    int update(@Param("brCode") String brCode,
               @Param("brName") String brName,
               @Param("useYn") String useYn,
               @Param("modUserId") String modUserId
    );

    @Modifying(clearAutomatically = true)
    @Query(value = "insert into manna_br_code_list (" +
            "br_code, br_name , put_date , put_user_id) values (" +
            " :brCode , :brName, now(), :putUserId)", nativeQuery = true)
    int insert(@Param("brCode") String brCode,
               @Param("brName") String brName,
               @Param("putUserId") String putUserId
    );

    @Modifying(clearAutomatically = true)
    @Query(value = "delete from manna_br_code_list" +
            " where br_code = :brCode ", nativeQuery = true)
    int delete(@Param("brCode") String brCode
    );

}
