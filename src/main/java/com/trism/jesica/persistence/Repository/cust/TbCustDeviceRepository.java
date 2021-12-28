package com.trism.jesica.persistence.Repository.cust;

import com.trism.jesica.persistence.Entitiy.cust.TbCustDevice;
import com.trism.jesica.persistence.Repository.querydsl.cust.TbCustDeviceRepositorySupport;
import com.trism.jesica.persistence.id.TbCustDeviceID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TbCustDeviceRepository extends JpaRepository<TbCustDevice, TbCustDeviceID>, TbCustDeviceRepositorySupport {
}
