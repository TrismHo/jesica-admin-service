package com.trism.jesica.persistence.Repository.cash;

import com.trism.jesica.persistence.Entitiy.cash.TbCashWithdraw;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbCashWithdrawRepository extends JpaRepository<TbCashWithdraw, Long>, JpaSpecificationExecutor<TbCashWithdraw> {

}