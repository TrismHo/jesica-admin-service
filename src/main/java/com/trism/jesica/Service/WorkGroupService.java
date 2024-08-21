package com.trism.jesica.Service;

import com.trism.jesica.Util.SearchUtil;
import com.trism.jesica.dto.TbStoreCategoryFoDTO;
import com.trism.jesica.dto.TbSystemCategoryDTO;
import com.trism.jesica.dto.TbUserWorkerDTO;
import com.trism.jesica.exception.ErrorCode;
import com.trism.jesica.exception.ServiceException;
import com.trism.jesica.persistence.mysql.Entitiy.business.*;
import com.trism.jesica.persistence.mysql.Entitiy.goods.TbBranchPrice;
import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreCharge;
import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStorePrice;
import com.trism.jesica.persistence.mysql.Entitiy.service.TbServiceChargeGroup;
import com.trism.jesica.persistence.mysql.Entitiy.service.TbStoreServiceCharge;
import com.trism.jesica.persistence.mysql.Entitiy.storedlvy.TbStoreDlvyCharge;
import com.trism.jesica.persistence.mysql.Entitiy.storedlvy.TbStoreMngCharge;
import com.trism.jesica.persistence.mysql.Entitiy.street.TbDlvyPrice;
import com.trism.jesica.persistence.mysql.Entitiy.street.TbDlvyPriceCharge;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSystemCode;
import com.trism.jesica.persistence.mysql.Entitiy.worker.TbWorkerCharge;
import com.trism.jesica.persistence.mysql.Repository.block.TbDlvyAreaRepository;
import com.trism.jesica.persistence.mysql.Repository.business.*;
import com.trism.jesica.persistence.mysql.Repository.goods.*;
import com.trism.jesica.persistence.mysql.Repository.service.TbServiceChargeGroupRepository;
import com.trism.jesica.persistence.mysql.Repository.service.TbServiceChargeRepository;
import com.trism.jesica.persistence.mysql.Repository.service.TbStoreServiceChargeRepository;
import com.trism.jesica.persistence.mysql.Repository.storedlvy.TbStoreDlvyChargeRepository;
import com.trism.jesica.persistence.mysql.Repository.storedlvy.TbStoreMngChargeRepository;
import com.trism.jesica.persistence.mysql.Repository.street.TbDlvyPriceChargeRepository;
import com.trism.jesica.persistence.mysql.Repository.street.TbDlvyPriceRepository;
import com.trism.jesica.persistence.mysql.Repository.system.TbSystemCodeRepository;
import com.trism.jesica.persistence.mysql.Repository.worker.TbWorkerChargeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
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
public class WorkGroupService {

    @Autowired
    private final TbHeadRepository tbHeadRepository;

    @Autowired
    private final TbBranchRepository tbBranchRepository;

    @Autowired
    private final TbStoreRepository tbStoreRepository;

    @Autowired
    private final TbBrandRepository tbBrandRepository;

    @Autowired
    private final TbUserRepository tbUserRepository;

    @Autowired
    private final TbDeliveryRepository tbDeliveryRepository;

    @Autowired
    private final TbSystemCategoryRepository tbSystemCategoryRepository;

    @Autowired
    private final TbStoreCategoryFoRepository tbStoreCategoryFoRepository;

    @Autowired
    private final TbUserWorkerRepository tbUserWorkerRepository;

    @Autowired
    private final TbSystemCodeRepository tbSystemCodeRepository;

    @Autowired
    private final TbDlvyAreaRepository tbDlvyAreaRepository;


    @Autowired
    private final TbDlvyPriceChargeRepository tbDlvyPriceChargeRepository;

    @Autowired
    private final TbStoreDlvyChargeRepository tbStoreDlvyChargeRepository;

    @Autowired
    private final TbStoreMngChargeRepository tbStoreMngChargeRepository;

    @Autowired
    private final TbServiceChargeRepository tbServiceChargeRepository;

