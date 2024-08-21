package com.trism.jesica.Service;

import com.trism.jesica.Util.SearchUtil;
import com.trism.jesica.config.JesicaProperties;
import com.trism.jesica.dto.TbBranchDTO;
import com.trism.jesica.dto.TbHeadDTO;
import com.trism.jesica.dto.TbServiceChargeDTO;
import com.trism.jesica.exception.ErrorCode;
import com.trism.jesica.exception.ServiceException;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbBranch;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbHead;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbStore;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbUserWorker;
import com.trism.jesica.persistence.mysql.Entitiy.cash.TbCashWithdraw;
import com.trism.jesica.persistence.mysql.Entitiy.cust.TbBranchCashLog;
import com.trism.jesica.persistence.mysql.Entitiy.cust.TbHeadCashLog;
import com.trism.jesica.persistence.mysql.Entitiy.cust.TbStoreCashLog;
import com.trism.jesica.persistence.mysql.Entitiy.cust.TbWorkerCashLog;
import com.trism.jesica.persistence.mysql.Entitiy.order.TbOrderAll;
import com.trism.jesica.persistence.mysql.Entitiy.order.TbOrderDay;
import com.trism.jesica.persistence.mysql.Entitiy.paymenthistory.TbPayApproval;
import com.trism.jesica.persistence.mysql.Entitiy.paymenthistory.TbPayCancel;
import com.trism.jesica.persistence.mysql.Entitiy.paymenthistory.TbPayCardData;
import com.trism.jesica.persistence.mysql.Entitiy.paymenthistory.TbPayCert;
import com.trism.jesica.persistence.mysql.Entitiy.service.TbServiceCharge;
import com.trism.jesica.persistence.mysql.Entitiy.service.TbServiceChargeGroup;
import com.trism.jesica.persistence.mysql.Repository.business.TbBranchRepository;
import com.trism.jesica.persistence.mysql.Repository.business.TbHeadRepository;
import com.trism.jesica.persistence.mysql.Repository.business.TbStoreRepository;
import com.trism.jesica.persistence.mysql.Repository.business.TbUserWorkerRepository;
import com.trism.jesica.persistence.mysql.Repository.cash.TbCashWithdrawRepository;
import com.trism.jesica.persistence.mysql.Repository.cust.*;
import com.trism.jesica.persistence.mysql.Repository.order.TbOrderAllRepository;
import com.trism.jesica.persistence.mysql.Repository.order.TbOrderDayRepository;
import com.trism.jesica.persistence.mysql.Repository.paymenthistory.TbPayApprovalRepository;
import com.trism.jesica.persistence.mysql.Repository.paymenthistory.TbPayCancelRepository;
import com.trism.jesica.persistence.mysql.Repository.paymenthistory.TbPayCardDataRepository;
import com.trism.jesica.persistence.mysql.Repository.paymenthistory.TbPayCertRepository;
import com.trism.jesica.persistence.mysql.Repository.service.TbServiceChargeGroupRepository;
import com.trism.jesica.persistence.mysql.Repository.service.TbServiceChargeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@RequiredArgsConstructor
@Service
@Slf4j
public class SettlementService {

    private final JesicaProperties jesicaProperties;

    @Autowired
    private final TbServiceChargeGroupRepository tbServiceChargeGroupRepository;

    @Autowired
    private final TbServiceChargeRepository tbServiceChargeRepository;

    @Autowired
    private final TbHeadRepository tbHeadRepository;

    @Autowired
    private final TbBranchRepository tbBranchRepository;

    @Autowired
    private final TbPayCertRepository tbPayCertRepository;

    @Autowired
    private final TbPayApprovalRepository tbPayApprovalRepository;

    @Autowired
    private final TbPayCancelRepository tbPayCancelRepository;

    @Autowired
    private final TbPayCardDataRepository tbPayCardDataRepository;

    @Autowired
    private final TbOrderDayRepository tbOrderDayRepository;

    @Autowired
    private final TbOrderAllRepository tbOrderAllRepository;

    @Autowired
    private final TbCashWithdrawRepository tbCashWithdrawRepository;

    @Autowired
    private final TbCustCashLogRepository tbCustCashLogList;

