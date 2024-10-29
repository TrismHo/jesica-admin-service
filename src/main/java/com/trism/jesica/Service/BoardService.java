package com.trism.jesica.Service;

import com.trism.jesica.Util.SearchUtil;
import com.trism.jesica.config.JesicaProperties;
import com.trism.jesica.dto.TbAppBannerLocationDTO;
import com.trism.jesica.dto.TbCustCouponDTO;
import com.trism.jesica.dto.TbCustLocationDTO;
import com.trism.jesica.exception.ErrorCode;
import com.trism.jesica.exception.ServiceException;
import com.trism.jesica.persistence.mysql.Entitiy.board.*;
import com.trism.jesica.persistence.mysql.Entitiy.coupon.TbCoupon;
import com.trism.jesica.persistence.mysql.Entitiy.cust.TbCust;
import com.trism.jesica.persistence.mysql.Entitiy.event.TbEvent;
import com.trism.jesica.persistence.mysql.Entitiy.poinhistory.TbPointHistory;
import com.trism.jesica.persistence.mysql.Repository.board.*;
import com.trism.jesica.persistence.mysql.Repository.coupon.TbCouponPublishRepository;
import com.trism.jesica.persistence.mysql.Repository.coupon.TbCouponRepository;
import com.trism.jesica.persistence.mysql.Repository.cust.TbCustAddrRepository;
import com.trism.jesica.persistence.mysql.Repository.cust.TbCustLocationRepository;
import com.trism.jesica.persistence.mysql.Repository.cust.TbCustRepository;
import com.trism.jesica.persistence.mysql.Repository.event.TbEventRepository;
import com.trism.jesica.persistence.mysql.Repository.manna.TbMannaEventPushRepository;
import com.trism.jesica.persistence.mysql.Repository.poinhistory.TbPointHistoryRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@RequiredArgsConstructor
@Service
@Slf4j
public class BoardService {
    private final TbMannaEventPushRepository tbMannaEventPushRepository;
    private final TbAppBannerLocationRepository tbAppBannerLocationRepository;
    private final TbCustLocationRepository tbCustLocationRepository;


    private final JesicaProperties jesicaProperties;

    private final TbNoticePlatformRepository tbNoticePlatformRepository;

    private final TbNoticeCompanyRepository tbNoticeCompanyRepository;

    private final TbNoticeWorkerRepository tbNoticeWorkerRepository;

    private final TbEventRepository tbEventRepository;

    private final TbNoticeReleaseRepository tbNoticeReleaseRepository;

    private final TbAppBannerRepository tbAppBannerRepository;

    private final TbCouponRepository tbCouponRepository;
    private final TbCouponPublishRepository tbCouponPublishRepository;

    private final TbCustRepository tbCustRepository;