    @Autowired
    private final TbServiceChargeGroupRepository tbServiceChargeGroupRepository;

    @Autowired
    private final TbStoreServiceChargeRepository tbStoreServiceChargeRepository;

    @Autowired
    private final TbWorkerChargeRepository tbWorkerChargeRepository;

    @Autowired
    private final TbStoreChargeRepository tbStoreChargeRepository;

    @Autowired
    private final TbStorePriceRepository tbStorePriceRepository;

    @Autowired
    private final TbDlvyPriceRepository tbDlvyPriceRepository;

    @Autowired
    private final TbBranchPriceRepository tbBranchPriceRepository;


 /*   public static Specification<?> equalsKey(String key ,String value) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(key),"%"+value+"%");
    }*/

/*    public static Specification<?> searchWith(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = getPredicateWithKeyword(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }

    private static List<Predicate> getPredicateWithKeyword(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        for (String key : searchKeyword.keySet()) {
            Object value = searchKeyword.get(key);
            predicate.add(builder.like(
                    root.get(key),"%"+value+"%")
            );
        }
        return predicate;
    }*/

    @Transactional(readOnly = true)
    public List<TbHead> tbHeadSearch(Map<String,Object> searchValue) {
        Specification<TbHead> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            predicate = (Specification<TbHead>) SearchUtil.searchHead(searchValue);
        }
        return searchValue.isEmpty() ? tbHeadRepository.findAll(Sort.by(Sort.Direction.DESC, "insertDate"))
                                     : tbHeadRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    @Transactional(readOnly = true)
    public List<TbBranch> tbBranchSerch(Map<String,Object> searchValue) {
        Specification<TbBranch> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            predicate = (Specification<TbBranch>) SearchUtil.searchBranch(searchValue);

        }
        return searchValue.isEmpty() ? tbBranchRepository.findAll(Sort.by(Sort.Direction.DESC, "insertDate"))
                                     : tbBranchRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    @Transactional(readOnly = true)
    public List<TbStore> tbStoreSearch(Map<String,Object> searchValue) {
        Specification<TbStore> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            predicate = (Specification<TbStore>) SearchUtil.searchStore(searchValue);
        }
        return searchValue.isEmpty() ? tbStoreRepository.findAll(Sort.by(Sort.Direction.DESC, "insertDate"))
                                     : tbStoreRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    @Transactional(readOnly = true)
    public List<TbDelivery> tbDeliverySerch(Map<String,Object> searchValue) {
        Specification<TbDelivery> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            predicate = (Specification<TbDelivery>) SearchUtil.searchDelivery(searchValue);
        }
        return searchValue.isEmpty() ? tbDeliveryRepository.findAll()
                                     : tbDeliveryRepository.findAll(predicate);
    }

    @Transactional(readOnly = true)
    public List<TbUserWorker> tbUserWorkSerch(Map<String,Object> searchValue) {
        Specification<TbUserWorker> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            predicate = (Specification<TbUserWorker>) SearchUtil.searchUserWork(searchValue);
        }
        return searchValue.isEmpty() ? tbUserWorkerRepository.findAll(Sort.by(Sort.Direction.DESC, "insertDate"))
                                     : tbUserWorkerRepository.findAll(predicate,  Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    @Transactional(readOnly = true)
    public List<TbDelivery> getTbDeliveryList(Map<String,Object> searchValue) {
        Specification<TbDelivery> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            predicate = (Specification<TbDelivery>) SearchUtil.searchDeliveryList(searchValue);
        }
        return searchValue.isEmpty() ? tbDeliveryRepository.findAll(Sort.by(Sort.Direction.DESC, "insertDate"))
                                     : tbDeliveryRepository.findAll(predicate,  Sort.by(Sort.Direction.DESC, "insertDate"));
    }


    @Transactional(readOnly = true)
    public TbHead getTbHeadDetail(Long headNo) {
        Optional<TbHead> tbHead = tbHeadRepository.findById(headNo);
        if(tbHead.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbHead.get();
    }

    @Transactional(readOnly = true)
    public TbBranch getTbBranchDetail(Long branchNo) {
        Optional<TbBranch> tbBranch = tbBranchRepository.findById(branchNo);
        if(tbBranch.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbBranch.get();
    }

    @Transactional(readOnly = true)
    public TbStore getTbStoreDetail(Long branchNo) {
        Optional<TbStore> tbStore = tbStoreRepository.findById(branchNo);
        if(tbStore.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbStore.get();
    }

    @Transactional(readOnly = true)
    public List<TbBrand> tbBrandList() {
        return tbBrandRepository.findAll();
    }

    @Transactional(readOnly = true)
    public List<TbSystemCategoryDTO> tbSystemCategorySearch(String catType, Integer catLevel) {

        return tbSystemCategoryRepository.findByCatType(catType,catLevel);
    }

    @Transactional(readOnly = true)
    public List<TbStoreCategoryFoDTO> tbStoreCategorySearch(Long storeNo) {
        return tbStoreCategoryFoRepository.findByStoreNo(storeNo);
    }

    @Transactional(readOnly = true)
    public TbUserWorker getTbUserWorker(Long userNo) {
        Optional<TbUserWorker> tbUserWorker = tbUserWorkerRepository.findById(userNo);
        if(tbUserWorker.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbUserWorker.get();
    }

    @Transactional(readOnly = true)
    public TbUserWorkerDTO getTbUserWorkerDTO(Long workerNo) {
        TbUserWorkerDTO tbUserWorker = tbUserWorkerRepository.findByWorkerNo(workerNo);
        if(ObjectUtils.isEmpty(tbUserWorker)) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbUserWorker;
    }

    @Transactional(readOnly = true)
    public TbStoreCharge tbStoreChargeSearch(Long storeNo) {
        Optional<TbStoreCharge> tbStoreCharge = tbStoreChargeRepository.findById(storeNo);
        if(tbStoreCharge.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbStoreCharge.get();
    }

    @Transactional(readOnly = true)
    public TbStorePrice tbStorePriceSearch(Long storeNo) {
        Optional<TbStorePrice> tbStorePrice = tbStorePriceRepository.findById(storeNo);
        if(tbStorePrice.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbStorePrice.get();
    }

    @Transactional(readOnly = true)
    public TbBranchPrice tbBranchPriceSearch(Long branchNo) {
        Optional<TbBranchPrice> tbBranchPrice = tbBranchPriceRepository.findById(branchNo);
        if(tbBranchPrice.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbBranchPrice.get();
    }

    @Transactional(readOnly = true)
    public TbWorkerCharge getTbWorkerCharge(Long userNo) {
        Optional<TbWorkerCharge> tbWorkerCharge = tbWorkerChargeRepository.findById(Integer.parseInt(userNo.toString()));
        if(tbWorkerCharge.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbWorkerCharge.get();
    }

    @Transactional(readOnly = true)
    public TbDelivery getTbDelivery(Long dlvyNo) {
        Optional<TbDelivery> tbDelivery = tbDeliveryRepository.findById(dlvyNo);
        if(tbDelivery.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbDelivery.get();
    }

    @Transactional(readOnly = true)
    public TbSystemCode getSystemCode(String sysType , String sysCode) {
        return tbSystemCodeRepository.findBySysTypeAndSysCode(sysType,sysCode);
    }


   /* @Transactional(readOnly = true)
    public List<TbDlvyAreaCharge> tbDlvyAreaChargeList(Map<String,Object> searchValue) {
        Specification<TbDlvyAreaCharge> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            predicate = (Specification<TbDlvyAreaCharge>) SearchUtil.tbDlvyAreaChargeList(searchValue);
        }
        return searchValue.isEmpty() ? tbDlvyAreaChargeRepository.findAll(Sort.by(Sort.Direction.DESC, "insertDate"))
                : tbDlvyAreaChargeRepository.findAll(predicate,  Sort.by(Sort.Direction.DESC, "insertDate"));
    }*/

    @Transactional(readOnly = true)
    public List<TbDlvyPriceCharge> tbDlvyStreetChargeList(Map<String,Object> searchValue) {
        Specification<TbDlvyPriceCharge> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            predicate = (Specification<TbDlvyPriceCharge>) SearchUtil.tbDlvyStreetChargeList(searchValue);
        }
        return searchValue.isEmpty() ? tbDlvyPriceChargeRepository.findAll(Sort.by(Sort.Direction.DESC, "insertDate"))
                : tbDlvyPriceChargeRepository.findAll(predicate,  Sort.by(Sort.Direction.DESC, "insertDate"));
    }

  /*  @Transactional(readOnly = true)
    public TbDlvyAreaCharge getTbDeliveryBlock(Long areaChargeNo) {
        Optional<TbDlvyAreaCharge> tbDlvyAreaCharge = tbDlvyAreaChargeRepository.findById(areaChargeNo);
        if(tbDlvyAreaCharge.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbDlvyAreaCharge.get();
    }*/

    @Transactional(readOnly = true)
    public TbDlvyPriceCharge getTbDeliveryPrice(Long priceChargeNo) {
        Optional<TbDlvyPriceCharge> tbDlvyAreaCharge = tbDlvyPriceChargeRepository.findById(priceChargeNo);
        if(tbDlvyAreaCharge.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbDlvyAreaCharge.get();
    }

    @Transactional(readOnly = true)
    public TbStoreDlvyCharge getTbStoreDlvyCharge(Long storeNo) {
        Optional<TbStoreDlvyCharge> tbStoreDlvyCharge = tbStoreDlvyChargeRepository.findById(storeNo);
        if(tbStoreDlvyCharge.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbStoreDlvyCharge.get();
    }

    @Transactional(readOnly = true)
    public TbStoreMngCharge getTbStoreMngCharge(Long storeNo) {
        Optional<TbStoreMngCharge> tbStoreMngCharge = tbStoreMngChargeRepository.findById(storeNo);
        if(tbStoreMngCharge.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbStoreMngCharge.get();
    }
    @Transactional(readOnly = true)
    public TbStoreServiceCharge getTbStoreServiceCharge(Long storeNo, Integer platform) {
        return tbStoreServiceChargeRepository.findByStoreNoAndPlatformType(storeNo, platform);
    }

  /*  @Transactional(readOnly = true)
    public List<TbDlvyAreaCharge> getTbDlvyAreaChargeList(Long branchNo) {
        return  tbDlvyAreaChargeRepository.findByBranchNo(branchNo);
    }*/

    @Transactional(readOnly = true)
    public List<TbDlvyPriceCharge> getTbDlvyPriceChargeList(Long branchNo) {
        return  tbDlvyPriceChargeRepository.findByBranchNo(branchNo);
    }

    @Transactional(readOnly = true)
    public List<TbDlvyPrice> tbDlvyPriceList(Long groupNo,Integer groupType) {
        return  tbDlvyPriceRepository.findByGroupNoAndGroupType(groupNo,groupType);
    }

    /*@Transactional(readOnly = true)
    public List<TbDlvyAreaCharge> getTbDlvyAreaChargeListAll() {
        return  tbDlvyAreaChargeRepository.findByDataStatus(DataStatus.OK);
    }*/

    @Transactional(readOnly = true)
    public List<TbDlvyPriceCharge> getTbDlvyPriceChargeListAll() {
        return  tbDlvyPriceChargeRepository.findAll();
    }
    @Transactional(readOnly = true)
    public List<TbServiceChargeGroup> getTbServiceChargeGroup() {
        return  tbServiceChargeGroupRepository.findAll();
    }

}

