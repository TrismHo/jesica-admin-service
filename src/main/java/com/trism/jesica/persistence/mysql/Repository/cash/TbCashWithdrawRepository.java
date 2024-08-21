package com.trism.jesica.persistence.mysql.Repository.cash;

import com.trism.jesica.persistence.mysql.Entitiy.cash.TbCashWithdraw;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbCashWithdrawRepository extends JpaRepository<TbCashWithdraw, Long>, JpaSpecificationExecutor<TbCashWithdraw> {

}
