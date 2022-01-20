package com.trism.jesica.persistence.Repository.car;

import com.trism.jesica.persistence.Entitiy.car.TbRentalInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbRentalInfoRepository extends JpaRepository<TbRentalInfo, Long>, JpaSpecificationExecutor<TbRentalInfo> {

}