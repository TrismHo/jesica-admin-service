package com.trism.jesica.persistence.mysql.Repository.car;

import com.trism.jesica.dto.TbStoreRentalCarDTO;
import com.trism.jesica.persistence.mysql.Entitiy.car.TbStoreRentalCar;
import com.trism.jesica.persistence.mysql.type.DataStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbStoreRentalCarRepository extends JpaRepository<TbStoreRentalCar, Integer>, JpaSpecificationExecutor<TbStoreRentalCar> {


    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_store_rental_car " +
            "set safen_num = :safenNum " +
            "where rental_car_no = :rentalCarNo " +
            "", nativeQuery = true)
    int updateSafenNum(@Param("rentalCarNo") Integer rentalCarNo ,@Param("safenNum") String safenNum);

    List<TbStoreRentalCar> findByDataStatus(@Param("dataStatus") DataStatus dataStatus);


/*    @Query(value = "select " +
            " rental_car_no as rentalCarNo " +
            ",car_model as carModel " +
            ",car_num as carNum " +
            "from tb_store_rental_car " +
            "where store_no = :storeNo " +
            "and data_status = 1 " +
            "", nativeQuery = true)*/

    List<TbStoreRentalCarDTO> findByStoreNoAndDataStatus(@Param("storeNo") Long storeNo, @Param("dataStatus") DataStatus dataStatus);
}
