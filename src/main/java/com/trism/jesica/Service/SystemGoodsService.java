package com.trism.jesica.Service;

import com.trism.jesica.Util.SearchUtil;
import com.trism.jesica.dto.TbSystemCategoryDTO;
import com.trism.jesica.exception.ErrorCode;
import com.trism.jesica.exception.ServiceException;
import com.trism.jesica.persistence.mysql.Entitiy.goods.TbSystemGoods;
import com.trism.jesica.persistence.mysql.Repository.goods.TbSystemCategoryRepository;
import com.trism.jesica.persistence.mysql.Repository.goods.TbSystemGoodsRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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
public class SystemGoodsService {

    private final TbSystemGoodsRepository tbSystemGoodsRepository;
    private final TbSystemCategoryRepository tbSystemCategoryRepository;


    @Transactional(readOnly = true)
    public List<TbSystemGoods> tbStoreGoodsSearch(Map<String,Object> searchValue) {
        Specification<TbSystemGoods> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            predicate = (Specification<TbSystemGoods>) SearchUtil.searchSystemGoods(searchValue);
        }
        return searchValue.isEmpty() ? tbSystemGoodsRepository.findAll(Sort.by(Sort.Direction.DESC, "insertDate"))
                                     : tbSystemGoodsRepository.findAll(predicate,  Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    @Transactional(readOnly = true)
    public List<TbSystemCategoryDTO> tbSystemCategoryList(Integer catLevel) {
        //return tbSystemCategoryRepository.findAllCategory();
        return tbSystemCategoryRepository.findByCatType("IP",catLevel);
    }
    @Transactional(readOnly = true)
    public List<TbSystemCategoryDTO> tbSystemCategoryList() {
        return tbSystemCategoryRepository.findAllCategory();
    }
    @Transactional(readOnly = true)
    public TbSystemCategoryDTO findByCatCode(String catCode) {
        //return tbSystemCategoryRepository.findAllCategory();
        return tbSystemCategoryRepository.findByCatCode(catCode);
    }

    @Transactional(readOnly = true)
    public TbSystemGoods getSystemGoods(Long goodsNo) {
        Optional<TbSystemGoods> tbSystemGoods = tbSystemGoodsRepository.findById(goodsNo);
        if(tbSystemGoods.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbSystemGoods.get();
    }


}

