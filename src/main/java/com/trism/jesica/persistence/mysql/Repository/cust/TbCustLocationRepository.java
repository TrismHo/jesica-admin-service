package com.trism.jesica.persistence.mysql.Repository.cust;

import com.trism.jesica.dto.TbCustLocationDTO;
import com.trism.jesica.persistence.mysql.Entitiy.cust.TbCustLocation;
import com.trism.jesica.persistence.mysql.Repository.querydsl.cust.TbCustAddrRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbCustLocationRepository extends JpaRepository<TbCustLocation, Long>, TbCustAddrRepositorySupport {
    @Query(value = "select a.custNo ," +
            "a.addr1," +
            "a.addr2, " +
            "(select code_name from  tb_system_code where sys_type = 'A1' and sys_code = a.addr1) as codeName1, " +
            "(select code_name from  tb_system_code where sys_type = 'A2' and sys_code = a.addr2) as codeName2 " +
            "from " +
            "(select" +
            "        cust_no as custNo, " +
            "        addr_1 as addr1, " +
            "        addr_2 as addr2, " +
            "        insert_date as insertDate, " +
            "        update_date as updateDate  " +
            "    from " +
            "        tb_cust_location  " +
            "    where " +
            "        cust_no = :custNo) a " +
            "", nativeQuery = true)
    List<TbCustLocationDTO> findByCustNo(@Param("custNo") Long custNo);


   /* @Modifying(clearAutomatically = true)
    @Query(value = "insert into tb_cust_location " +
            "( cust_no," +
            "addr_1 "+
            "addr_2 "+
            ") "+
            "value " +
            "(:custNo," +
            ":addr1 " +
            ":addr2 " +
            ") " +
            "", nativeQuery = true)
    int locationAreaAdd (@Param("custNo") Long custNO , @Param("addr1") String addr1, @Param("addr2") String addr2);*/
}
