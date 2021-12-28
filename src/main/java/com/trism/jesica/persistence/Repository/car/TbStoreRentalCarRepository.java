package com.trism.jesica.persistence.Repository.car;

import com.trism.jesica.persistence.Entitiy.car.TbStoreRentalCar;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TbStoreRentalCarRepository extends JpaRepository<TbStoreRentalCar, Integer>, JpaSpecificationExecutor<TbStoreRentalCar> {


    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_store_rental_car " +
            "set safen_num = :safenNum " +
            "where rental_car_no = :rentalCarNo " +
            "", nativeQuery = true)
    int updateSafenNum(@Param("rentalCarNo") Integer rentalCarNo ,@Param("safenNum") String safenNum);
}