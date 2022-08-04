package com.trism.jesica.persistence.Repository.car;

import com.trism.jesica.persistence.Entitiy.car.TbRentalInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TbRentalInfoRepository extends JpaRepository<TbRentalInfo, Long>, JpaSpecificationExecutor<TbRentalInfo> {
    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_rental_info " +
            "set safen_num = :safenNum " +
            "where rental_no = :rentalNo " +
            "", nativeQuery = true)
    int updateSafenNum(@Param("rentalNo") Integer rentalNo , @Param("safenNum") String safenNum);
}