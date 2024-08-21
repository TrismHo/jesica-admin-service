package com.trism.jesica.Service;

import com.trism.jesica.Util.SearchUtil;
import com.trism.jesica.Util.SecureUtil;
import com.trism.jesica.dto.TbMannaOrderGoodsDTO;
import com.trism.jesica.dto.TbMannaOrderGoodsOptDTO;
import com.trism.jesica.exception.ErrorCode;
import com.trism.jesica.exception.ServiceException;
import com.trism.jesica.persistence.mysql.Repository.cust.TbCustRepository;
import com.trism.jesica.persistence.mysql.Entitiy.manna.*;
import com.trism.jesica.persistence.mysql.Repository.manna.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@RequiredArgsConstructor
@Service
@Slf4j
public class MannaService {
    private final TbCustRepository tbCustRepository;
    private final TbMannaCouponRegistRepositorySub tbMannaCouponRegistRepositorySub;
    private final TbMannaCouponRegistRepository tbMannaCouponRegistRepository;
    private final TbMannaCouponPublishRepository tbMannaCouponPublishRepository;

    private final TbMannaOrderRepository tbMannaOrderRepository;
    private final TbMannaEventPushRepository tbMannaEventPushRepository;
    private final TbMannaOrderGoodsRepository tbMannaOrderGoodsRepository;
    private final TbMannaOrderGoodsOptRepository tbMannaOrderGoodsOptRepository;
    private final TbMannaCouponRepository tbMannaCouponRepository;


    @Transactional(readOnly = true)
    public Map<String, Object> tbCallAllList(Map<String,Object> searchValue, Pageable pageable) {
        Specification<TbMannaOrder> predicate = null;
        Map<String, Object> map = new HashMap<>();
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbMannaOrder>) SearchUtil.searchCallAllList(searchValue);
        }
        Page<TbMannaOrder> orderPage = tbMannaOrderRepository.findAll(predicate, pageable);

        map.put("orderlist",orderPage.getContent());
        map.put("totalPage",orderPage.getTotalPages());
        map.put("totalElement",orderPage.getTotalElements());
        return map;
    }


    @Transactional(readOnly = true)
    public  Map<String, Object> tbMannaEventPushSearch(Map<String,Object> searchValue, Pageable pageable) {
        Specification<TbMannaEventPush> predicate = null;
        Map<String, Object> map = new HashMap<>();
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbMannaEventPush>) SearchUtil.searchEventPush(searchValue);
        }
        Page<TbMannaEventPush> eventPage = tbMannaEventPushRepository.findAll(predicate, pageable);

        map.put("eventPushList",eventPage.getContent());
        map.put("totalPage",eventPage.getTotalPages());
        map.put("totalElement",eventPage.getTotalElements());

        return map;
    }
    @Transactional(readOnly = true)
    public  Map<String, Object> tbMannaEventPushLogSearch(Map<String,Object> searchValue, Pageable pageable) {
        Specification<TbMannaEventPush> predicate = null;
        Map<String, Object> map = new HashMap<>();
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbMannaEventPush>) SearchUtil.searchEventPushLog(searchValue);
        }
        Page<TbMannaEventPush> eventPage = tbMannaEventPushRepository.findAll(predicate, pageable);

        map.put("eventPushList",eventPage.getContent());
        map.put("totalPage",eventPage.getTotalPages());
        map.put("totalElement",eventPage.getTotalElements());

        return map;
    }

    @Transactional(readOnly = true)
    public TbMannaOrder getCallAllDetail(Long ordNo) {

        Optional<TbMannaOrder> tbCallAll = tbMannaOrderRepository.findById(ordNo);
        if(tbCallAll.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbCallAll.get();
    }
    @Transactional(readOnly = true)
    public List<TbMannaOrderGoodsDTO> getOrderGoods(Long ordNo) {
        List<TbMannaOrderGoodsDTO> tbCallAll = tbMannaOrderGoodsRepository.findByList(ordNo);
        return tbCallAll;

    }
    @Transactional(readOnly = true)
    public List<TbMannaOrderGoodsOptDTO> getOrderGoodOpt(Long ordNo) {
        List<TbMannaOrderGoodsOptDTO> tbCallAll = tbMannaOrderGoodsOptRepository.findByListOption(ordNo);
        return tbCallAll;

    }

    @Transactional(readOnly = true)
    public List<Map<String,Object>> getCustList(String[] custList) {
        List<Map<String,Object>> tbCustList = tbCustRepository.getCustList(custList);
        return tbCustList;

    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getMannaOrder() {
        return tbMannaOrderRepository.findAllManna();
    }

    @Transactional(readOnly = true)
    public TbMannaEventPush getTbEventPushDetail(Long logNo) {
        Optional<TbMannaEventPush> tbMannaEventPush = tbMannaEventPushRepository.findByLogNo(logNo);
        if(!tbMannaEventPush.isPresent()) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbMannaEventPush.get();
    }

    @Transactional(readOnly = true)
    public  Map<String, Object> getCouponPublishList(Map<String,Object> searchValue, Pageable pageable) {
        Specification<TbMannaCouponPublish> predicate = null;
        Map<String, Object> map = new HashMap<>();
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbMannaCouponPublish>) SearchUtil.searchMannaCouponPublish(searchValue);
        }
        Page<TbMannaCouponPublish> mannaCoupons = tbMannaCouponPublishRepository.findAll(predicate, pageable);

        map.put("couponPublishList",mannaCoupons.getContent());
        map.put("totalPage",mannaCoupons.getTotalPages());
        map.put("totalElement",mannaCoupons.getTotalElements());

        return map;
    }

    @Transactional(readOnly = true)
    public  Map<String, Object> getCouponRegistList(Map<String,Object> searchValue, Pageable pageable) {
        Specification<TbMannaCouponRegistSub> predicate = null;
        Map<String, Object> map = new HashMap<>();
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbMannaCouponRegistSub>) SearchUtil.searchMannaCouponRegist(searchValue);
        }
        Page<TbMannaCouponRegistSub> mannaCoupons = tbMannaCouponRegistRepositorySub.findAll(predicate, pageable);

        map.put("couponRegistList",mannaCoupons.getContent());
        map.put("totalPage",mannaCoupons.getTotalPages());
        map.put("totalElement",mannaCoupons.getTotalElements());

        return map;
    }
    @Transactional
    public TbMannaCoupon saveMannaCoupon(TbMannaCoupon tbMannaCoupon) {
        TbMannaCoupon tbMannaCoupon1 = tbMannaCouponRepository.save(tbMannaCoupon);
        return tbMannaCoupon1;
    }
    @Transactional
    public int saveMannaCouponPublish(Long cpnNo, String LoginId, int publishCount) {


        List tbMannaCouponPublishList = new ArrayList();

        List couponLst = SecureUtil.createCouponCode(cpnNo, tbMannaCouponPublishList, publishCount, LoginId);
        List result = tbMannaCouponPublishRepository.saveAll(couponLst);
        return result.size();
    }

}

