package com.trism.jesica.persistence.oracle.Repository;

import com.trism.jesica.persistence.oracle.Entity.MnGrSt;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface MnGrStRepository extends JpaRepository<MnGrSt, String> {

    Optional<MnGrSt> findByStCode(String stCode);
    Optional<MnGrSt> findByStCodeAndDataStatus(String stCode, String dataStatus);
}
