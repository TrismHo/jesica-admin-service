package com.trism.jesica.Service;

import com.trism.jesica.Util.SearchUtil;
import com.trism.jesica.exception.ErrorCode;
import com.trism.jesica.exception.ServiceException;
import com.trism.jesica.persistence.Entitiy.coupon.TbCoupon;
import com.trism.jesica.persistence.Repository.coupon.TbCouponPublishRepository;
import com.trism.jesica.persistence.Repository.coupon.TbCouponRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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
public class CouponService {

    private final TbCouponRepository tbCouponRepository;
    private final TbCouponPublishRepository tbCouponPublishRepository;

    @Transactional(readOnly = true)
    public List<TbCoupon> tbCouponSearch(Map<String, Object> searchValue) {
        Specification<TbCoupon> predicate = null;

        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key, value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String)value);
            predicate = (Specification<TbCoupon>) SearchUtil.searchCouponList(searchValue);
            log.info("@@Coupon predicate::[]", predicate);
        }
        return searchValue.isEmpty() ? null : tbCouponRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    @Transactional(readOnly = true)
    public Map<String, Object> getCouponDetail(Long couponNo) {
        Optional<TbCoupon> tbCoupon = tbCouponRepository.findById(couponNo);
        List<Map<String, Object>> unUsedUsers = tbCouponPublishRepository.findByCouponNoAndUseYn(couponNo, 0);
        List<Map<String, Object>> usedUsers = tbCouponPublishRepository.findByCouponNoAndUseYn(couponNo, 1);

        if (tbCoupon.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }

        log.info("unUsedUsers::", unUsedUsers);
        Map<String, Object> map = new HashMap();
        map.put("tbCoupon", tbCoupon.get());
        map.put("unUsedUsers", unUsedUsers);
        map.put("usedUsers", usedUsers);

        return map;
    }
}
