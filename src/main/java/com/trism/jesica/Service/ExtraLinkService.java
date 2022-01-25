package com.trism.jesica.Service;

import com.trism.jesica.Util.SearchUtil;
import com.trism.jesica.persistence.Entitiy.car.TbStoreRentalCar;
import com.trism.jesica.persistence.Entitiy.car.TbRentalInfo;
import com.trism.jesica.persistence.Repository.car.TbRentalInfoRepository;
import com.trism.jesica.persistence.Repository.car.TbStoreRentalCarRepository;
import com.trism.jesica.persistence.type.DataStatus;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Service
@Slf4j
public class ExtraLinkService {

    @Autowired
    private final TbRentalInfoRepository tbRentalInfoRepository;

    @Autowired
    private final TbStoreRentalCarRepository tbStoreRentalCarRepository;


    @Transactional(readOnly = true)
    public List<TbRentalInfo> getRentalInfo(Map<String,Object> searchValue) {
        Specification<TbRentalInfo> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            predicate = (Specification<TbRentalInfo>) SearchUtil.getRentalInfo(searchValue);
        }
        return searchValue.isEmpty() ? tbRentalInfoRepository.findAll(Sort.by(Sort.Direction.DESC, "insertDate"))
                                     : tbRentalInfoRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }



    @Transactional(readOnly = true)
    public List<TbStoreRentalCar> getCarList() {
        return  tbStoreRentalCarRepository.findByDataStatus(DataStatus.OK);
    }


}

