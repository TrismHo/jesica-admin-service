package com.trism.jesica.persistence.mysql.Repository.manna;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaStRegistFile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

public interface TbMannaStRegistFileRepository extends JpaRepository<TbMannaStRegistFile, Integer>, JpaSpecificationExecutor<TbMannaStRegistFile> {

    @Query(value =
            "SELECT " +
                    "    regist_file_no AS registFileNo, " +
                    "    st_code AS stCode, " +
                    "    insert_date AS insertDate, " +
                    "    file_name AS fileName, " +
                    "    file_path AS filePath " +
                    "FROM manna_st_regist_file a " +
                    "WHERE 1 = 1 " +
                    "  AND ((:stCode IS NULL OR :stCode = '') OR a.st_code = :stCode) " +
                    "ORDER BY a.insert_date DESC, a.regist_file_no DESC",
            nativeQuery = true)
    List<Map<String, Object>> getMannaStRegistFileList(@Param("stCode") String stCode);
}
