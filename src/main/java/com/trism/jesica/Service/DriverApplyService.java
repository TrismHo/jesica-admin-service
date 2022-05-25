package com.trism.jesica.Service;

import com.trism.jesica.Util.SearchUtil;
import com.trism.jesica.dto.TbStoreRentalCarDTO;
import com.trism.jesica.dto.TbStoreRentalCarData;
import com.trism.jesica.exception.ErrorCode;
import com.trism.jesica.exception.ServiceException;
import com.trism.jesica.persistence.Entitiy.call.TbCallAll;
import com.trism.jesica.persistence.Entitiy.call.TbCallCharge;
import com.trism.jesica.persistence.Entitiy.call.TbCallHistory;
import com.trism.jesica.persistence.Entitiy.car.TbRentalInfo;
import com.trism.jesica.persistence.Entitiy.car.TbStoreRentalCar;
import com.trism.jesica.persistence.Entitiy.safe.TbSafenMapping;
import com.trism.jesica.persistence.Entitiy.system.TbSystemCode;
import com.trism.jesica.persistence.Repository.call.TbCallAllRepository;
import com.trism.jesica.persistence.Repository.call.TbCallChargeRepository;
import com.trism.jesica.persistence.Repository.call.TbCallHistoryRepository;
import com.trism.jesica.persistence.Repository.car.TbRentalInfoRepository;
import com.trism.jesica.persistence.Repository.car.TbStoreRentalCarRepository;
import com.trism.jesica.persistence.Repository.safe.TbSafenMappingRepository;
import com.trism.jesica.persistence.Repository.system.TbSystemCodeRepository;
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
import java.util.Optional;

@RequiredArgsConstructor
@Service
@Slf4j
public class DriverApplyService {


    @Autowired
    private final TbCallChargeRepository tbCallChargeRepository;

    @Autowired
    private final TbCallHistoryRepository tbCallHistoryRepository;

    @Autowired
    private final TbSystemCodeRepository tbSystemCodeRepository;

    @Autowired
    private final TbStoreRentalCarRepository tbStoreRentalCarRepository;

    @Autowired
    private final TbSafenMappingRepository tbSafenMappingRepository;

    @Autowired
    private final TbCallAllRepository tbCallAllRepository;

    @Autowired
    private final TbRentalInfoRepository tbRentalInfoRepository;


    @Transactional(readOnly = true)
    public List<TbSystemCode> searchTbSystemCode(String sysType) {
        return tbSystemCodeRepository.findBySysType(sysType);
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

    @Transactional(readOnly = true)
    public List<TbSystemCode> searchTbSystemCodeAll() {
        return tbSystemCodeRepository.findAll();
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
    public TbCallAll getCallAllDetail(Long orderNo) {

        Optional<TbCallAll> tbCallAll = tbCallAllRepository.findById(orderNo);
        if(tbCallAll.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbCallAll.get();
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

    @Transactional(readOnly = true)
    public List<TbSafenMapping> getTbSafenMappingList(String safenNum) {
        List<TbSafenMapping> tbSafenMappings = tbSafenMappingRepository.findTop100ByDataStatusAndSafenNumLikeAndRentalCarNoIsNull(DataStatus.STOP,safenNum);
        return tbSafenMappings;
    }
    @Transactional(readOnly = true)
    public List<TbSafenMapping> getTbSafenMappingListAll() {
        List<TbSafenMapping> tbSafenMappings = tbSafenMappingRepository.findTop100ByDataStatusAndRentalCarNoIsNull(DataStatus.STOP);
        return tbSafenMappings;
    }

    @Transactional
    public int getTbSafenMappingAsssignment(String safenNum,Integer rentalCarNo) {
        int result3 = 0;
        try {
            //기존번호 미할당
            int result = tbSafenMappingRepository.getTbSafenMappingAsssignmentDefault(rentalCarNo);
            if(result == 1){
                //신규할당
                int result2 = tbSafenMappingRepository.getTbSafenMappingAsssignment(rentalCarNo,safenNum);
                if(result2 == 1){
                    result3 = tbStoreRentalCarRepository.updateSafenNum(rentalCarNo,safenNum);
                } else {
                    return 0;
                }
            } else {
                return 0;
            }
        } catch (Exception e){
            return 0;
        }
        return result3;
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
    public List<TbStoreRentalCarDTO> getCarList(Long storeNo) {
        return  tbStoreRentalCarRepository.findByStoreNoAndDataStatus(storeNo,DataStatus.OK);
    }
}

