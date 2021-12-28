package com.trism.jesica.Service;

import com.trism.jesica.Util.SearchUtil;
import com.trism.jesica.dto.TbStoreCategoryDTO;
import com.trism.jesica.dto.TbStoreGoodsItemDTO;
import com.trism.jesica.exception.ErrorCode;
import com.trism.jesica.exception.ServiceException;
import com.trism.jesica.persistence.Entitiy.car.TbStoreRentalCar;
import com.trism.jesica.persistence.Entitiy.goods.TbStoreGoods;
import com.trism.jesica.persistence.Repository.car.TbStoreRentalCarRepository;
import com.trism.jesica.persistence.Repository.goods.TbStoreCategoryRepository;
import com.trism.jesica.persistence.Repository.goods.TbStoreGoodsItemRepository;
import com.trism.jesica.persistence.Repository.goods.TbStoreGoodsRepository;
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

    @Transactional(readOnly = true)
    public int getTbStoreGoodsItemMaxNo(Long tbStoreGoodsNo) {
        return tbStoreGoodsItemRepository.getTbStoreGoodsItemMaxNo(tbStoreGoodsNo);
    }

    @Transactional(readOnly = true)
    public List<TbStoreCategoryDTO> getTbStoreCategoryList(Long storeNo, Integer storeGoodsNo) {
        return tbStoreCategoryRepository.getTbStoreCategoryList(storeNo, storeGoodsNo);
    }

}

