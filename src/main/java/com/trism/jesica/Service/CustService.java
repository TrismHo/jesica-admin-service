package com.trism.jesica.Service;

import com.trism.jesica.Util.SearchUtil;
import com.trism.jesica.dto.TbCustCouponDTO;
import com.trism.jesica.persistence.mysql.Entitiy.cust.TbCust;
import com.trism.jesica.persistence.mysql.Entitiy.poinhistory.TbPointHistory;
import com.trism.jesica.persistence.mysql.Repository.coupon.TbCouponPublishRepository;
import com.trism.jesica.persistence.mysql.Repository.cust.TbCustAddrRepository;
import com.trism.jesica.persistence.mysql.Repository.cust.TbCustRepository;
import com.trism.jesica.persistence.mysql.Repository.poinhistory.TbPointHistoryRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RequiredArgsConstructor
@Service
@Slf4j
public class CustService {
    private final TbPointHistoryRepository tbPointHistoryRepository;

    private final TbCustRepository tbCustRepository;

    private final TbCustAddrRepository tbCustAddrRepository;

    private final TbCouponPublishRepository tbCouponPublishRepository;

    @Transactional(readOnly = true)
    public List<TbCust> getCustList(Map<String, Object> searchValue) {
        Specification<TbCust> predicate = null;

        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key, value = [key]:" + key + ", [value]:" + value);
            predicate = (Specification<TbCust>) SearchUtil.searchCustList(searchValue);
        }

        return searchValue.isEmpty() ? tbCustRepository.findAll(Sort.by(Sort.Direction.DESC, "insertDate"))
                                     : tbCustRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    @Transactional(readOnly = true)
    public Map<String, Object> getCustDetail(Long custNo) {
        Map<String, Object> map = new HashMap<>();

        Optional<TbCust> tbCust = tbCustRepository.findById(custNo);
        List<TbCustCouponDTO> tbCustUsedCoupon = tbCouponPublishRepository.findByCustNoAndUseYn(custNo, 1);
        List<TbCustCouponDTO> tbCustUnUsedCoupon = tbCouponPublishRepository.findByCustNoAndUseYn(custNo, 0);
        List<TbPointHistory> tbPointHistory = tbPointHistoryRepository.findByUserNo(custNo);

        if (tbCust.isPresent()) {
            map.put("tbCust", tbCust.get());
        } else {
            map.put("tbCust", null);
        }

        if (ObjectUtils.isNotEmpty(tbCustUsedCoupon)) {
            map.put("tbCustUsedCoupon", tbCustUsedCoupon);
        } else {
            map.put("tbCustUsedCoupon", null);
        }

        if (ObjectUtils.isNotEmpty(tbCustUnUsedCoupon)) {
            map.put("tbCustUnUsedCoupon", tbCustUnUsedCoupon);
        } else {
            map.put("tbCustUnUsedCoupon", null);
        }

        if (ObjectUtils.isNotEmpty(tbPointHistory)) {
            map.put("tbPointHistory", tbPointHistory);
        } else {
            map.put("tbPointHistory", null);
        }


        return map;
    }
}
