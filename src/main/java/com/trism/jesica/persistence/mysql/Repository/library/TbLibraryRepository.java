package com.trism.jesica.persistence.mysql.Repository.library;

import com.trism.jesica.persistence.mysql.Entitiy.library.TbLibrary;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbLibraryRepository extends JpaRepository<TbLibrary, Long>, JpaSpecificationExecutor<TbLibrary> {
    Page<TbLibrary> findAll(Specification<TbLibrary> specification, Pageable pageable);

}
