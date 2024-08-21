package com.trism.jesica.Service;

import com.trism.jesica.Util.SearchUtil;
import com.trism.jesica.exception.ErrorCode;
import com.trism.jesica.exception.ServiceException;
import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreOption;
import com.trism.jesica.persistence.mysql.Repository.goods.TbStoreOptionRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@RequiredArgsConstructor
@Service
@Slf4j
public class MerchanExtraService {

    @Autowired
    private final TbStoreOptionRepository tbStoreOPtionRepository;

    @Transactional(readOnly = true)
    public List<TbStoreOption> tbStoreOptionSearch(Map<String,Object> searchValue) {
        Specification<TbStoreOption> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);

            predicate = (Specification<TbStoreOption>) SearchUtil.searchStoreOptionSpeci(searchValue);
        }
        return searchValue.isEmpty() ? tbStoreOPtionRepository.findAll()
                                     : tbStoreOPtionRepository.findAll(predicate);
    }


    @Transactional(readOnly = true)
    public TbStoreOption tbStoreOptionSearchDetail(Long tbStoreOptNo) {
        Optional<TbStoreOption> tbStoreOption = tbStoreOPtionRepository.findById(tbStoreOptNo);
        if(tbStoreOption.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbStoreOption.get();
    }


    @Transactional(readOnly = true)
    public int getTbStoreOptionItemMaxNo(Long tbStoreGoodsNo) {
        return tbStoreOPtionRepository.getTbStoreOptionItemMaxNo(tbStoreGoodsNo);
    }
}

