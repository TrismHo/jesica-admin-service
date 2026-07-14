package com.trism.jesica.Service;

import com.trism.jesica.Util.SearchUtil;
import com.trism.jesica.Util.SecureUtil;
import com.trism.jesica.dto.MannaDeliveryStatusDto;
import com.trism.jesica.dto.MannaOrderDetailDto;
import com.trism.jesica.dto.TbMannaOrderGoodsDTO;
import com.trism.jesica.dto.TbMannaOrderGoodsOptDTO;
import com.trism.jesica.exception.ErrorCode;
import com.trism.jesica.exception.ServiceException;
import com.trism.jesica.persistence.mysql.Entitiy.manna.*;
import com.trism.jesica.persistence.mysql.Repository.cust.TbCustRepository;
import com.trism.jesica.persistence.mysql.Repository.manna.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
@Slf4j
public class MannaService {
    private final TbCustRepository tbCustRepository;
    private final TbMannaCouponRegistRepositorySub tbMannaCouponRegistRepositorySub;
    private final TbMannaCouponRegistRepository tbMannaCouponRegistRepository;
    private final TbMannaCouponPublishRepository tbMannaCouponPublishRepository;
    private final TbMannaLogisticsRepository tbMannaLogisticsRepository;
    private final TbMannaLogisticsHistoryRepository tbMannaLogisticsHistoryRepository;
    private final TbMannaLogisticsSurchargeRepository tbMannaLogisticsSurchargeRepository;
    private final TbMannaOrderRepository tbMannaOrderRepository;
    private final TbMannaEventPushRepository tbMannaEventPushRepository;
    private final TbMannaOrderGoodsRepository tbMannaOrderGoodsRepository;
    private final TbMannaOrderGoodsOptRepository tbMannaOrderGoodsOptRepository;
    private final TbMannaCouponRepository tbMannaCouponRepository;

    // 추가
    private final TbMannaStRegistRepository tbMannaStRegistRepository;
    private final TbMannaStRegistFileRepository tbMannaStRegistFileRepository;

