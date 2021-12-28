package com.trism.jesica.Service;

import com.trism.jesica.Util.SearchUtil;
import com.trism.jesica.persistence.Entitiy.goods.TbStoreCategory;
import com.trism.jesica.persistence.Entitiy.storedlvy.TbStoreDlvyCharge;
import com.trism.jesica.persistence.Entitiy.storedlvy.TbStoreMngCharge;
import com.trism.jesica.persistence.Repository.goods.TbStoreCategoryRepository;
import com.trism.jesica.persistence.Repository.storedlvy.TbStoreDlvyChargeRepository;
import com.trism.jesica.persistence.Repository.storedlvy.TbStoreMngChargeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Service
@Slf4j
public class MerchanGroupService {

    @Autowired
    private final TbStoreCategoryRepository tbStoreCategoryRepository;

    @Autowired
    private final TbStoreDlvyChargeRepository tbStoreDlvyChargeRepository;

    @Autowired
    private final TbStoreMngChargeRepository tbStoreMngChargeRepository;

    @Transactional(readOnly = true)
    public List<TbStoreCategory> tbStoreCategotySearch(Map<String,Object> searchValue) {
        Specification<TbStoreCategory> predicate = null;
        Map<String,Object> searchValue2 = new HashMap<>();
       if(searchValue.get("catLevel") == null){
                searchValue.put("catLevel", "LV1");
       }
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            predicate = (Specification<TbStoreCategory>) SearchUtil.searchStoreCategory(searchValue);
        }
        return searchValue.isEmpty() ? null : tbStoreCategoryRepository.findAll(predicate);
    }

    @Transactional(readOnly = true)
    public List<TbStoreMngCharge> tbStoreMngChargeSearch(Map<String,Object> searchValue) {
        Specification<TbStoreMngCharge> predicate = null;
        Map<String,Object> searchValue2 = new HashMap<>();
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            predicate = (Specification<TbStoreMngCharge>) SearchUtil.searchStoreMngCharge(searchValue);
        }
        return searchValue.isEmpty() ? null : tbStoreMngChargeRepository.findAll(predicate);
    }

    @Transactional(readOnly = true)
    public List<TbStoreDlvyCharge> tbStoreDlvyChargeSearch(Map<String,Object> searchValue) {
        Specification<TbStoreDlvyCharge> predicate = null;
        Map<String,Object> searchValue2 = new HashMap<>();
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            predicate = (Specification<TbStoreDlvyCharge>) SearchUtil.searchStoreDlvyCharge(searchValue);
        }
        return searchValue.isEmpty() ? null : tbStoreDlvyChargeRepository.findAll(predicate);
    }

    /*@Transactional(readOnly = true)
    public List<TbStoreDlvyCharge> tbStoreDlvyChargeSearch(Map<String,Object> searchValue) {
        Specification<TbStoreDlvyCharge> predicate = null;
        Map<String,Object> searchValue2 = new HashMap<>();
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            predicate = (Specification<TbStoreDlvyCharge>) SearchUtil.searchStoreDlvyCharge(searchValue);
        }
        return searchValue.isEmpty() ? null : tbStoreDlvyChargeRepository.findAll(predicate);
    }*/
}

