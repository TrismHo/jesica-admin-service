package com.trism.jesica.persistence.mysql.Repository.business;

import com.trism.jesica.persistence.mysql.Entitiy.business.TbUserDevice;
import com.trism.jesica.persistence.mysql.Repository.querydsl.business.TbUserDeviceRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TbUserDeviceRepository extends JpaRepository<TbUserDevice, Long>, TbUserDeviceRepositorySupport {
}
