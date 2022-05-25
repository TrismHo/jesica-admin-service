package com.trism.jesica.persistence.Repository.safe;

import com.trism.jesica.persistence.Entitiy.safe.TbSafenMapping;
import com.trism.jesica.persistence.type.DataStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbSafenMappingRepository extends JpaRepository<TbSafenMapping, String>, JpaSpecificationExecutor<TbSafenMapping> {

//    @Modifying(clearAutomatically = true)
//    @Query(value = "update tb_safen_mapping " +
//            "set data_status = 1, rental_car_no = :rentalCarNum " +
//            "where data_status = 2 " +
//            "order by safen_num limit 1; "+
//            "", nativeQuery = true)
//    int mappingSafenNum(@Param("rentalCarNum") Integer rentalCarNum);
    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_safen_mapping " +
            "set data_status = 1, rental_car_no = :rentalCarNo " +
            "where data_status = 2 " +
            "and safen_num = :safenNum "+
            "", nativeQuery = true)
    int mappingSafenNum(@Param("rentalCarNo") Integer rentalCarNo,@Param("safenNum") String safenNum);

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_safen_mapping " +
            "set data_status = 1, rental_car_no = :rentalCarNo " +
            "where data_status = 2 " +
            "and safen_num = :safenNum "+
            "", nativeQuery = true)
    int mappingSafenNumSafenNum(@Param("rentalCarNo") Integer rentalCarNo,@Param("safenNum") String safenNum);

    TbSafenMapping findByRentalCarNo(@Param("rentalCarNum") Integer rentalCarNum);
    List<TbSafenMapping> findTop100ByDataStatusAndSafenNumLikeAndRentalCarNoIsNull(@Param("dataStatus") DataStatus dataStatus,@Param("safenNum") String safenNum);
    List<TbSafenMapping> findTop100ByDataStatusAndRentalCarNoIsNull(@Param("dataStatus") DataStatus dataStatus);

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_safen_mapping " +
            "set data_status = 2 " +
            ",rental_car_no = null" +
            " where rental_car_no = :rentalCarNo " +
            "", nativeQuery = true)
    int getTbSafenMappingAsssignmentDefault(@Param("rentalCarNo") Integer rentalCarNo);

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_safen_mapping " +
            "set data_status = 1, rental_car_no = :rentalCarNo " +
            "where safen_num = :safenNum "+
            "", nativeQuery = true)
    int getTbSafenMappingAsssignment(@Param("rentalCarNo") Integer rentalCarNo,@Param("safenNum") String safenNum);


}