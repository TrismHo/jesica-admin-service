package com.trism.jesica.persistence.mysql.Repository.coupon;

import com.trism.jesica.dto.TbCustCouponDTO;
import com.trism.jesica.persistence.mysql.Entitiy.coupon.TbCouponPublish;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

public interface TbCouponPublishRepository extends JpaRepository<TbCouponPublish, Long>, JpaSpecificationExecutor<TbCouponPublish> {

    @Query(value = "select  " +
                        "tc.cust_no as custNo, " +
                        "tc.cust_name as custName, " +
                        "tc.login_id as loginId, " +
                        "tc.cust_tel as custTel, " +
                        "tcp.insert_date as insertDate, " +
                        "tcp.expire_date as expireDate, " +
                        "tcp.use_date as useDate " +
                    "from tb_coupon_publish as tcp " +
                    "inner join tb_cust as tc " +
                    "on tcp.cust_no = tc.cust_no " +
                    "where tcp.coupon_no = :couponNo and tcp.use_yn = :useYn " +
                    "order by tcp.insert_date asc", nativeQuery = true)
    List<Map<String, Object>> findByCouponNoAndUseYn(@Param("couponNo") Long couponNo, @Param("useYn") Integer useYn );

    @Query(value = "select " +
                        "tco.coupon_no as couponNo, " +
                        "tco.service_type as serviceType, " +
                        "tco.order_type_code as orderTypeCode, " +
                        "tco.title as title, " +
                        "tco.dc_rate_type as dcRateType, " +
                        "tco.dc_amt as dcAmt, " +
                        "tcp.insert_date as insertDate, " +
                        "tcp.expire_date as expireDate, " +
                        "tcp.use_date as useDate, " +
                        "tcp.use_yn as useYn " +
                    "from tb_coupon_publish as tcp " +
                    "inner join tb_coupon as tco " +
                        "on tco.coupon_no = tcp.coupon_no " +
                    "where tcp.cust_no = :custNo and tcp.use_yn = :useYn" +
                    "", nativeQuery = true)
    List<TbCustCouponDTO> findByCustNoAndUseYn(@Param("custNo") Long custNo, @Param("useYn") Integer useYn);
}