    @Transactional(readOnly = true)
    public Map<String, Object> tbCallAllList(Map<String, Object> searchValue, Pageable pageable) {
        Specification<TbMannaOrder> predicate = null;
        Map<String, Object> map = new HashMap<>();

        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, value != null ? value.toString() : null);
            predicate = (Specification<TbMannaOrder>) SearchUtil.searchCallAllList(searchValue);
        }

        Page<TbMannaOrder> orderPage = tbMannaOrderRepository.findAll(predicate, pageable);
        List<TbMannaOrder> orderList = orderPage.getContent();

        if (!orderList.isEmpty()) {
            List<Long> ordNoList = orderList.stream()
                    .map(TbMannaOrder::getOrdNo)
                    .filter(Objects::nonNull)
                    .collect(Collectors.toList());

            List<TbMannaLogistics> logisticsList = tbMannaLogisticsRepository.findByOrdNoIn(ordNoList);

            // ordNo별 가장 최신 물류 1건 선택
            Map<Long, TbMannaLogistics> logisticsMap = logisticsList.stream()
                    .filter(item -> item.getOrdNo() != null)
                    .collect(Collectors.toMap(
                            TbMannaLogistics::getOrdNo,
                            item -> item,
                            (a, b) -> {
                                LocalDateTime aDate = a.getModDate() != null ? a.getModDate() : a.getPutDate();
                                LocalDateTime bDate = b.getModDate() != null ? b.getModDate() : b.getPutDate();

                                if (aDate == null) return b;
                                if (bDate == null) return a;
                                return aDate.isAfter(bDate) ? a : b;
                            }
                    ));

            for (TbMannaOrder order : orderList) {
                TbMannaLogistics logistics = logisticsMap.get(order.getOrdNo());

                if (logistics != null) {
                   /* log.info("order ordNo={}, selected logisticsNo={}, trackingNum={}, statusCode={}",
                            order.getOrdNo(),
                            logistics.getLogisticsNo(),
                            logistics.getTrackingNum(),
                            logistics.getStatusCode());
*/
                    order.setLogisticsNo(logistics.getLogisticsNo());
                    order.setDeliveryTrackingStatus(logistics.getStatusCode());
                    order.setDeliveryTrackingStatusName(convertLogisticsStatusName(logistics.getStatusCode()));
                } else {
         /*           log.info("order ordNo={}, selected logistics = null", order.getOrdNo());*/
                    order.setLogisticsNo(null);
                    order.setDeliveryTrackingStatus(null);
                }
            }
        }

        map.put("orderlist", orderList);
        map.put("totalPage", orderPage.getTotalPages());
        map.put("totalElement", orderPage.getTotalElements());
        return map;
    }

    @Transactional(readOnly = true)
    public MannaDeliveryStatusDto getDeliveryStatus(Long ordNo, Long logisticsNo) {
        TbMannaLogistics logistics = null;

        if (logisticsNo != null) {
            logistics = tbMannaLogisticsRepository.findById(logisticsNo).orElse(null);
        }

        if (logistics == null && ordNo != null) {
            List<TbMannaLogistics> logisticsList = tbMannaLogisticsRepository.findByOrdNo(ordNo);

            if (logisticsList != null && !logisticsList.isEmpty()) {
                logistics = logisticsList.stream().max((a, b) -> {
                    LocalDateTime aDate = a.getModDate() != null ? a.getModDate() : a.getPutDate();
                    LocalDateTime bDate = b.getModDate() != null ? b.getModDate() : b.getPutDate();

                    if (aDate == null && bDate == null) return 0;
                    if (aDate == null) return -1;
                    if (bDate == null) return 1;
                    return aDate.compareTo(bDate);
                }).orElse(null);
            }
        }

        if (logistics == null) {
            return null;
        }

        List<TbMannaLogisticsHistory> historyEntities =
                tbMannaLogisticsHistoryRepository.findByLogisticsNoOrderByTransDateAsc(logistics.getLogisticsNo());

        MannaDeliveryStatusDto dto = new MannaDeliveryStatusDto();
        dto.setOrdNo(logistics.getOrdNo());
        dto.setLogisticsNo(logistics.getLogisticsNo());
        dto.setCourierCode(logistics.getCourierCode());
        dto.setCourierName(logistics.getCourierName());
        dto.setTrackingNum(logistics.getTrackingNum());
        dto.setCurrentStatusCode(logistics.getStatusCode());
        dto.setCurrentStatusName(convertLogisticsStatusName(logistics.getStatusCode()));
        dto.setSenderName(logistics.getSenderName());
        dto.setReceiverName(logistics.getReceiverName());
        dto.setProductName(logistics.getProductName());
        dto.setPutDate(logistics.getPutDate());
        dto.setModDate(logistics.getModDate());
        dto.setEndDate(logistics.getEndDate());

        List<MannaDeliveryStatusDto.MannaDeliveryHistoryDto> historyList = new ArrayList<>();
        for (TbMannaLogisticsHistory history : historyEntities) {
            MannaDeliveryStatusDto.MannaDeliveryHistoryDto item = new MannaDeliveryStatusDto.MannaDeliveryHistoryDto();
            item.setTransDate(history.getTransDate());
            item.setStatusCode(history.getStatusCode());
            item.setStatusText(history.getStatusText());
            item.setLocation(history.getLocation());
            item.setDescription(history.getDescription());
            historyList.add(item);
        }

        dto.setHistoryList(historyList);
        return dto;
    }

    private String convertLogisticsStatusName(String statusCode) {
        if (statusCode == null) return "-";

        switch (statusCode) {
            case "1":
                return "주문접수";
            case "2":
                return "배차";
            case "3":
                return "픽업";
            case "4":
                return "배송중";
            case "5":
                return "배송완료";
            case "6":
                return "취소";
            default:
                return statusCode;
        }
    }

    @Transactional(readOnly = true)
    public Map<String, Object> tbMannaEventPushSearch(Map<String, Object> searchValue, Pageable pageable) {
        Specification<TbMannaEventPush> predicate = null;
        Map<String, Object> map = new HashMap<>();

        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbMannaEventPush>) SearchUtil.searchEventPush(searchValue);
        }

        Page<TbMannaEventPush> eventPage = tbMannaEventPushRepository.findAll(predicate, pageable);

        map.put("eventPushList", eventPage.getContent());
        map.put("totalPage", eventPage.getTotalPages());
        map.put("totalElement", eventPage.getTotalElements());

        return map;
    }

    @Transactional(readOnly = true)
    public MannaOrderDetailDto getCallAllDetail(Long ordNo) {
        TbMannaOrder order = tbMannaOrderRepository.findById(ordNo)
                .orElseThrow(() -> new ServiceException(ErrorCode.BAD_REQUEST));

        MannaOrderDetailDto result = new MannaOrderDetailDto();
        result.setOrder(order);

        if ("6".equals(order.getOrdType())) {
            tbMannaLogisticsRepository.findFirstByOrdNoOrderByLogisticsNoDesc(ordNo)
                    .ifPresent(logistics -> {
                        order.setLogisticsNo(logistics.getLogisticsNo());
                        order.setDeliveryTrackingStatus(logistics.getStatusCode());
                        order.setDeliveryTrackingStatusName(convertLogisticsStatusName(logistics.getStatusCode()));
                        order.setReceiverName(logistics.getReceiverName());
                        result.setLogistics(logistics);
                    });
        }

        return result;
    }

    @Transactional(readOnly = true)
    public List<TbMannaOrderGoodsDTO> getOrderGoods(Long ordNo) {
        return tbMannaOrderGoodsRepository.findByList(ordNo);
    }

    @Transactional(readOnly = true)
    public List<TbMannaOrderGoodsOptDTO> getOrderGoodOpt(Long ordNo) {
        return tbMannaOrderGoodsOptRepository.findByListOption(ordNo);
    }

    @Transactional(readOnly = true)
    public List<Map<String, Object>> getCustList(String[] custList) {
        return tbCustRepository.getCustList(custList);
    }

    @Transactional(readOnly = true)
    public List<Map<String, Object>> getMannaOrder() {
        return tbMannaOrderRepository.findAllManna();
    }



    /**
     * 만나 가맹점 등록 목록 조회
     */
    @Transactional(readOnly = true)
    public Map<String, Object> getMannaStRegistList(Map<String, Object> searchValue, Pageable pageable) {
        Specification<TbMannaStRegist> predicate = null;
        Map<String, Object> map = new HashMap<>();

        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbMannaStRegist>) SearchUtil.searchMannaStRegist(searchValue);
        }

        Page<TbMannaStRegist> mannaCoupons = tbMannaStRegistRepository.findAll(predicate, pageable);

        map.put("stRegistList", mannaCoupons.getContent());
        map.put("totalPage", mannaCoupons.getTotalPages());
        map.put("totalElement", mannaCoupons.getTotalElements());

        return map;
    }

    /**
     * 만나 가맹점 등록 파일 목록 조회
     */
    @Transactional(readOnly = true)
    public List<Map<String, Object>> getMannaStRegistFileList(String stCode) {
        return tbMannaStRegistFileRepository.getMannaStRegistFileList(stCode);
    }

    @Transactional(readOnly = true)
    public TbMannaStRegist getMannaStRegist(String stCode) {
        Optional<TbMannaStRegist> TbMannaStRegist = tbMannaStRegistRepository.findByStCode(stCode);
        if(TbMannaStRegist.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return TbMannaStRegist.get();
    }
    @Transactional(readOnly = true)
    public TbMannaEventPush getTbEventPushDetail(Long logNo) {
        Optional<TbMannaEventPush> tbMannaEventPush = tbMannaEventPushRepository.findByLogNo(logNo);
        if (!tbMannaEventPush.isPresent()) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbMannaEventPush.get();
    }

    @Transactional(readOnly = true)
    public Map<String, Object> getCouponPublishList(Map<String, Object> searchValue, Pageable pageable) {
        Specification<TbMannaCouponPublish> predicate = null;
        Map<String, Object> map = new HashMap<>();

        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbMannaCouponPublish>) SearchUtil.searchMannaCouponPublish(searchValue);
        }

        Page<TbMannaCouponPublish> mannaCoupons = tbMannaCouponPublishRepository.findAll(predicate, pageable);

        map.put("couponPublishList", mannaCoupons.getContent());
        map.put("totalPage", mannaCoupons.getTotalPages());
        map.put("totalElement", mannaCoupons.getTotalElements());

        return map;
    }

    @Transactional(readOnly = true)
    public Map<String, Object> getCouponRegistList(Map<String, Object> searchValue, Pageable pageable) {
        Specification<TbMannaCouponRegistSub> predicate = null;
        Map<String, Object> map = new HashMap<>();

        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbMannaCouponRegistSub>) SearchUtil.searchMannaCouponRegist(searchValue);
        }

        Page<TbMannaCouponRegistSub> mannaCoupons = tbMannaCouponRegistRepositorySub.findAll(predicate, pageable);

        map.put("couponRegistList", mannaCoupons.getContent());
        map.put("totalPage", mannaCoupons.getTotalPages());
        map.put("totalElement", mannaCoupons.getTotalElements());

        return map;
    }

    @Transactional
    public TbMannaCoupon saveMannaCoupon(TbMannaCoupon tbMannaCoupon) {
        return tbMannaCouponRepository.save(tbMannaCoupon);
    }

    @Transactional
    public int saveMannaCouponPublish(Long cpnNo, String loginId, int publishCount) {
        List tbMannaCouponPublishList = new ArrayList();
        List couponLst = SecureUtil.createCouponCode(cpnNo, tbMannaCouponPublishList, publishCount, loginId);
        List result = tbMannaCouponPublishRepository.saveAll(couponLst);
        return result.size();
    }

    /**
     * 온동네 택배 추가요금
     */
    @Transactional(readOnly = true)
    public Map<String, Object> getMannaLogisticsSurchargeList(Map<String, Object> searchValue, Pageable pageable) {
        Specification<TbMannaLogisticsSurcharge> predicate = null;
        Map<String, Object> map = new HashMap<>();

        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbMannaLogisticsSurcharge>) SearchUtil.searchMannaStSurcharge(searchValue);
        }

        Page<TbMannaLogisticsSurcharge> logisticsSurcharge = tbMannaLogisticsSurchargeRepository.findAll(predicate, pageable);

        map.put("logisticsSurcharge", logisticsSurcharge.getContent());
        map.put("totalPage", logisticsSurcharge.getTotalPages());
        map.put("totalElement", logisticsSurcharge.getTotalElements());

        return map;
    }
}
