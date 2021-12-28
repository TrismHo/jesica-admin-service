package com.trism.jesica.Service;

import com.trism.jesica.Util.SearchUtil;
import com.trism.jesica.exception.ErrorCode;
import com.trism.jesica.exception.ServiceException;
import com.trism.jesica.persistence.Entitiy.car.TbStoreRentalCar;
import com.trism.jesica.persistence.Entitiy.safe.TbSafenMapping;
import com.trism.jesica.persistence.Entitiy.safe.TbSafenMappingLog;
import com.trism.jesica.persistence.Repository.car.TbStoreRentalCarRepository;
import com.trism.jesica.persistence.Repository.safe.TbSafenMappingLogRepository;
import com.trism.jesica.persistence.Repository.safe.TbSafenMappingRepository;
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
public class SafeService {

    @Autowired
    private final TbSafenMappingRepository tbSafenMappingRepository;

    @Autowired
    private final TbStoreRentalCarRepository tbStoreRentalCarRepository;

    @Autowired
    private final TbSafenMappingLogRepository tbSafenMappingLogRepository;



    @Transactional(readOnly = true)
    public List<TbSafenMapping> tbSafenMapping(Map<String,Object> searchValue) {
        Specification<TbSafenMapping> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key,(String)value);
            predicate = (Specification<TbSafenMapping>) SearchUtil.searchSafenMapping(searchValue);
        }
        return searchValue.isEmpty() ? tbSafenMappingRepository.findAll(Sort.by(Sort.Direction.DESC, "insertDate"))
                                     : tbSafenMappingRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
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
    public TbSafenMapping getTbSafenMappingDetail(String safenNum) {
        Optional<TbSafenMapping> tbSafenMapping = tbSafenMappingRepository.findById(safenNum);
        if(tbSafenMapping.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbSafenMapping.get();
    }

    @Transactional(readOnly = true)
    public List<TbSafenMappingLog> getTbSafenMappingDetailList(String safenNum) {
        List<TbSafenMappingLog> tbSafenMappingLogs = tbSafenMappingLogRepository.findBySafenNum(safenNum);
        return tbSafenMappingLogs;
    }



}

