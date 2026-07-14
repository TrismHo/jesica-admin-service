package com.trism.jesica.Util;


import com.trism.jesica.persistence.mysql.Entitiy.board.TbAppBanner;
import com.trism.jesica.persistence.mysql.Entitiy.board.TbAppBannerLocation;
import com.trism.jesica.persistence.mysql.Entitiy.board.TbNoticePlatform;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbBranch;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbHead;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbStore;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbUserWorker;
import com.trism.jesica.persistence.mysql.Entitiy.cust.*;
import com.trism.jesica.persistence.mysql.Entitiy.event.TbEvent;
import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaOrder;
import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaStRegist;
import com.trism.jesica.persistence.mysql.type.CatLevel;
import com.trism.jesica.persistence.mysql.type.DataStatus;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Slf4j
public class SearchUtil {

    public static Specification<?> searchWith(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = getPredicateWithKeyword(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }

    public static Specification<?> searchEqual(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = getPredicateEqualKeyword(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }

    public static Specification<?> searchStoreOptionSpeci(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchStoreOptionSpeciKeyword(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }

    public static Specification<?> searchStoreCategory(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchStoreCategory(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> searchStoreMngCharge(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchStoreMngCharge(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> searchStoreDlvyCharge(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchStoreDlvyCharge(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    /*public static Specification<?> searchStoreDlvyCharge(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchStoreDlvyCharge(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }*/

    public static Specification<?> searchHead(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchHead(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }

    public static Specification<?> searchBranch(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchBranch(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }

    public static Specification<?> searchStore(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchStore(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }

    public static Specification<?> searchStoreGoods(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchStoreGoods(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }

    public static Specification<?> searchStoreRentalCar(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchStoreRentalCar(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }

    public static Specification<?> searchSafenMapping(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchSafenMapping(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }

    public static Specification<?> searchDelivery(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchDelivery(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }

    public static Specification<?> searchUserWork(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchUserWork(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }

    public static Specification<?> searchSystemGoods(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchSystemGoods(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> searchDeliveryList(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchDeliveryList(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> tbDlvyAreaChargeList(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = tbDlvyAreaChargeList(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> tbDlvyStreetChargeList(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = tbDlvyStreetChargeList(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<TbNoticePlatform> searchNoticePlatform(Map<String, Object> searchKeyword) {
        return (Specification<TbNoticePlatform>) ((root, query, builder) -> {
            List<Predicate> predicate = searchNoticePlatform(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> searchNoticeCompany(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchNoticeCompany(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> searchNoticeWorker(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchNoticeWorker(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<TbAppBanner> searchAppBanner(Map<String, Object> searchKeyword) {
        return (root, query, builder) -> {
            List<Predicate> predicate = searchAppBanner(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        };
    }
    public static Specification<TbEvent> searchEvent(Map<String, Object> searchKeyword) {
        return (Specification<TbEvent>) ((root, query, builder) -> {
            List<Predicate> predicate = searchEvent(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<TbMannaStRegist> searchMannaStRegist(Map<String, Object> searchKeyword) {
        return (Specification<TbMannaStRegist>) ((root, query, builder) -> {
            List<Predicate> predicate = searchStRegist(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }

    public static Specification<TbEvent> fetchService() {
        return (root, query, builder) -> {

            // count 쿼리 아닐때만 fetch
            if (!Long.class.equals(query.getResultType()) &&
                    !long.class.equals(query.getResultType())) {

                root.fetch("service", JoinType.LEFT);
                query.distinct(true);
            }

            return builder.conjunction();
        };
    }
    public static Specification<TbNoticePlatform> noticeSpec() {
        return (root, query, builder) -> {

            // count 쿼리 아닐때만 fetch
            if (!Long.class.equals(query.getResultType()) &&
                    !long.class.equals(query.getResultType())) {

                root.fetch("service", JoinType.LEFT);
                query.distinct(true);
            }

            return builder.conjunction();
        };
    }
    /*public static Specification<TbAppBanner> bannerSpec(Integer serviceType) {
        return (root, query, builder) -> {

            boolean isCountQuery =
                    Long.class.equals(query.getResultType()) || long.class.equals(query.getResultType());
            if (isCountQuery) return builder.conjunction();

            if (serviceType != null && serviceType == 0) {
                root.fetch("service", JoinType.LEFT);
                query.distinct(true);
            }

            // serviceType=1(특산물): locations 화면은 따로 있으니 여기선 아무 것도 안 함

            return builder.conjunction();
        };
    }*/

    public static Specification<TbAppBanner> bannerFetchSpec(Integer serviceType) {
        return (root, query, builder) -> {
            boolean isCount =
                    Long.class.equals(query.getResultType()) || long.class.equals(query.getResultType());
            if (isCount) return builder.conjunction();

            if (serviceType != null && serviceType == 0) {
                root.fetch("service", JoinType.LEFT);
                query.distinct(true);
            }
            return builder.conjunction();
        };
    }


    public static Specification<?> searchEventPush(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchEventPush(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
   /* public static Specification<?> searchEventPushLog(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchEventPushLog(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }*/
    public static Specification<?> searchMannaCouponPublish(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchMannaCouponPublish(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> searchMannaCouponRegist(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchMannaCouponRegist(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }

    public static Specification<?> searchMannaStSurcharge(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchMannaStSurcharge(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> searchRelese(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchRelese(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> searchServiceChargeGroup(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchServiceChargeGroup(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> searchOrderAllList(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchOrderAllList(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> searchCashWithdrawList(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchCashWithdrawList(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
   /* public static Specification<?> searchCustCashLogList(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchCustCashLogList(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }*/
    public static Specification<?> searchHeadCashLogList(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchHeadCashLogList(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> searchBranchCashLogList(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchBranchCashLogList(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> searchStoreCashLogList(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchStoreCashLogList(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> searchWorkerCashLogList(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchWorkerCashLogList(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> searchCallAllList(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchCallAllList(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> searchOrderDayList(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchOrderDayList(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }

    public static Specification<?> searchPaymenthistoryList(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchPaymenthistoryList(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> getRentalInfo(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchRentalInfoList(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> searchUserList(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchUserList(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> searchCouponList(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchCouponList(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<TbCust> searchCustList(Map<String, Object> searchKeyword) {
        return (root, query, builder) -> {
            query.distinct(true);
            List<Predicate> predicates = searchCustList(searchKeyword, root, query, builder);
            return builder.and(predicates.toArray(new Predicate[0]));
        };
    }
    public static Specification<?> searchCustListPop(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchCustListPop(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> searchLibraryList(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchLibraryList(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }
    public static Specification<?> searchMannaAllList(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchMannaAllList(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }

    public static Specification<?> searchAppService(Map<String,Object> param){
        return (root, query, builder) -> {
            List<Predicate> predicate =
                    searchAppService(param, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        };
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
    }

    private static List<Predicate> getPredicateEqualKeyword(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        for (String key : searchKeyword.keySet()) {
            Object value = searchKeyword.get(key);
            predicate.add(builder.equal(
                    root.get(key),value)
            );
        }
        return predicate;
    }

    private static List<Predicate> searchStoreOptionSpeciKeyword(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;

        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                if("storeNo".equals(key)){
                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    }
                } else if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                } else if ("optName".equals(key)  && value != "") {
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("mandatoryYn".equals(key)) {
                    if (value == null || "null".equals(value)) continue;
                    Boolean bool = Boolean.valueOf((String)value);
                    predicate.add(builder.equal(root.get(key),bool));
                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);

                }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

    private static List<Predicate> searchStoreCategory(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        for (String key : searchKeyword.keySet()) {
            Object value = searchKeyword.get(key);

            if("storeNo".equals(key)){
                if("".equals(value) ) {
                    predicate.add(builder.equal(root.get(key),0));
                } else {
                    predicate.add(builder.equal(root.get(key),value));
                }
            } else if ("catLevel".equals(key)) {
                CatLevel catLevel = null;

                if("".equals(value) || value == null) {
                    catLevel = CatLevel.valueOf("LV1");
                } else {
                    catLevel = CatLevel.valueOf(value.toString());
                }
                predicate.add(builder.equal(root.get(key),catLevel));
            } else if ("parentCatNo".equals(key)  && value != "") {
                predicate.add(builder.equal(root.get(key), value));
            }
        }
        return predicate;
    }



    private static List<Predicate> searchHead(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        DataStatus delDataStatus;
        delDataStatus = DataStatus.valueOf("DELETE");
        predicate.add(builder.notEqual(root.get("dataStatus"),delDataStatus));
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                if("brandNo".equals(key)){
                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    }
                } else if("headNo".equals(key)){
                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    }
                }
                else if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    if("".equals(value) || value == null) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                } else if ("headName".equals(key)  && value != "") {
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("startDate".equals(key) && value != "") {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);

                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);

                }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
            } catch (Exception e){
             e.printStackTrace();
            }
        return predicate;
    }

    private static List<Predicate> searchBranch(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                if("headNo".equals(key)){
                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    }
                } else if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                } else if ("branchName".equals(key)  && value != "") {
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("startDate".equals(key) && value != "") {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);

                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

    private static List<Predicate> searchStore(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                if("headNo".equals(key)){
                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    }
                } else if("branchNo".equals(key)) {
                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    }
                } else if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                } else if ("storeName".equals(key)  && value != "") {
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);

                }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

    private static List<Predicate> searchStoreGoods(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                if("storeNo".equals(key)){
                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    }
                } else if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null || "null".equals(value)) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                } else if ("goodsName".equals(key)  && value != "") {
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {

                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);

                }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

    private static List<Predicate> searchStoreRentalCar(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();

        LocalDateTime startDate = null;
        LocalDateTime endDate = null;

        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                if("storeNo".equals(key)){
                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    }
                } else if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null || "null".equals(value)) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                } else if ("carNum".equals(key)  && value != "") {
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("safenNum".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {

                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);

                }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

    private static List<Predicate> searchSafenMapping(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                /*if("storeNo".equals(key)){
                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    }
                }*/
                if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null || "null".equals(value)) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                } else if ("safenNum".equals(key)  && value != "") {
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {

                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);

                }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

    private static List<Predicate> searchDelivery(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                if("dlvyNo".equals(key)){
                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    }
                } else if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                } else if ("dlvyName".equals(key)  && value != "") {
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {

                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);

                }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

    private static List<Predicate>  searchUserWork(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                if("workerNo".equals(key)){
                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    }
                } else if("branchNo".equals(key)){
                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    }
                } else if("storeNo".equals(key)){
                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    }
                } else if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                } else if ("name".equals(key)  && value != "") {
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {

                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);

                }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

    private static List<Predicate> searchSystemGoods(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
               if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                } else if ("catCode".equals(key)  && value != "") {
                   predicate.add(builder.equal(root.get(key), value));
                } else if ("goodsName".equals(key)  && value != "") {
                   predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("barcode".equals(key)  && value != "") {
                   predicate.add(builder.like(root.get(key), "%"+value+"%"));
                }  else if ("endDate".equals(key) && value != "") {
                   String string = value.toString() + " 23:59:59";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   endDate = LocalDateTime.parse(string, formatter);
               } else if ("startDate".equals(key) && value != "") {
                   String string = value.toString() + " 00:00:00";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   startDate = LocalDateTime.parse(string, formatter);

               }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

    private static List<Predicate>  searchDeliveryList(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
               if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                } else if("branchNo".equals(key)){
                   if(!"".equals(value) ) {
                       predicate.add(builder.equal(root.get(key),value));
                   }
               } else if("storeNo".equals(key)){
                   if(!"".equals(value) ) {
                       predicate.add(builder.equal(root.get(key),value));
                   } else {
                       predicate.add(builder.equal(root.get(key),0));
                   }
               } else if ("dlvyName".equals(key)  && value != "") {
                   predicate.add(builder.like(root.get(key), "%"+value+"%"));
                }  else if ("startDate".equals(key) && value != "") {
                   String string = value.toString() + " 00:00:00";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   startDate = LocalDateTime.parse(string, formatter);

               } else if ("endDate".equals(key) && value != "") {
                   String string = value.toString() + " 23:59:59";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   endDate = LocalDateTime.parse(string, formatter);
               }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

    private static List<Predicate>  tbDlvyAreaChargeList(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                }
                else if("branchNo".equals(key)){
                   if(!"".equals(value) ) {
                       predicate.add(builder.equal(root.get(key),value));
                   }
               }
               else if ("areaChargeType".equals(key)) {
                    predicate.add(builder.equal(root.get(key),value));
                } else if ("areaChargeName".equals(key)  && value != "") {
                   predicate.add(builder.like(root.get(key), "%"+value+"%"));
                }  else if ("endDate".equals(key) && value != "") {
                   String string = value.toString() + " 23:59:59";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   endDate = LocalDateTime.parse(string, formatter);
               } else if ("startDate".equals(key) && value != "") {
                   String string = value.toString() + " 00:00:00";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   startDate = LocalDateTime.parse(string, formatter);
               }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

    private static List<Predicate>  searchNoticePlatform(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                /*if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                } else*/ if ("groupType".equals(key) && value != "") {
                    Predicate typeAll = builder.equal(root.get(key),0);
                    Predicate type = builder.equal(root.get(key),value);
                    predicate.add(builder.or(typeAll,type));
                } else if ("title".equals(key)  && value != "") {
                   predicate.add(builder.like(root.get(key), "%"+value+"%"));
                }  else if ("endDate".equals(key) && value != "") {
                   String string = value.toString() + " 23:59:59";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {
                   String string = value.toString() + " 00:00:00";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   startDate = LocalDateTime.parse(string, formatter);
                } else if ("viewYn".equals(key) && value != "") {
                    predicate.add(builder.equal(root.get(key), Integer.parseInt((String)value)));
                } else if ("platformType".equals(key) && value != "") {
                    predicate.add(builder.equal(root.get(key), Integer.parseInt((String)value)));
                } else if ("appCode".equals(key) && value != "") {
                    predicate.add(builder.equal(root.get(key), value));
                } else if ("serviceNo".equals(key) && value != "") {
                    predicate.add(builder.equal(root.get(key), value));
                }
            }
            if (ObjectUtils.isNotEmpty(startDate) && ObjectUtils.isNotEmpty(endDate)) {
                predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
            }
            predicate.add(builder.equal(root.get("dataStatus"), DataStatus.OK));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }
    private static List<Predicate> searchAppService(
            Map<String, Object> searchKeyword,
            Root<?> root,
            CriteriaBuilder builder
    ) {
        List<Predicate> predicate = new ArrayList<>();

        LocalDateTime startDate = null;
        LocalDateTime endDate = null;

        try {
            // ✅ searchType/keyword를 먼저 뽑아둠
            String searchType = "";
            String keyword = "";

            if (searchKeyword.get("searchType") != null) {
                searchType = searchKeyword.get("searchType").toString().trim();
            }
            if (searchKeyword.get("keyword") != null) {
                keyword = searchKeyword.get("keyword").toString().trim();
            }

            // ✅ 날짜 파싱
            Object startObj = searchKeyword.get("startDate");
            Object endObj = searchKeyword.get("endDate");

            if (startObj != null) {
                String val = startObj.toString().trim();
                if (!val.isEmpty()) {
                    String str = val + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(str, formatter);
                }
            }

            if (endObj != null) {
                String val = endObj.toString().trim();
                if (!val.isEmpty()) {
                    String str = val + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(str, formatter);
                }
            }

            // ✅ keyword 검색 적용 (searchType 기준)
            if (!keyword.isEmpty()) {
                if ("serviceName".equals(searchType)) {
                    predicate.add(builder.like(root.get("serviceName"), "%" + keyword + "%"));
                } else if ("brandTypeCd".equals(searchType)) {
                    predicate.add(builder.like(root.get("brandTypeCd"), "%" + keyword + "%"));
                } else if ("csTel".equals(searchType)) {
                    predicate.add(builder.like(root.get("csTel"), "%" + keyword + "%"));
                } else {
                    // ✅ 혹시 searchType이 비거나 예상 못한 값이면 기본은 serviceName으로
                    predicate.add(builder.like(root.get("serviceName"), "%" + keyword + "%"));
                }
            }

            // ✅ insertDate 기간검색
            if (startDate != null && endDate != null) {
                predicate.add(builder.between(root.get("insertDate"), startDate, endDate));
            }

            // ✅ dataStatus = OK (너 enum이 int 매핑이면 1)
            predicate.add(builder.equal(root.get("dataStatus"), 1));

        } catch (Exception e) {
            e.printStackTrace();
        }

        return predicate;
    }

    private static List<Predicate>  searchNoticeCompany(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                } else if ("groupType".equals(key) && value != "") {
                    Predicate typeAll = builder.equal(root.get(key),0);
                    Predicate type = builder.equal(root.get(key),value);
                    predicate.add(builder.or(typeAll,type));
                } else if ("title".equals(key)  && value != "") {
                   predicate.add(builder.like(root.get(key), "%"+value+"%"));
                }  else if ("endDate".equals(key) && value != "") {
                   String string = value.toString() + " 23:59:59";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   endDate = LocalDateTime.parse(string, formatter);
               } else if ("startDate".equals(key) && value != "") {
                   String string = value.toString() + " 00:00:00";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   startDate = LocalDateTime.parse(string, formatter);

               }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

    private static List<Predicate>  searchNoticeWorker(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                } else if ("groupType".equals(key) && value != "") {
                    Predicate typeAll = builder.equal(root.get(key),0);
                    Predicate type = builder.equal(root.get(key),value);
                    predicate.add(builder.or(typeAll,type));
                } else if ("title".equals(key)  && value != "") {
                   predicate.add(builder.like(root.get(key), "%"+value+"%"));
                }  else if ("endDate".equals(key) && value != "") {
                   String string = value.toString() + " 23:59:59";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   endDate = LocalDateTime.parse(string, formatter);
               } else if ("startDate".equals(key) && value != "") {
                   String string = value.toString() + " 00:00:00";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   startDate = LocalDateTime.parse(string, formatter);

               }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

    private static List<Predicate> searchAppBanner(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);

                if ("serviceNo".equals(key) && value != null && !"".equals(value.toString())) {
                    predicate.add(builder.equal(root.get("serviceNo"), value));
                }

                if ("serviceType".equals(key) && value != null && !"".equals(value.toString())) {
                    predicate.add(builder.equal(root.get("serviceType"), value));
                }

                if ("bannerType".equals(key) && value != null && !"".equals(value.toString())) {
                    predicate.add(builder.equal(root.get("bannerType"), value));
                }
            }

            predicate.add(builder.equal(root.get("dataStatus"), 1));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return predicate;
    }

    public static Specification<TbAppBanner> bannerLocationAddr1Spec(Integer bannerType, String addr1) {
        return (root, query, builder) -> {

            // bannerType=1일 때만 addr1 필터가 의미 있음
            if (bannerType == null || bannerType != 1) {
                return builder.conjunction();
            }

            if (addr1 == null || addr1.trim().isEmpty()) {
                // bannerType=1인데 addr1필터가 없으면 "전체(주소배너 전체)"를 원하므로 조건 없음
                return builder.conjunction();
            }

            // exists (select 1 from TbAppBannerLocation where bannerNo=... and addr1=...)
            Subquery<Long> sq = query.subquery(Long.class);
            Root<TbAppBannerLocation> bl = sq.from(TbAppBannerLocation.class);

            sq.select(builder.literal(1L));
            sq.where(
                    builder.equal(bl.get("bannerNo"), root.get("bannerNo")),
                    builder.equal(bl.get("addr1"), addr1)
            );

            return builder.exists(sq);
        };
    }

    private static List<Predicate>  searchEvent(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                /*if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                } else*/ if ("title".equals(key)  && value != "") {
                   predicate.add(builder.like(root.get(key), "%"+value+"%"));
                }  else if ("viewYn".equals(key)  && value != "") {
                    predicate.add(builder.equal(root.get(key),value));
                }  else if ("endDate".equals(key) && value != "") {
                   String string = value.toString() + " 23:59:59";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   endDate = LocalDateTime.parse(string, formatter);
               } else if ("startDate".equals(key) && value != "") {
                   String string = value.toString() + " 00:00:00";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   startDate = LocalDateTime.parse(string, formatter);

               } else if ("platformType".equals(key) && value != "") {
                    predicate.add(builder.equal(root.get(key), Integer.parseInt((String)value)));
                } else if ("appCode".equals(key) && value != "") {
                    predicate.add(builder.equal(root.get(key), value));
                } else if ("serviceNo".equals(key) && value != "") {
                    predicate.add(builder.equal(root.get(key), value));
                }
            }
            if (ObjectUtils.isNotEmpty(startDate) && ObjectUtils.isNotEmpty(endDate)) {
                predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
            }
            predicate.add(builder.equal(root.get("dataStatus"), DataStatus.OK));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }
    private static List<Predicate>  searchStRegist(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        String keywordType = null;
        String keyword = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                /*if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
    } else*/    if (ObjectUtils.isNotEmpty(value) && key.equals("keywordType")) {
                    keywordType = (String) value;
                } else if (ObjectUtils.isNotEmpty(value) && key.equals("keyword")) {
                    keyword = (String)value;
                }
                if ("viewYn".equals(key)  && value != "") {
                    predicate.add(builder.equal(root.get(key),value));
                }
                if ("directsaleYn".equals(key)  && value != "") {
                    predicate.add(builder.equal(root.get(key),value));
                }
                if ("endDate".equals(key) && value != "") {
                   String string = value.toString() + " 23:59:59";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   endDate = LocalDateTime.parse(string, formatter);
               }
                if ("startDate".equals(key) && value != "") {
                   String string = value.toString() + " 00:00:00";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   startDate = LocalDateTime.parse(string, formatter);
               }
            }

            if (StringUtils.isNotBlank(keywordType)) {
                if (StringUtils.isNotBlank(keyword)) {
                    predicate.add(builder.like(root.get(keywordType), "%" + keyword + "%"));
                }
            }
            if (ObjectUtils.isNotEmpty(startDate) && ObjectUtils.isNotEmpty(endDate)) {
                predicate.add(builder.between(root.<LocalDateTime>get("updateDate"),startDate,endDate));
            }
            /*predicate.add(builder.equal(root.get("dataStatus"), DataStatus.OK));*/
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }
    private static List<Predicate>  searchEventPush(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                if ("evTitle".equals(key)  && value != "") {
                   predicate.add(builder.like(root.get(key), "%"+value+"%"));
                }  else if ("param1".equals(key)  && value != "") {
                    predicate.add(builder.equal(root.get(key),value));
                }  else if ("evType".equals(key)  && value != "") {
                    predicate.add(builder.equal(root.get(key),value));
                }   else if ("evOrdType".equals(key)  && value != "") {
                    predicate.add(builder.equal(root.get(key),value));
                }  else if ("evDvryType".equals(key)  && value != "") {
                    predicate.add(builder.equal(root.get(key),value));
                }  else if ("endDate".equals(key) && value != "") {
                   String string = value.toString() + " 23:59:59";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {
                   String string = value.toString() + " 00:00:00";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   startDate = LocalDateTime.parse(string, formatter);

                } else if ("platformType".equals(key) && value != "") {
                    predicate.add(builder.equal(root.get(key), Integer.parseInt((String)value)));
                } else if ("brandTypeCd".equals(key) && ObjectUtils.isNotEmpty(value)) {
                    predicate.add(builder.equal(root.get(key), value));
                }
            }
            if (ObjectUtils.isNotEmpty(startDate) && ObjectUtils.isNotEmpty(endDate)) {
                predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

   /* private static List<Predicate>  searchEventPushLog(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                if ("title".equals(key)  && value != "") {
                   predicate.add(builder.like(root.get(key), "%"+value+"%"));
                }  else if ("viewYn".equals(key)  && value != "") {
                    predicate.add(builder.equal(root.get(key),value));
                }  else if ("endDate".equals(key) && value != "") {
                   String string = value.toString() + " 23:59:59";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   endDate = LocalDateTime.parse(string, formatter);
               } else if ("startDate".equals(key) && value != "") {
                   String string = value.toString() + " 00:00:00";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   startDate = LocalDateTime.parse(string, formatter);

               } else if ("platformType".equals(key) && value != "") {
                    predicate.add(builder.equal(root.get(key), Integer.parseInt((String)value)));
                }
            }
            if (ObjectUtils.isNotEmpty(startDate) && ObjectUtils.isNotEmpty(endDate)) {
                predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }*/
    private static List<Predicate>  searchMannaCouponPublish(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        String keywordType = null;
        String keyword = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);

                if (ObjectUtils.isNotEmpty(value) && key.equals("searchType")) {
                    keywordType = (String)value;
                } else if (ObjectUtils.isNotEmpty(value) && key.equals("searchKeyword")) {
                    keyword = (String)value;
                }  else if ("cpnNo".equals(key)  && value != "") {
                    predicate.add(builder.equal(root.get(key),value));
                }  else if ("endDate".equals(key) && value != "") {
                   String string = value.toString() + " 23:59:59";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   endDate = LocalDateTime.parse(string, formatter);
               } else if ("startDate".equals(key) && value != "") {
                   String string = value.toString() + " 00:00:00";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   startDate = LocalDateTime.parse(string, formatter);

               }
            }
            if (ObjectUtils.isNotEmpty(startDate) && ObjectUtils.isNotEmpty(endDate)) {
                predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
            }

            if (StringUtils.isNotBlank(keywordType)) {
                if (StringUtils.isNotBlank(keyword)) {
                    predicate.add(builder.like(root.get(keywordType), "%" + keyword + "%"));
                }
            }

        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

    private static List<Predicate>  searchMannaCouponRegist(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        String keywordType = null;
        String keyword = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);

                if (ObjectUtils.isNotEmpty(value) && key.equals("keywordType")) {
                    keywordType = (String)value;
                } else if (ObjectUtils.isNotEmpty(value) && key.equals("keyword")) {
                    keyword = (String)value;
                }  else if ("publishNo".equals(key)  && value != "") {
                    predicate.add(builder.equal(root.get(key),value));
                }  else if ("endDate".equals(key) && value != "") {
                   String string = value.toString() + " 23:59:59";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   endDate = LocalDateTime.parse(string, formatter);
               } else if ("startDate".equals(key) && value != "") {
                   String string = value.toString() + " 00:00:00";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   startDate = LocalDateTime.parse(string, formatter);

               }
            }
            if (ObjectUtils.isNotEmpty(startDate) && ObjectUtils.isNotEmpty(endDate)) {
                predicate.add(builder.between(root.<LocalDateTime>get("regDate"),startDate,endDate));
            }

            if (StringUtils.isNotBlank(keywordType)) {
                if (StringUtils.isNotBlank(keyword)) {
                    predicate.add(builder.like(root.get(keywordType), "%" + keyword + "%"));
                }
            }

        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }
    private static List<Predicate>  searchMannaStSurcharge(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        String keywordType = null;
        String keyword = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);

                if (ObjectUtils.isNotEmpty(value) && key.equals("keywordType")) {
                    keywordType = (String)value;
                } else if (ObjectUtils.isNotEmpty(value) && key.equals("keyword")) {
                    keyword = (String)value;
                }
              /*  else if ("endDate".equals(key) && value != "") {
                   String string = value.toString() + " 23:59:59";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   endDate = LocalDateTime.parse(string, formatter);
               } else if ("startDate".equals(key) && value != "") {
                   String string = value.toString() + " 00:00:00";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   startDate = LocalDateTime.parse(string, formatter);

               }*/
            }
           /* if (ObjectUtils.isNotEmpty(startDate) && ObjectUtils.isNotEmpty(endDate)) {
                predicate.add(builder.between(root.<LocalDateTime>get("regDate"),startDate,endDate));
            }*/

            if (StringUtils.isNotBlank(keywordType)) {
                if (StringUtils.isNotBlank(keyword)) {
                    predicate.add(builder.like(root.get(keywordType), "%" + keyword + "%"));
                }
            }

        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }
    private static List<Predicate>  searchRelese(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                } else if ("title".equals(key) && value != "") {
                   predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if("platformType".equals(key) && value != ""){
                    predicate.add(builder.equal(root.get(key),value));
                } else if("programType".equals(key) && value != ""){
                    predicate.add(builder.equal(root.get(key),value));
                } else if ("endDate".equals(key) && value != "") {
                   String string = value.toString() + " 23:59:59";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {
                   String string = value.toString() + " 00:00:00";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   startDate = LocalDateTime.parse(string, formatter);

               }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }
    private static List<Predicate>  searchServiceChargeGroup(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
              if("branchNo".equals(key)){
                   if(!"".equals(value) ) {
                       predicate.add(builder.equal(root.get(key),value));
                   }
               } else if("headNo".equals(key)){
                   if(!"".equals(value) ) {
                       predicate.add(builder.equal(root.get(key),value));
                   } else {
                       predicate.add(builder.equal(root.get(key),0));
                   }
               }
                if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                } else if ("chargeName".equals(key)  && value != "") {
                   predicate.add(builder.like(root.get(key), "%"+value+"%"));
                }  else if ("endDate".equals(key) && value != "") {
                   String string = value.toString() + " 23:59:59";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   endDate = LocalDateTime.parse(string, formatter);
               } else if ("startDate".equals(key) && value != "") {
                   String string = value.toString() + " 00:00:00";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   startDate = LocalDateTime.parse(string, formatter);

               }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }


    private static List<Predicate>  tbDlvyStreetChargeList(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
               if ("dataStatus".equals(key)) {
                    if("".equals(value) || value == null) {
                        predicate.add(builder.notEqual(root.get(key),0));
                    } else {
                        predicate.add(builder.equal(root.get(key),value));
                        predicate.add(builder.notEqual(root.get(key),0));
                    }
                }
             /*  else if("branchNo".equals(key)){
                   if(!"".equals(value) ) {
                       predicate.add(builder.equal(root.get(key),value));
                   }
               }*/
             /*  else if("headNo".equals(key)){
                   if(!"".equals(value) ) {
                       predicate.add(builder.equal(root.get(key),value));
                   } else {
                       predicate.add(builder.equal(root.get(key),0));
                   }
               } */
               else if ("priceChargeName".equals(key)  && value != "") {
                   predicate.add(builder.like(root.get(key), "%"+value+"%"));
                }  else if ("endDate".equals(key) && value != "") {
                   String string = value.toString() + " 23:59:59";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   endDate = LocalDateTime.parse(string, formatter);
               } else if ("startDate".equals(key) && value != "") {
                   String string = value.toString() + " 00:00:00";
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                   startDate = LocalDateTime.parse(string, formatter);

               }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

    private static List<Predicate> searchStoreMngCharge(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        for (String key : searchKeyword.keySet()) {
            Object value = searchKeyword.get(key);
            if("storeNo".equals(key)){
                if(!"".equals(value) ) {
                    predicate.add(builder.equal(root.get(key),value));
                } else {
                    predicate.add(builder.equal(root.get(key),0));
                }
            }
        }
        return predicate;
    }
    private static List<Predicate> searchStoreDlvyCharge(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        for (String key : searchKeyword.keySet()) {
            Object value = searchKeyword.get(key);
            if("storeNo".equals(key)){
                if(!"".equals(value) ) {
                    predicate.add(builder.equal(root.get(key),value));
                } else {
                    predicate.add(builder.equal(root.get(key),0));
                }
            }
            /*else if ("dataStatus".equals(key)) {
                //무조건 OK
                DataStatus dataStatus = null;
                DataStatus delDataStatus = null;
                if("".equals(value) || value == null) {
                    delDataStatus = DataStatus.valueOf("DELETE");
                    predicate.add(builder.notEqual(root.get(key),delDataStatus));
                } else {
                    dataStatus = DataStatus.valueOf(value.toString());
                    delDataStatus = DataStatus.valueOf("DELETE");
                    predicate.add(builder.equal(root.get(key),dataStatus));
                    predicate.add(builder.notEqual(root.get(key),delDataStatus));
                }

            }*/
        }
        return predicate;
    }

    private static List<Predicate>  searchOrderAllList(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                /*if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                } */
                if("storeNo".equals(key)){

                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    } else {
                        predicate.add(builder.equal(root.get(key),0));
                    }

                } else if ("destAddr3".equals(key) && value != "") {
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("storeName".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("custTel".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("workerName".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("orderPathCode".equals(key) ) {
                    List<Predicate> list = new ArrayList<Predicate>();
                    if (value == "") {
                        Predicate predicate1 = builder.equal(root.get(key), "none");
                        list.add(predicate1);
                    } else {

                        String[] code1 = value.toString().split(",");
                        for (int i = 0; i < code1.length; i++) {
                            Predicate predicate1 = builder.equal(root.get(key), code1[i]);
                            list.add(predicate1);
                        }
                    }

                    predicate.add(builder.or(list.toArray(new Predicate[list.size()])));

                } else if ("orderStatusCode".equals(key) && value != "") {

                    List<Predicate> list = new ArrayList<Predicate>();
                    if (value == "") {
                        Predicate predicate1 = builder.equal(root.get(key), "99");
                        list.add(predicate1);
                    } else {

                        String[] code2 = value.toString().split(",");
                        for (int i = 0; i < code2.length; i++) {
                            Predicate predicate1 = builder.equal(root.get(key), code2[i]);
                            list.add(predicate1);
                        }
                    }

                    predicate.add(builder.or(list.toArray(new Predicate[list.size()])));

                } else if ("orderTypeCode".equals(key) && value != "") {

                    List<Predicate> list = new ArrayList<Predicate>();
                    if (value == "") {
                        Predicate predicate1 = builder.equal(root.get(key), "none");
                        list.add(predicate1);
                    } else {

                        String[] code3 = value.toString().split(",");
                        for (int i = 0; i < code3.length; i++) {
                            Predicate predicate1 = builder.equal(root.get(key), code3[i]);
                            list.add(predicate1);
                        }
                    }

                    predicate.add(builder.or(list.toArray(new Predicate[list.size()])));

                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);

                }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }
    private static List<Predicate>  searchCashWithdrawList(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
               /* if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                }*/
                if("groupNo".equals(key)){
                    predicate.add(builder.equal(root.get(key),value));
                } else if ("groupName".equals(key) && value != "") {
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("groupType".equals(key) && value != "") {
                    predicate.add(builder.equal(root.get(key),value));
                } else if ("phone".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("withdrawStatus".equals(key) && value != ""){
                    predicate.add(builder.equal(root.get(key),value));
                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);

                }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }
   /* private static List<Predicate>  searchCustCashLogList(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                Join<TbCustCashLog, TbCust> joinCol =  root.join("cust");
                if("storeNo".equals(key)){
                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    } else {
                        predicate.add(builder.equal(root.get(key),0));
                    }
                } else if ("searchText".equals(key) && value != "") {
                    Predicate predicate1 = builder.like(joinCol.get("custName"), "%"+value+"%");
                    predicate.add(builder.or(predicate1,builder.like(joinCol.get("custTel"), "%"+value+"%")));
                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);

                    predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
                }
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }*/
    private static List<Predicate>  searchHeadCashLogList(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                Join<TbHeadCashLog, TbHead> joinCol =  root.join("head");
                if("headNo".equals(key)){
                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    } else {
                        predicate.add(builder.equal(root.get(key),0));
                    }
                } else if ("searchText".equals(key) && value != "") {
                    Predicate predicate1 = builder.like(joinCol.get("headName"), "%"+value+"%");
                    predicate.add(builder.or(predicate1,builder.like(joinCol.get("headTel"), "%"+value+"%")));
                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);

                }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }
    private static List<Predicate>  searchBranchCashLogList(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                Join<TbBranchCashLog, TbBranch> joinCol =  root.join("branch");
                if("branchNo".equals(key)){
                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    } else {
                        predicate.add(builder.equal(root.get(key),0));
                    }
                } else if ("searchText".equals(key) && value != "") {
                    Predicate predicate1 = builder.like(joinCol.get("branchName"), "%"+value+"%");
                    predicate.add(builder.or(predicate1,builder.like(joinCol.get("branchTel"), "%"+value+"%")));
                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);

                }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }
    private static List<Predicate>  searchStoreCashLogList(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                Join<TbStoreCashLog, TbStore> joinCol =  root.join("store");
                if("storeNo".equals(key)){
                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    } else {
                        predicate.add(builder.equal(root.get(key),0));
                    }
                } else if ("searchText".equals(key) && value != "") {
                    Predicate predicate1 = builder.like(joinCol.get("storeName"), "%"+value+"%");
                    predicate.add(builder.or(predicate1,builder.like(joinCol.get("storeTel"), "%"+value+"%")));
                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);

                }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }
    private static List<Predicate>  searchWorkerCashLogList(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                Join<TbWorkerCashLog, TbUserWorker> joinCol =  root.join("worker");
                if("workerNo".equals(key)){
                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    } else {
                        predicate.add(builder.equal(root.get(key),0));
                    }
                } else if ("searchText".equals(key) && value != "") {
                    Predicate predicate1 = builder.like(joinCol.get("name"), "%"+value+"%");
                    predicate.add(builder.or(predicate1,builder.like(joinCol.get("phone"), "%"+value+"%")));
                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);
                }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }
    private static List<Predicate>  searchCallAllList(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        CriteriaQuery<TbMannaOrder> criteria = builder.createQuery(TbMannaOrder.class);
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        String keyword = null;
        String keywordType = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);

                if (ObjectUtils.isNotEmpty(value) && key.equals("keywordType")) {
                    keywordType = (String)value;
                } else if (ObjectUtils.isNotEmpty(value) && key.equals("keyword")) {
                    keyword = (String)value;
                } else if (ObjectUtils.isNotEmpty(value) && key.equals("ordNo")) {
                    keyword = (String)value;
                }
                if ("ordPathCd".equals(key) && value != "") {
                    predicate.add(builder.equal(root.get(key), value));
                }
                if ("dvryServiceType".equals(key) && value != "") {
                    predicate.add(builder.equal(root.get(key), value));
                }
                if ("ordStatus".equals(key) && value != "") {
                    predicate.add(builder.equal(root.get(key), value));
                }
                if ("brCode".equals(key) && value != "") {
                    predicate.add(builder.equal(root.get(key), value));
                }
                if ("brandTypeCd".equals(key) && value != "") {
                    predicate.add(builder.equal(root.get(key), value));
                }

                if ("ordCuTel".equals(key) && value != "") {
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("ordType".equals(key) && value != "") {
                    List<Predicate> list = new ArrayList<Predicate>();
                    if (value == "") {
                        Predicate predicate1 = builder.equal(root.get(key), "99");
                        list.add(predicate1);
                    } else {
                        String[] code2 = value.toString().split(",");
                        for (int i = 0; i < code2.length; i++) {
                            Predicate predicate1 = builder.equal(root.get(key), code2[i]);
                            list.add(predicate1);
                        }
                    }

                    predicate.add(builder.or(list.toArray(new Predicate[list.size()])));

                }

                else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);
                }

                // This query fetches the Books as per the Page Limit

              /*  else if ("startDate".equals(key) && value != "") {

                    String string = value.toString() + " 00:00:01";
                    String string2 = value.toString() + " 23:59:59";

                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

                    startDate = LocalDateTime.parse(string, formatter);
                    endDate = LocalDateTime.parse(string2, formatter);
                }*/
            }
            predicate.add(builder.between(root.<LocalDateTime>get("ordDate"),startDate,endDate));
            if (StringUtils.isNotBlank(keywordType)) {
                if (StringUtils.isNotBlank(keyword)) {
                    if ("ordNo".equals(keywordType)) {
                        predicate.add(builder.equal(root.get(keywordType),   keyword ));
                    } else {
                        predicate.add(builder.like(root.get(keywordType), "%" + keyword + "%"));
                    }

                }

            }
            //predicate.add(builder.or(builder.between(root.<LocalDateTime>get("ordDate"),startDate,endDate),builder.between(root.<LocalDateTime>get("cancelDate"),startDate,endDate)));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }
    private static List<Predicate>  searchOrderDayList(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();

        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                /*if ("dataStatus".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                } */
                if("storeNo".equals(key)){

                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    } else {
                        predicate.add(builder.equal(root.get(key),0));
                    }

                } else if ("destAddr3".equals(key) && value != "") {
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("storeName".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("custTel".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("workerName".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("orderPathCode".equals(key) ) {
                    List<Predicate> list = new ArrayList<Predicate>();
                    if (value == "") {
                        Predicate predicate1 = builder.equal(root.get(key), "none");
                        list.add(predicate1);
                    } else {

                        String[] code1 = value.toString().split(",");
                        for (int i = 0; i < code1.length; i++) {
                            Predicate predicate1 = builder.equal(root.get(key), code1[i]);
                            list.add(predicate1);
                        }
                    }

                    predicate.add(builder.or(list.toArray(new Predicate[list.size()])));

                } else if ("orderStatusCode".equals(key) && value != "") {

                    List<Predicate> list = new ArrayList<Predicate>();
                    if (value == "") {
                        Predicate predicate1 = builder.equal(root.get(key), "99");
                        list.add(predicate1);
                    } else {

                        String[] code2 = value.toString().split(",");
                        for (int i = 0; i < code2.length; i++) {
                            Predicate predicate1 = builder.equal(root.get(key), code2[i]);
                            list.add(predicate1);
                        }
                    }

                    predicate.add(builder.or(list.toArray(new Predicate[list.size()])));

                } else if ("orderTypeCode".equals(key) && value != "") {

                    List<Predicate> list = new ArrayList<Predicate>();
                    if (value == "") {
                        Predicate predicate1 = builder.equal(root.get(key), "none");
                        list.add(predicate1);
                    } else {

                        String[] code3 = value.toString().split(",");
                        for (int i = 0; i < code3.length; i++) {
                            Predicate predicate1 = builder.equal(root.get(key), code3[i]);
                            list.add(predicate1);
                        }
                    }

                    predicate.add(builder.or(list.toArray(new Predicate[list.size()])));

                }
               /* else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);

                    predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
                }*/
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

    private static List<Predicate>  searchPaymenthistoryList(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();

        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                /*if ("00".equals(key)) {
                    DataStatus dataStatus = null;
                    DataStatus delDataStatus = null;
                    if("".equals(value) || value == null) {
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    } else {
                        dataStatus = DataStatus.valueOf(value.toString());
                        delDataStatus = DataStatus.valueOf("DELETE");
                        predicate.add(builder.equal(root.get(key),dataStatus));
                        predicate.add(builder.notEqual(root.get(key),delDataStatus));
                    }
                }*/
                if("storeNo".equals(key)){
                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    } else {
                        predicate.add(builder.equal(root.get(key),0));
                    }
                } else if("status".equals(key)){
                    if(!"".equals(value) && !"-1".equals(value)) {
                        if("".equals(value) || "00".equals(value) ) {
                            value = "00";
                            predicate.add(builder.equal(root.get(key),value));
                        } else if("9999".equals(value) ){
                            predicate.add(builder.notEqual(root.get(key),"00"));
                        }
                    }
                } else if ("workerName".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                    //Predicate predicate1 = builder.like(joinCol.get("workerName"), "%"+value+"%");
                   //predicate.add(builder.or(predicate1,builder.like(joinCol.get("workerName"), "%"+value+"%")));
                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);
                }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("authDtm"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }
   /* private static List<Predicate> searchStoreDlvyCharge(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        for (String key : searchKeyword.keySet()) {
            Object value = searchKeyword.get(key);
            if ("dataStatus".equals(key)) {
                if("".equals(value) || value == null) {
                    predicate.add(builder.notEqual(root.get(key),0));
                } else {
                    predicate.add(builder.equal(root.get(key),value));
                    predicate.add(builder.notEqual(root.get(key),0));
                }
            } else if("branchNo".equals(key)){
                if(!"".equals(value) ) {
                    predicate.add(builder.equal(root.get(key),value));
                }
            } else if("storeNo".equals(key)){
                if(!"".equals(value) ) {
                    predicate.add(builder.equal(root.get(key),value));
                } else {
                    predicate.add(builder.equal(root.get(key),0));
                }
            } else if ("priceChargeName".equals(key)  && value != "") {
                predicate.add(builder.like(root.get(key), "%"+value+"%"));
            }  else if ("endDate".equals(key) && value != "") {
                String string = value.toString() + " 23:59:59";
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                endDate = LocalDateTime.parse(string, formatter);
            } else if ("startDate".equals(key) && value != "") {
                String string = value.toString() + " 00:00:00";
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                startDate = LocalDateTime.parse(string, formatter);

                predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
            }
        }
        return predicate;
    }*/


    public static Specification<?> getWorkList(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = getWorkList(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }


    private static List<Predicate>  getWorkList(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();

        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                if("storeNo".equals(key)){
                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    } else {
                        predicate.add(builder.equal(root.get(key),0));
                    }
                } else if("authStatus".equals(key) && value != ""){
                    if("9999".equals(value) ){

                    }else {
                        predicate.add(builder.equal(root.get(key),Integer.parseInt(value.toString())));
                    }

                } else if ("name".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);

                }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

    private static List<Predicate>  searchRentalInfoList(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();

        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                if ("storeName".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("carNum".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("custDriverTel1".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("safenNum".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);


                }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

    private static List<Predicate> searchUserList(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();

        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                if ("name".equals(key) && value != "") {
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);
                }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

    private static List<Predicate> searchCouponList(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();

        LocalDateTime startDate = null;
        LocalDateTime endDate = null;

        try {
            predicate.add(builder.notEqual(root.get("dataStatus"), 0));
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                if ("title".equals(key) && value != "") {
                    predicate.add(builder.like(root.get(key), "%" + value + "%"));
                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);
                } else if ("dataStatus".equals(key)) {
                    if(StringUtils.isEmpty((String)value)) {
                        predicate.add(builder.notEqual(root.get(key), 0));
                    } else {
                        int dataStatus = 1;
                        if (!value.equals("OK")) {
                            dataStatus = 2;
                        }
                        predicate.add(builder.equal(root.get(key), dataStatus));
                    }
                } else if (key.equals("serviceType")) {
                    if (ObjectUtils.isNotEmpty(value)) {
                        predicate.add(builder.equal(root.get(key),value));
                    }
                }
            }
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

    private static List<Predicate> searchCustList(
            Map<String, Object> searchKeyword,
            Root<TbCust> root,
            CriteriaQuery<?> query,
            CriteriaBuilder builder
    ) {
        List<Predicate> predicate = new ArrayList<>();

        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        String keywordType = "";
        String keyword = "";

        Join<TbCust, TbCustSns> snsJoin = null;

        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);

                if (ObjectUtils.isNotEmpty(value) && "keywordType".equals(key)) {
                    keywordType = value.toString();

                } else if (ObjectUtils.isNotEmpty(value) && "keyword".equals(key)) {
                    keyword = value.toString();

                } else if (ObjectUtils.isNotEmpty(value) && "custTel".equals(key)) {
                    predicate.add(builder.like(root.get("custTel"), "%" + value + "%"));

                } else if ("endDate".equals(key) && ObjectUtils.isNotEmpty(value)) {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);

                } else if ("startDate".equals(key) && ObjectUtils.isNotEmpty(value)) {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);

                } else if ("dataStatus".equals(key)) {
                    int dataStatus = 1;
                    if (ObjectUtils.isEmpty(value)) {
                        predicate.add(builder.notEqual(root.get("dataStatus"), 0));
                    } else {
                        if ("OK".equals(value)) {
                            dataStatus = 1;
                        } else if ("STOP".equals(value)) {
                            dataStatus = 2;
                        } else if ("DELETE".equals(value)) {
                            dataStatus = 0;
                        }
                        predicate.add(builder.equal(root.get("dataStatus"), dataStatus));
                    }

                } else if ("isMember".equals(key)) {
                    if (ObjectUtils.isEmpty(value)) {
                        predicate.add(
                                builder.or(
                                        builder.equal(root.get("isMember"), 0),
                                        builder.equal(root.get("isMember"), 1)
                                )
                        );
                    } else {
                        predicate.add(builder.equal(root.get("isMember"), Integer.parseInt(value.toString())));
                    }

                } else if ("platformType".equals(key) && ObjectUtils.isNotEmpty(value)) {
                    predicate.add(builder.equal(root.get("platformType"), Integer.parseInt(value.toString())));

                } else if ("appCode".equals(key) && ObjectUtils.isNotEmpty(value)) {
                    predicate.add(builder.equal(root.get("appCode"), value.toString()));

                } else if ("memberType".equals(key) && ObjectUtils.isNotEmpty(value)) {
                    if (snsJoin == null) {
                        snsJoin = root.join("snsList", JoinType.LEFT);
                    }

                    String memberType = value.toString();

                    if ("2".equals(memberType)) {
                        // Apple회원 -> sns_type = 3
                        predicate.add(builder.equal(snsJoin.get("snsType"), 3));

                    } else if ("3".equals(memberType)) {
                        // Kakao회원 -> sns_type = 2
                        predicate.add(builder.equal(snsJoin.get("snsType"), 2));

                    } else if ("1".equals(memberType)) {
                        // 일반회원: sns_type 2,3이 아닌 회원
                        predicate.add(builder.equal(root.get("isMember"), 1));
                        predicate.add(
                                builder.or(
                                        builder.isNull(snsJoin.get("snsType")),
                                        builder.not(snsJoin.get("snsType").in(2, 3))
                                )
                        );
                    }
                }
            }

            if (StringUtils.isNotBlank(keywordType) && StringUtils.isNotBlank(keyword)) {
                predicate.add(builder.like(root.get(keywordType), "%" + keyword + "%"));
            }

            if (startDate != null && endDate != null) {
                predicate.add(builder.between(root.get("insertDate"), startDate, endDate));
            } else if (startDate != null) {
                predicate.add(builder.greaterThanOrEqualTo(root.get("insertDate"), startDate));
            } else if (endDate != null) {
                predicate.add(builder.lessThanOrEqualTo(root.get("insertDate"), endDate));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return predicate;
    }
    private static List<Predicate> searchLibraryList(
            Map<String, Object> searchKeyword,
            Root<?> root,
            CriteriaBuilder builder
    ) {
        List<Predicate> predicate = new ArrayList<>();

        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        String keywordType = "";
        String keyword = "";

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);

                if (ObjectUtils.isEmpty(value)) {
                    continue;
                }

                String valueStr = String.valueOf(value).trim();

                if (StringUtils.isBlank(valueStr)) {
                    continue;
                }

                if ("keywordType".equals(key)) {
                    keywordType = valueStr;

                } else if ("keyword".equals(key)) {
                    keyword = valueStr;

                } else if ("fileTitle".equals(key)) {
                    predicate.add(builder.like(root.get("fileTitle"), "%" + valueStr + "%"));

                } else if ("fileType".equals(key)) {
                    addCommonTypePredicate(predicate, root, builder, "fileType", valueStr);

                } else if ("shopType".equals(key)) {
                    addCommonTypePredicate(predicate, root, builder, "shopType", valueStr);

                } else if ("endDate".equals(key)) {
                    String string = valueStr + " 23:59:59";
                    endDate = LocalDateTime.parse(string, formatter);

                } else if ("startDate".equals(key)) {
                    String string = valueStr + " 00:00:00";
                    startDate = LocalDateTime.parse(string, formatter);
                }
            }

            predicate.add(builder.equal(root.get("dataStatus"), 1));

            if (StringUtils.isNotBlank(keywordType) && StringUtils.isNotBlank(keyword)) {
                predicate.add(builder.like(root.get(keywordType), "%" + keyword + "%"));
            }

            if (startDate != null && endDate != null) {
                predicate.add(
                        builder.between(
                                root.<LocalDateTime>get("insertDate"),
                                startDate,
                                endDate
                        )
                );
            } else if (startDate != null) {
                predicate.add(
                        builder.greaterThanOrEqualTo(
                                root.<LocalDateTime>get("insertDate"),
                                startDate
                        )
                );
            } else if (endDate != null) {
                predicate.add(
                        builder.lessThanOrEqualTo(
                                root.<LocalDateTime>get("insertDate"),
                                endDate
                        )
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return predicate;
    }

    private static void addCommonTypePredicate(
            List<Predicate> predicate,
            Root<?> root,
            CriteriaBuilder builder,
            String columnName,
            String valueStr
    ) {
        if (StringUtils.isBlank(valueStr)) {
            return;
        }

        Integer selectedType;

        try {
            selectedType = Integer.parseInt(valueStr);
        } catch (NumberFormatException e) {
            return;
        }

        Predicate commonPredicate = builder.equal(root.get(columnName), 1);

        if (selectedType == 1) {
            predicate.add(commonPredicate);
            return;
        }

        Predicate selectedPredicate = builder.equal(root.get(columnName), selectedType);

        predicate.add(
                builder.or(
                        commonPredicate,
                        selectedPredicate
                )
        );
    }
    private static List<Predicate> searchCustListPop(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();

        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        String keywordPopType = "";
        String keywordPop = "";
        String useCount = "";
        String maxMin = "";

        try {
            predicate.add(builder.notEqual(root.get("dataStatus"), 0));
            predicate.add(builder.isNotNull(root.get("extCustNo")));
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);

                if (ObjectUtils.isNotEmpty(value) && key.equals("keywordPopType")){
                    keywordPopType = (String)value;

                } else if (ObjectUtils.isNotEmpty(value) && key.equals("keywordPop")) {
                    keywordPop = (String)value;

                } else if (ObjectUtils.isNotEmpty(value) && key.equals("custName")) {
                    String custNameValue = value.toString().trim();

                    if (StringUtils.isNotBlank(custNameValue)) {
                        String[] custNames = custNameValue.split(",");

                        List<Predicate> custNamePredicates = new ArrayList<>();

                        for (String custName : custNames) {
                            String name = custName.trim();

                            if (StringUtils.isNotBlank(name)) {
                                custNamePredicates.add(
                                        builder.like(root.get("custName"), "%" + name + "%")
                                );
                            }
                        }

                        if (!custNamePredicates.isEmpty()) {
                            predicate.add(
                                    builder.or(custNamePredicates.toArray(new Predicate[0]))
                            );
                        }
                    }

                }/* else if (ObjectUtils.isNotEmpty(value) && key.equals("custTel")) {
                    String custTelValue = value.toString().trim();

                    if (StringUtils.isNotBlank(custTelValue)) {
                        // 엑셀에서 복사한 줄바꿈 데이터 처리
                        String[] custTels = custTelValue.split("\\R");

                        List<Predicate> custTelPredicates = new ArrayList<>();

                        for (String custTel : custTels) {
                            String tel = custTel.trim().replaceAll("-", "");

                            if (StringUtils.isNotBlank(tel)) {
                                custTelPredicates.add(
                                        builder.like(root.get("custTel"), "%" + tel + "%")
                                );
                            }
                        }

                        if (!custTelPredicates.isEmpty()) {
                            predicate.add(
                                    builder.or(custTelPredicates.toArray(new Predicate[0]))
                            );
                        }
                    }
                }*/ else if ("custEndDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);

                } else if ("custStartDate".equals(key) && value != "") {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);

                } else if ("dataStatus".equals(key)) {
                    int dataStatus = 1;
                    if(ObjectUtils.isEmpty(value)) {
                        predicate.add(builder.notEqual(root.get(key), 0));
                    } else {
                        if (!value.equals("OK")) {
                            dataStatus = 2;
                        }
                        predicate.add(builder.equal(root.get(key), dataStatus));
                    }

                } else if ("platformType".equals(key) && value != "") {
                    predicate.add(builder.equal(root.get(key), Integer.parseInt((String)value)));

                } else if ("maxMin".equals(key) && value != "") {
                    maxMin = (String)value;

                } else if ("useCount".equals(key) && value != "") {
                    useCount = (String)value;
                }
            }
            if (StringUtils.isNotBlank(keywordPopType) && StringUtils.isNotBlank(keywordPop)) {

                // 줄바꿈, 콤마, 탭 모두 분리 가능
                String[] keywords = keywordPop.split("\\R|,|\\t");

                List<Predicate> keywordPredicates = new ArrayList<>();

                for (String keyword : keywords) {
                    String searchText = keyword.trim();

                    if (StringUtils.isBlank(searchText)) {
                        continue;
                    }

                    if ("custTel".equals(keywordPopType)) {
                        searchText = searchText.replaceAll("-", "");
                    }

                    keywordPredicates.add(
                            builder.like(root.get(keywordPopType), "" + searchText + "")
                    );
                }

                if (!keywordPredicates.isEmpty()) {
                    predicate.add(
                            builder.or(keywordPredicates.toArray(new Predicate[0]))
                    );
                }
            }
            if (StringUtils.isNotBlank(maxMin)) {
                if (StringUtils.isNotBlank(useCount)) {
                    if("1".equals(maxMin)) {
                        predicate.add(builder.greaterThanOrEqualTo(root.get("useCount"),  Integer.parseInt(useCount)));
                    } else if("2".equals(maxMin)){
                        predicate.add(builder.lessThanOrEqualTo(root.get("useCount"),  Integer.parseInt(useCount)));
                    } else if("3".equals(maxMin)){
                        predicate.add(builder.equal(root.get("useCount"),  Integer.parseInt(useCount)));
                    }
                }
            }
           /* if (StringUtils.isNotBlank(keywordPopType)) {
                if (StringUtils.isNotBlank(keywordPop)) {
                    predicate.add(builder.like(root.get(keywordPopType), "%" + keywordPop + "%"));
                }
            }*/
            predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));

        } catch (Exception e){
            e.printStackTrace();
        }

        return predicate;
    }

    private static List<Predicate>  searchMannaAllList(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                if ("destAddr3".equals(key) && value != "") {
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("storeName".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("custTel".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("workerName".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                }
                else if ("orderStatus".equals(key) && value != "") {
                    List<Predicate> list = new ArrayList<Predicate>();
                    if (value == "") {
                        Predicate predicate1 = builder.equal(root.get(key), "99");
                        list.add(predicate1);
                    } else {

                        String[] code2 = value.toString().split(",");
                        for (int i = 0; i < code2.length; i++) {
                            Predicate predicate1 = builder.equal(root.get(key), code2[i]);
                            list.add(predicate1);
                        }
                    }

                    predicate.add(builder.or(list.toArray(new Predicate[list.size()])));

                }
                else if ("orderTypeCode".equals(key) && value != "") {

                    List<Predicate> list = new ArrayList<Predicate>();
                    if (value == "") {
                        Predicate predicate1 = builder.equal(root.get(key), "none");
                        list.add(predicate1);
                    } else {

                        String[] code3 = value.toString().split(",");
                        for (int i = 0; i < code3.length; i++) {
                            Predicate predicate1 = builder.equal(root.get(key), code3[i]);
                            list.add(predicate1);
                        }
                    }

                    predicate.add(builder.or(list.toArray(new Predicate[list.size()])));

                }
                else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);

                }
            }
            //predicate.add(builder.between(root.<LocalDateTime>get("finishDate"),startDate,endDate));
            predicate.add(builder.or(builder.between(root.<LocalDateTime>get("finishDate"),startDate,endDate),builder.between(root.<LocalDateTime>get("cancelDate"),startDate,endDate)));
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }
}
