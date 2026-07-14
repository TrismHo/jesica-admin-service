package com.trism.jesica.persistence.mysql.Repository.manna;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaLogisticsSurcharge;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TbMannaLogisticsSurchargeRepository
        extends JpaRepository<TbMannaLogisticsSurcharge, Integer> {
    Page<TbMannaLogisticsSurcharge> findAll(Specification<TbMannaLogisticsSurcharge> specification, Pageable pageable);

    List<TbMannaLogisticsSurcharge> findByAddrNameContainingOrderBySurchargeNoAsc(String addrName);

    List<TbMannaLogisticsSurcharge> findAllByOrderBySurchargeNoAsc();

    boolean existsByPostcodeSLessThanEqualAndPostcodeEGreaterThanEqual(
            String postcodeS,
            String postcodeE
    );
}
