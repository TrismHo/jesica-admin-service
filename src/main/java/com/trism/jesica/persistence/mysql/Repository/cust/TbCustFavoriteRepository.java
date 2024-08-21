package com.trism.jesica.persistence.mysql.Repository.cust;

import com.trism.jesica.persistence.mysql.Entitiy.cust.TbCustDevice;
import com.trism.jesica.persistence.mysql.Repository.querydsl.cust.TbCustFavoriteRepositorySupport;
import com.trism.jesica.persistence.mysql.id.TbCustDeviceID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TbCustFavoriteRepository extends JpaRepository<TbCustDevice, TbCustDeviceID>, TbCustFavoriteRepositorySupport {
}