    private final TbCustAddrRepository tbCustAddrRepository;
    private final TbPointHistoryRepository tbPointHistoryRepository;




    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public List<TbNoticePlatform> tbNoticePlatFormSearch(Map<String,Object> searchValue) {
        Specification<TbNoticePlatform> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, value);
            predicate = (Specification<TbNoticePlatform>) SearchUtil.searchNoticePlatform(searchValue);
        }
        return searchValue.isEmpty() ? null
                : tbNoticePlatformRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    public Map<String, Object> tbNoticePlatFormSearch(Map<String,Object> searchValue, Pageable pageable) {
        Specification<TbNoticePlatform> predicate = null;
        Map<String, Object> map = new HashMap<>();
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbNoticePlatform>) SearchUtil.searchNoticePlatform(searchValue);
        }
        Page<TbNoticePlatform> TbNoticePlatformPage = tbNoticePlatformRepository.findAll(predicate, pageable);
        ;
        /*List<TbMannaOrder> list = searchValue.isEmpty() ? null
                : tbMannaOrderRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "ordDate"));*/

        map.put("platformList",TbNoticePlatformPage.getContent());
        map.put("totalPage",TbNoticePlatformPage.getTotalPages());
        map.put("totalElement",TbNoticePlatformPage.getTotalElements());
        return map;
    }

    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public TbNoticePlatform getTbNoticePlatFormDetail(Long noticeNo) {
        Optional<TbNoticePlatform> tbNoticePlatForm = tbNoticePlatformRepository.findById(noticeNo);
        if(tbNoticePlatForm.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbNoticePlatForm.get();
    }
    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public TbEvent getTbNoticeEventDetail(Long eventNo) {
        Optional<TbEvent> tbNoticePlatForm = tbEventRepository.findById(eventNo);
        if(tbNoticePlatForm.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbNoticePlatForm.get();
    }

    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public TbNoticePlatform getTbNoticePlatFormUserDetail(Long noticeNo, Integer platformType) {
        TbNoticePlatform tbNoticePlatForm = tbNoticePlatformRepository.findByNoticeNoAndGroupTypeAndPlatformType(noticeNo, 5, platformType);

        if (ObjectUtils.isEmpty(tbNoticePlatForm)) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }

        return tbNoticePlatForm;
    }

    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public List<TbNoticeCompany> tbNoticeCompanySearch(Map<String,Object> searchValue) {
        Specification<TbNoticeCompany> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key,(String)value);
            predicate = (Specification<TbNoticeCompany>) SearchUtil.searchNoticeCompany(searchValue);
        }
        return searchValue.isEmpty() ? null
                : tbNoticeCompanyRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public TbNoticeCompany getTbNoticeCompanyDetail(Long tbStoreGoodsNo) {
        Optional<TbNoticeCompany> tbNoticePlatForm = tbNoticeCompanyRepository.findById(tbStoreGoodsNo);
        if(tbNoticePlatForm.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbNoticePlatForm.get();
    }


    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public List<TbNoticeWorker> tbNoticeWorkerSearch(Map<String,Object> searchValue) {
        Specification<TbNoticeWorker> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key,(String)value);
            predicate = (Specification<TbNoticeWorker>) SearchUtil.searchNoticeWorker(searchValue);
        }
        return searchValue.isEmpty() ? null
                : tbNoticeWorkerRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public TbNoticeWorker getTbNoticeWorkerDetail(Long tbStoreGoodsNo) {
        Optional<TbNoticeWorker> tbNoticePlatForm = tbNoticeWorkerRepository.findById(tbStoreGoodsNo);
        if(tbNoticePlatForm.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbNoticePlatForm.get();
    }

    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public List<TbEvent> tbEventSearch(Map<String,Object> searchValue) {
        Specification<TbEvent> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, value);
            predicate = (Specification<TbEvent>) SearchUtil.searchEvent(searchValue);
        }
        return searchValue.isEmpty() ? tbEventRepository.findAll(Sort.by(Sort.Direction.DESC, "insertDate"))
                : tbEventRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    public Map<String, Object> tbEventSearch(Map<String,Object> searchValue, Pageable pageable) {
        Specification<TbEvent> predicate = null;
        Map<String, Object> map = new HashMap<>();
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbEvent>) SearchUtil.searchEvent(searchValue);
        }
        Page<TbEvent> TbEventPage = tbEventRepository.findAll(predicate, pageable);
        ;
        /*List<TbMannaOrder> list = searchValue.isEmpty() ? null
                : tbMannaOrderRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "ordDate"));*/

        map.put("eventList",TbEventPage.getContent());
        map.put("totalPage",TbEventPage.getTotalPages());
        map.put("totalElement",TbEventPage.getTotalElements());
        return map;
    }

    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public List<TbNoticeRelease> tbReleaseSearch(Map<String,Object> searchValue) {
        Specification<TbNoticeRelease> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key,(String)value);
            predicate = (Specification<TbNoticeRelease>) SearchUtil.searchRelese(searchValue);
        }
        return searchValue.isEmpty() ? tbNoticeReleaseRepository.findAll(Sort.by(Sort.Direction.DESC, "insertDate"))
                : tbNoticeReleaseRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public List<Map<String,Object>> getUpdateEventListLimit(Integer platformType) {
        return tbEventRepository.findAllLimit(platformType);
    }



    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public TbEvent getTbEventDetail(Long eventNo) {
        Optional<TbEvent> tbNoticePlatForm = tbEventRepository.findById(eventNo);
        if(!tbNoticePlatForm.isPresent()) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbNoticePlatForm.get();
    }

    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public TbEvent getTbEventDetail(Long eventNo, Integer platformType) {
        Optional<TbEvent> tbNoticePlatForm = tbEventRepository.findByEventNoAndPlatformType(eventNo, platformType);
        if(!tbNoticePlatForm.isPresent()) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbNoticePlatForm.get();
    }


    @Transactional(readOnly = true , value = "mysqlTransactionManager")
    public TbNoticeRelease getTbReleaseDetail(Long noticeId,Integer platformType) {
        Optional<TbNoticeRelease> tbNoticeRelease = tbNoticeReleaseRepository.findByNoticeNoAndPlatformType(noticeId,platformType);
        if(tbNoticeRelease.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbNoticeRelease.get();
    }

    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public List<TbAppBanner> tbAppBannerSearch(Map<String,Object> searchValue) {
        Specification<TbAppBanner> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key,(String)value);
            predicate = (Specification<TbAppBanner>) SearchUtil.searchAppBanner(searchValue);
        }
        List<Sort.Order> orders = new ArrayList<>();

        Sort.Order viewYn = new Sort.Order(Sort.Direction.DESC, "viewYn");
        Sort.Order viewOrder = new Sort.Order(Sort.Direction.ASC, "viewOrder");
        Sort.Order insertDateOrder = new Sort.Order(Sort.Direction.DESC, "insertDate");
        orders.add(viewYn);
        orders.add(viewOrder);
        orders.add(insertDateOrder);

        return searchValue.isEmpty() ? null
                : tbAppBannerRepository.findAll(predicate, Sort.by(orders));
    }

    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public TbAppBanner tbAppBannerDetail(Long bannerNo) {
        Optional<TbAppBanner> tbAppBanner = tbAppBannerRepository.findById(bannerNo);

        if (tbAppBanner.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }

        return tbAppBanner.get();
    }
    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public List<TbAppBannerLocationDTO> getAppBannerLocation(Long bannerNo) {
        return tbAppBannerLocationRepository.findByBannerNo(bannerNo);
    }

    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public List<Map<String,Object>> getUpdateListLimit() {
        return tbNoticeReleaseRepository.findAllLimit();
    }
    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public List<Map<String,Object>> getPlatformListLimit(Integer platformType ) {
        return tbNoticePlatformRepository.findAllLimit(platformType);
    }

    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public List<TbCoupon> tbCouponSearch(Map<String, Object> searchValue) {
        Specification<TbCoupon> predicate = null;

        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key, value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String)value);
            predicate = (Specification<TbCoupon>) SearchUtil.searchCouponList(searchValue);
            log.info("@@Coupon predicate::[]", predicate);
        }
        return searchValue.isEmpty() ? null : tbCouponRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    public Map<String, Object> getCustListPop(Map<String,Object> searchValue, Pageable pageable) {
        Specification<TbCust> predicate = null;
        Map<String, Object> map = new HashMap<>();

        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbCust>) SearchUtil.searchCustListPop(searchValue);
        }
        Page<TbCust> custPage = tbCustRepository.findAll(predicate, pageable);
        ;
        /*List<TbMannaOrder> list = searchValue.isEmpty() ? null
                : tbMannaOrderRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "ordDate"));*/

        map.put("custList",custPage.getContent());
        map.put("totalPage",custPage.getTotalPages());
        map.put("totalElement",custPage.getTotalElements());
        return map;
    }



    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public List<TbCust> getCustAll(Map<String, Object> searchValue) {
        Specification<TbCust> predicate = null;

        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key, value = [key]:" + key + ", [value]:" + value);
            predicate = (Specification<TbCust>) SearchUtil.searchCustListPop(searchValue);
        }

        return searchValue.isEmpty() ? tbCustRepository.findAll(Sort.by(Sort.Direction.DESC, "insertDate"))
                : tbCustRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    public Map<String, Object> getCustList(Map<String,Object> searchValue, Pageable pageable) {
        Specification<TbCust> predicate = null;
        Map<String, Object> map = new HashMap<>();
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbCust>) SearchUtil.searchCustList(searchValue);
        }
        Page<TbCust> custPage = tbCustRepository.findAll(predicate, pageable);
        ;
        /*List<TbMannaOrder> list = searchValue.isEmpty() ? null
                : tbMannaOrderRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "ordDate"));*/

        map.put("custList",custPage.getContent());
        map.put("totalPage",custPage.getTotalPages());
        map.put("totalElement",custPage.getTotalElements());
        return map;
    }

    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public Map<String, Object> getCustDetail(Long custNo) {
        Map<String, Object> map = new HashMap<>();

        Map<String,Object> tbCust = tbCustRepository.getCustDetail(custNo);
        List<TbCustCouponDTO> tbCustUsedCoupon = tbCouponPublishRepository.findByCustNoAndUseYn(custNo, 1);
        List<TbCustCouponDTO> tbCustUnUsedCoupon = tbCouponPublishRepository.findByCustNoAndUseYn(custNo, 0);
        List<TbPointHistory> tbPointHistory = tbPointHistoryRepository.findByUserNo(custNo);
        List<TbCustLocationDTO> tbCustLocation = tbCustLocationRepository.findByCustNo(custNo);
        map.put("tbCust", tbCust);
       /* if (tbCust.isPresent()) {
            map.put("tbCust", tbCust.get());
        } else {
            map.put("tbCust", null);
        }*/

        if (ObjectUtils.isNotEmpty(tbCustUsedCoupon)) {
            map.put("tbCustUsedCoupon", tbCustUsedCoupon);
        } else {
            map.put("tbCustUsedCoupon", null);
        }

        if (ObjectUtils.isNotEmpty(tbCustLocation)) {
            map.put("tbCustLocation", tbCustLocation);
        } else {
            map.put("tbCustLocation", null);
        }

        if (ObjectUtils.isNotEmpty(tbCustUnUsedCoupon)) {
            map.put("tbCustUnUsedCoupon", tbCustUnUsedCoupon);
        } else {
            map.put("tbCustUnUsedCoupon", null);
        }

        if (ObjectUtils.isNotEmpty(tbPointHistory)) {
            map.put("tbPointHistory", tbPointHistory);
        } else {
            map.put("tbPointHistory", null);
        }
        return map;
    }
    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public List<Map<String,Object>> getFriends(Long custNo) {
        Map<String, Object> map = new HashMap<>();

        List<Map<String,Object>> friends = tbCustRepository.getFriends(custNo);


       /* if (tbCust.isPresent()) {
            map.put("tbCust", tbCust.get());
        } else {
            map.put("tbCust", null);
        }*/
        return friends;
    }
    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public Map<String, Object> getCouponDetail(Long couponNo) {
        Optional<TbCoupon> tbCoupon = tbCouponRepository.findById(couponNo);
        List<Map<String, Object>> unUsedUsers = tbCouponPublishRepository.findByCouponNoAndUseYn(couponNo, 0);
        List<Map<String, Object>> usedUsers = tbCouponPublishRepository.findByCouponNoAndUseYn(couponNo, 1);

        if (tbCoupon.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }

        log.info("unUsedUsers::", unUsedUsers);
        Map<String, Object> map = new HashMap();
        map.put("tbCoupon", tbCoupon.get());
        map.put("unUsedUsers", unUsedUsers);
        map.put("usedUsers", usedUsers);

        return map;
    }

}

