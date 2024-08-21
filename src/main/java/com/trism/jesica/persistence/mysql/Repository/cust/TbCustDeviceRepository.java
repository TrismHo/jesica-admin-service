package com.trism.jesica.persistence.mysql.Repository.cust;

import com.trism.jesica.persistence.mysql.Entitiy.cust.TbCustDevice;
import com.trism.jesica.persistence.mysql.Repository.querydsl.cust.TbCustDeviceRepositorySupport;
import com.trism.jesica.persistence.mysql.id.TbCustDeviceID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;
import java.util.Map;

public interface TbCustDeviceRepository extends JpaRepository<TbCustDevice, TbCustDeviceID>, TbCustDeviceRepositorySupport {

    @Query(value = "select a.device_id as deviceId, " +
            " a.cust_no as custNo, "+
            " a.login_type as loginType, "+
            " a.data_status as dataStatus, "+
            " a.insert_date as insertDate, "+
            " a.last_login_date as lastLoginDate, "+
            " a.device_type as deviceType, "+
            " a.device_os_ver as deviceOsVer, "+
            " a.device_name as deviceName, "+
            " a.app_code as appCode, "+
            " a.app_ver as appVer, "+
            " a.login_key as loginKey, "+
            " a.push_key as pushKey, "+
            " b.ext_cust_no as extCustNo, "+
            " b.cust_name as custName "+
            "from tb_cust_device a left join tb_cust b " +
            "ON a.cust_no = b.cust_no " +
            "where a.data_status = 1 " +
            "and b.cust_no = :custNo " +
            "order by a.last_login_date desc "+
            "limit 1 "+
            "", nativeQuery = true)
    Map<String,Object> getDeviceInfo(@Param("custNo") BigDecimal custNo);
}
