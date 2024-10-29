package com.trism.jesica.persistence.mysql.Repository.file;

import com.trism.jesica.persistence.mysql.Entitiy.file.TbFile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbFileRepository extends JpaRepository<TbFile, Long>, JpaSpecificationExecutor<TbFile> {
    List<TbFile> findByLibNo(@Param("libNo") Long libNo);


}
