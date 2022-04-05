package com.trism.jesica.persistence.Repository.safe;

import com.trism.jesica.persistence.Entitiy.safe.TbSafenMapping;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TbSafenMappingRepository extends JpaRepository<TbSafenMapping, String>, JpaSpecificationExecutor<TbSafenMapping> {

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_safen_mapping " +
            "set data_status = 1, rental_car_no = :rentalCarNum " +
            "where data_status = 2 " +
            "order by safen_num limit 1; "+
            "", nativeQuery = true)
    int mappingSafenNum(@Param("rentalCarNum") Integer rentalCarNum);

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_safen_mapping " +
            "set data_status = 1, rental_car_no = :rentalCarNum " +
            "where data_status = 2 " +
            "and safen_num = :safenNum "+
            "", nativeQuery = true)
    int mappingSafenNumSafenNum(@Param("rentalCarNum") Integer rentalCarNum,@Param("safenNum") String safenNum);

    TbSafenMapping findByRentalCarNo(@Param("rentalCarNum") Integer rentalCarNum);

}