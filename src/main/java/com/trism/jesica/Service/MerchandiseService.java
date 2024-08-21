package com.trism.jesica.Service;

import com.trism.jesica.Util.SearchUtil;
import com.trism.jesica.dto.TbStoreCategoryDTO;
import com.trism.jesica.dto.TbStoreGoodsItemDTO;
import com.trism.jesica.dto.TbStoreRentalCarData;
import com.trism.jesica.exception.ErrorCode;
import com.trism.jesica.exception.ServiceException;
import com.trism.jesica.persistence.mysql.Entitiy.car.TbStoreRentalCar;
import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreGoods;
import com.trism.jesica.persistence.mysql.Repository.car.TbStoreRentalCarRepository;
import com.trism.jesica.persistence.mysql.Repository.goods.TbStoreCategoryRepository;
import com.trism.jesica.persistence.mysql.Repository.goods.TbStoreGoodsItemRepository;
import com.trism.jesica.persistence.mysql.Repository.goods.TbStoreGoodsRepository;
import com.trism.jesica.persistence.mysql.Repository.safe.TbSafenMappingRepository;
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
public class MerchandiseService {

    @Autowired
    private final TbStoreGoodsRepository tbStoreGoodsRepository;

    @Autowired
    private final TbStoreGoodsItemRepository tbStoreGoodsItemRepository;

    @Autowired
    private final TbStoreCategoryRepository tbStoreCategoryRepository;

    @Autowired
    private final TbStoreRentalCarRepository tbStoreRentalCarRepository;

    @Autowired
    private final TbSafenMappingRepository tbSafenMappingRepository;


    @Transactional(readOnly = true)
    public List<TbStoreGoods> tbStoreGoodsSearch(Map<String,Object> searchValue) {
        Specification<TbStoreGoods> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            if("storeNo".equals(key)){
                log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
                searchValue.put(key,(String)value);
                predicate = (Specification<TbStoreGoods>) SearchUtil.searchStoreGoods(searchValue);
            }
        }
        return searchValue.isEmpty() ? tbStoreGoodsRepository.findAll(Sort.by(Sort.Direction.DESC, "insertDate"))
                                     : tbStoreGoodsRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }


    @Transactional(readOnly = true)
    public List<TbStoreRentalCar> tbStoreRentalCar(Map<String,Object> searchValue) {
        Specification<TbStoreRentalCar> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            if("storeNo".equals(key)){
                log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
                searchValue.put(key,(String)value);
                predicate = (Specification<TbStoreRentalCar>) SearchUtil.searchStoreRentalCar(searchValue);
            }
        }
        return searchValue.isEmpty() ? tbStoreRentalCarRepository.findAll(Sort.by(Sort.Direction.DESC, "insertDate"))
                : tbStoreRentalCarRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    @Transactional(readOnly = true)
    public TbStoreGoods getTbStoreGoodsDetail(Long tbStoreGoodsNo) {
        Optional<TbStoreGoods> tbStoreGoods = tbStoreGoodsRepository.findById(tbStoreGoodsNo);
        if(tbStoreGoods.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbStoreGoods.get();
    }
    @Transactional(readOnly = true)
    public TbStoreRentalCar getTbStoreRentalCarDetail(Integer rentalCarNo) {
        Optional<TbStoreRentalCar> tbStoreRentalCar = tbStoreRentalCarRepository.findById(rentalCarNo);
        if(tbStoreRentalCar.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbStoreRentalCar.get();
    }

    @Transactional(readOnly = true)
    public List<TbStoreGoodsItemDTO> getTbStoreGoodsItemList(Long tbStoreGoodsNo) {
        List<TbStoreGoodsItemDTO> tbStoreGoodsItemList = tbStoreGoodsItemRepository.findByStoreGoodsNo(tbStoreGoodsNo);
        return tbStoreGoodsItemList;
    }
  /*  @Transactional(readOnly = true)
    public List<TbSafenMapping> getTbSafenMappingList() {
        List<TbSafenMapping> tbSafenMappings = tbSafenMappingRepository.findByDataStatusAndRentalCarNoIsNull(DataStatus.STOP);
        return tbSafenMappings;
    }*/

    @Transactional(readOnly = true)
    public int getTbStoreGoodsItemMaxNo(Long tbStoreGoodsNo) {
        return tbStoreGoodsItemRepository.getTbStoreGoodsItemMaxNo(tbStoreGoodsNo);
    }

    @Transactional(readOnly = true)
    public List<TbStoreCategoryDTO> getTbStoreCategoryList(Long storeNo, Integer storeGoodsNo) {
        return tbStoreCategoryRepository.getTbStoreCategoryList(storeNo, storeGoodsNo);
    }

    @Transactional
    public int tbStoreRentCarExcelUpdate(TbStoreRentalCarData tbStoreRentalCarData) {

        //아이디가 없으면 insert
        TbStoreRentalCar resultCar = tbStoreRentalCarRepository.save(tbStoreRentalCarData.insertData());

        //안심번호 매핑
        int result = tbSafenMappingRepository.mappingSafenNumSafenNum(resultCar.getRentalCarNo(),resultCar.getSafenNum());
        if(result < 1) {
            throw new ServiceException(ErrorCode.NOT_MAPPING);
        }
/*
        TbSafenMapping tbSafenMapping = tbSafenMappingRepository.findByRentalCarNo(resultCar.getRentalCarNo());
        int result = tbStoreRentalCarRepository.updateSafenNum(resultCar.getRentalCarNo(),tbSafenMapping.getSafenNum());*/

        return result;
    }

}