    @Autowired
    private final TbHeadCashLogRepository tbHeadCashLogRepository;

    @Autowired
    private final TbBranchCashLogRepository tbBranchCashLogRepository;

    @Autowired
    private final TbStoreCashLogRepository tbStoreCashLogRepository;

    @Autowired
    private final TbWorkerCashLogRepository tbWorkerCashLogRepository;

    @Autowired
    private final TbStoreRepository tbStoreRepository;

    @Autowired
    private final TbUserWorkerRepository tbUserWorkerRepository;




    @Transactional(readOnly = true)
    public List<TbServiceChargeGroup> searchServiceChargeGroup(Map<String,Object> searchValue) {
        Specification<TbServiceChargeGroup> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);

            predicate = (Specification<TbServiceChargeGroup>) SearchUtil.searchServiceChargeGroup(searchValue);
        }
        return searchValue.isEmpty() ? tbServiceChargeGroupRepository.findAll()
                : tbServiceChargeGroupRepository.findAll(predicate);
    }


    @Transactional(readOnly = true)
    public TbServiceChargeGroup searchServiceChargeGroupDetail(Long chargeNo) {
        Optional<TbServiceChargeGroup> tbServiceChargeGroup = tbServiceChargeGroupRepository.findById(chargeNo);
        if(tbServiceChargeGroup.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbServiceChargeGroup.get();
    }

    @Transactional(readOnly = true)
    public TbServiceCharge searchServiceCharge(Long chargeNo, Integer platformType, Integer serviceType) {
        TbServiceCharge tbServiceCharge = tbServiceChargeRepository.findByChargeNoAndPlatformTypeAndServiceType(chargeNo,platformType,serviceType);
        return tbServiceCharge;
    }

    @Transactional(readOnly = true)
    public List<TbServiceChargeDTO> tbServiceChargefindById(Long chargeNo) {
        List<TbServiceChargeDTO> tbServiceCharge = tbServiceChargeRepository.findByChargeNo(chargeNo);

        return tbServiceCharge;
    }
    @Transactional(readOnly = true)
    public TbServiceChargeGroup tbServiceChargeGroupfindById(Long chargeNo) {
        TbServiceChargeGroup tbServiceChargeGroup = tbServiceChargeGroupRepository.findByChargeNo(chargeNo);

        return tbServiceChargeGroup;
    }

    @Transactional(readOnly = true)
    public  List<TbHeadDTO> getHeadAll() {
        List<TbHeadDTO> tbHeadDTO = tbHeadRepository.findByAll();

        return tbHeadDTO;
    }

    @Transactional(readOnly = true)
    public List<TbBranchDTO> getBranchAll() {
       List<TbBranchDTO> tbBranchDTO = tbBranchRepository.findByAll();

        return tbBranchDTO;
    }
/*
    @Transactional(readOnly = true)
    public List<TbPayApproval> getPaymenthistoryList() {
       *//*List<TbPayCardData> tbPayCardData = tbPayCardDataRepository.findAll();*//*
       List<TbPayApproval> tbPayApprovals = tbPayApprovalRepository.findAll();

        return tbPayApprovals;
    }*/

    @Transactional(readOnly = true)
    public List<TbPayApproval> getPaymenthistoryList(Map<String,Object> searchValue) {
        Specification<TbPayApproval> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);

            predicate = (Specification<TbPayApproval>) SearchUtil.searchPaymenthistoryList(searchValue);
        }
        return searchValue.isEmpty() ? tbPayApprovalRepository.findAll()
                : tbPayApprovalRepository.findAll(predicate , Sort.by(Sort.Direction.DESC, "authDtm"));
    }

    @Transactional(readOnly = true)
    public List<TbCashWithdraw> tbCashWithdrawList(Map<String,Object> searchValue) {
        Specification<TbCashWithdraw> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbCashWithdraw>) SearchUtil.searchCashWithdrawList(searchValue);
        }
        return searchValue.isEmpty() ? null
                : tbCashWithdrawRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

  /*  @Transactional(readOnly = true)
    public List<TbCustCashLog> tbCustCashLogList(Map<String,Object> searchValue) {
        Specification<TbCustCashLog> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbCustCashLog>) SearchUtil.searchCustCashLogList(searchValue);
        }
        return searchValue.isEmpty() ? null
                : tbCustCashLogList.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }*/
  @Transactional(readOnly = true)
  public List<TbHeadCashLog> tbHeadCashLogList(Map<String,Object> searchValue) {
      Specification<TbHeadCashLog> predicate = null;
      for (String key : searchValue.keySet()) {
          Object value = searchValue.get(key);
          log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
          searchValue.put(key, (String) value);
          predicate = (Specification<TbHeadCashLog>) SearchUtil.searchHeadCashLogList(searchValue);
      }
      return searchValue.isEmpty() ? null
              : tbHeadCashLogRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
  }

    @Transactional(readOnly = true)
    public List<TbBranchCashLog> tbBranchCashLogList(Map<String,Object> searchValue) {
        Specification<TbBranchCashLog> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbBranchCashLog>) SearchUtil.searchBranchCashLogList(searchValue);
        }
        return searchValue.isEmpty() ? null
                : tbBranchCashLogRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    @Transactional(readOnly = true)
    public List<TbStoreCashLog> tbStoreCashLogList(Map<String,Object> searchValue) {
        Specification<TbStoreCashLog> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbStoreCashLog>) SearchUtil.searchStoreCashLogList(searchValue);
        }
        return searchValue.isEmpty() ? null
                : tbStoreCashLogRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    @Transactional(readOnly = true)
    public List<TbWorkerCashLog> tbWorkerCashLogList(Map<String,Object> searchValue) {
        Specification<TbWorkerCashLog> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbWorkerCashLog>) SearchUtil.searchWorkerCashLogList(searchValue);
        }
        return searchValue.isEmpty() ? null
                : tbWorkerCashLogRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }


    @Transactional(readOnly = true)
    public TbPayCert getCert(Long orderNo) {
        TbPayCert tbPayCert = tbPayCertRepository.findByOrderNo(orderNo);
        return tbPayCert;
    }

    @Transactional(readOnly = true)
    public TbPayApproval getApproval(String tid) {
        TbPayApproval tbPayCert = tbPayApprovalRepository.findByTid(tid);
        return tbPayCert;
    }

    @Transactional(readOnly = true)
    public List<TbPayCancel> getCancel(Long orderNo) {
        List<TbPayCancel> tbPayCancel = tbPayCancelRepository.findByOrderNo(orderNo);
        return tbPayCancel;
    }
    @Transactional(readOnly = true)
    public TbPayCardData getPayCardData(String tid) {
        TbPayCardData tbPayCardData = tbPayCardDataRepository.findByTid(tid);
        return tbPayCardData;
    }

    @Transactional(readOnly = true)
    public TbOrderDay getOrderDay(Long orderNo) {
        TbOrderDay tbOrderDay = tbOrderDayRepository.findByOrderNo(orderNo);
        return tbOrderDay;
    }

    @Transactional(readOnly = true)
    public TbOrderAll getOrderAll(Long orderNo) {
        TbOrderAll tbOrderAll = tbOrderAllRepository.findByOrderNo(orderNo);
        return tbOrderAll;
    }

    @Transactional(readOnly = true)
    public List<TbHead> tbHeadList() {
        List<TbHead> tbHead = tbHeadRepository.findAll();
        return tbHead;
    }
    @Transactional(readOnly = true)
    public List<TbBranch> tbBranchList() {
        List<TbBranch> tbBranch = tbBranchRepository.findAll();
        return tbBranch;
    }
    @Transactional(readOnly = true)
    public List<TbStore> tbStoreList() {
        List<TbStore> tbStore = tbStoreRepository.findAll();
        return tbStore;
    }
    @Transactional(readOnly = true)
    public List<TbUserWorker> tbWorkerList() {
        List<TbUserWorker> tbUserWorker = tbUserWorkerRepository.findAll();
        return tbUserWorker;
    }

    @Transactional(readOnly = true)
    public TbCashWithdraw getTbCashWithdraw(Long withdrawNo) {
        Optional<TbCashWithdraw> tbCashWithdraw = tbCashWithdrawRepository.findById(withdrawNo);
        if(tbCashWithdraw.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbCashWithdraw.get();
    }


}

