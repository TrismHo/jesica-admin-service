package com.trism.jesica.persistence.Repository.cust;

import com.trism.jesica.persistence.Entitiy.cust.TbCustDevice;
import com.trism.jesica.persistence.Repository.querydsl.cust.TbCustFavoriteRepositorySupport;
import com.trism.jesica.persistence.id.TbCustDeviceID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TbCustFavoriteRepository extends JpaRepository<TbCustDevice, TbCustDeviceID>, TbCustFavoriteRepositorySupport {
}
