package com.trism.jesica.Service;

import com.trism.jesica.Util.SearchUtil;
import com.trism.jesica.config.JesicaProperties;
import com.trism.jesica.exception.ErrorCode;
import com.trism.jesica.exception.ServiceException;
import com.trism.jesica.persistence.Entitiy.call.TbCallAll;
import com.trism.jesica.persistence.Entitiy.call.TbCallCharge;
import com.trism.jesica.persistence.Entitiy.call.TbCallHistory;
import com.trism.jesica.persistence.Entitiy.order.TbOrderAll;
import com.trism.jesica.persistence.Entitiy.order.TbOrderCharge;
import com.trism.jesica.persistence.Entitiy.order.TbOrderDay;
import com.trism.jesica.persistence.Entitiy.order.TbOrderDayExtra;
import com.trism.jesica.persistence.Entitiy.system.TbSystemCode;
import com.trism.jesica.persistence.Repository.call.TbCallAllRepository;
import com.trism.jesica.persistence.Repository.call.TbCallChargeRepository;
import com.trism.jesica.persistence.Repository.call.TbCallHistoryRepository;
import com.trism.jesica.persistence.Repository.cash.TbCashWithdrawRepository;
import com.trism.jesica.persistence.Repository.order.*;
import com.trism.jesica.persistence.Repository.system.TbSystemCodeRepository;
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
public class OrderService {

    private final JesicaProperties jesicaProperties;

    @Autowired
    private final TbOrderAllRepository tbOrderAllRepository;

    @Autowired
    private final TbOrderAllExtraRepository tbOrderAllExtraRepository;

    @Autowired
    private final TbOrderDayRepository tbOrderDayRepository;

    @Autowired
    private final TbOrderDayExtraRepository tbOrderDayExtraRepository;

    @Autowired
    private final TbCallAllRepository tbCallAllRepository;

    @Autowired
    private final TbSystemCodeRepository tbSystemCodeRepository;

    @Autowired
    private final TbOrderChargeRepository tbOrderChargeRepository;

    @Autowired
    private final TbCallChargeRepository tbCallChargeRepository;

    @Autowired
    private final TbCallHistoryRepository tbCallHistoryRepository;

    @Autowired
    private final TbCashWithdrawRepository tbCashWithdrawRepository;




    @Transactional(readOnly = true)
    public List<TbOrderAll> tbOrderAllList(Map<String,Object> searchValue) {
        Specification<TbOrderAll> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbOrderAll>) SearchUtil.searchOrderAllList(searchValue);
        }
        return searchValue.isEmpty() ? null
                : tbOrderAllRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    @Transactional(readOnly = true)
    public List<TbOrderDay> tbOrderDayList(Map<String,Object> searchValue) {
        Specification<TbOrderDay> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbOrderDay>) SearchUtil.searchOrderDayList(searchValue);
        }
        return searchValue.isEmpty() ? null
                : tbOrderDayRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    @Transactional(readOnly = true)
    public List<TbOrderDayExtra> tbOrderDayExtraList(Map<String,Object> searchValue) {
        Specification<TbOrderDayExtra> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbOrderDayExtra>) SearchUtil.searchOrderDayList(searchValue);
        }
        return searchValue.isEmpty() ? null
                : tbOrderDayExtraRepository.findAll(predicate , Sort.by(Sort.Direction.DESC, "orderDate"));
    }

    @Transactional(readOnly = true)
    public List<TbCallAll> tbCallAllList(Map<String,Object> searchValue) {
        Specification<TbCallAll> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbCallAll>) SearchUtil.searchCallAllList(searchValue);
        }
        return searchValue.isEmpty() ? null
                : tbCallAllRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    @Transactional(readOnly = true)
    public List<TbSystemCode> searchTbSystemCode(String sysType) {
        return tbSystemCodeRepository.findBySysType(sysType);
    }
    @Transactional(readOnly = true)
    public List<TbSystemCode> searchTbSystemCodeAll() {
        return tbSystemCodeRepository.findAll();
    }
    @Transactional(readOnly = true)
    public TbOrderCharge getOrderCharge(Long orderNo) {

        Optional<TbOrderCharge> tbOrderCharge = tbOrderChargeRepository.findById(orderNo);
        if(tbOrderCharge.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbOrderCharge.get();
    }
    @Transactional(readOnly = true)
    public TbOrderDay getOrderDetail(Long orderNo) {

        Optional<TbOrderDay> tbOrderDay = tbOrderDayRepository.findById(orderNo);
        if(tbOrderDay.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbOrderDay.get();
    }
    @Transactional(readOnly = true)
    public TbOrderAll getOrderAllDetail(Long orderNo) {

        Optional<TbOrderAll> tbOrderAll = tbOrderAllRepository.findById(orderNo);
        if(tbOrderAll.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbOrderAll.get();
    }
    @Transactional(readOnly = true)
    public TbCallAll getCallAllDetail(Long orderNo) {

        Optional<TbCallAll> tbCallAll = tbCallAllRepository.findById(orderNo);
        if(tbCallAll.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbCallAll.get();
    }
    @Transactional(readOnly = true)
    public TbCallCharge getCallCharge(Long orderNo) {

        Optional<TbCallCharge> tbCallCharge = tbCallChargeRepository.findById(orderNo);
        if(tbCallCharge.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbCallCharge.get();
    }
    @Transactional(readOnly = true)
    public List<TbCallHistory> getOrderHistory(Long orderNo) {

        List<TbCallHistory> tbCallHistory = tbCallHistoryRepository.findByOrderNo(orderNo);
        return tbCallHistory;
    }


}

