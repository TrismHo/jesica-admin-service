package com.trism.jesica.Util;


import com.trism.jesica.persistence.type.CatLevel;
import com.trism.jesica.persistence.type.DataStatus;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
    public static Specification<?> searchNoticePlatform(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
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
    public static Specification<?> searchEvent(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = searchEvent(searchKeyword, root, builder);
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

                    predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
                }
            }
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
        DataStatus delDataStatus = null;
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
                    } else if ("dataStatus".equals(key)) {
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

                    predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
                }
            }
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

                    predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
                }
            }
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

                    predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
                }
            }
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

                    predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
                }
            }
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

                    predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
                }
            }
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

                   predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
               }
            }
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

                   predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
               }
            }
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

                   predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
               }
            }
        } catch (Exception e){
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

                   predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
               }
            }
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

                   predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
               }
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }

    private static List<Predicate>  searchEvent(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
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

                   predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
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

                   predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
               }
            }
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

                   predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
               }
            }
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

                   predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
               }
            }
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

                    predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
                }
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return predicate;
    }
    private static List<Predicate>  searchCallAllList(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
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
                /*if("storeNo".equals(key)){

                    if(!"".equals(value) ) {
                        predicate.add(builder.equal(root.get(key),value));
                    } else {
                        predicate.add(builder.equal(root.get(key),0));
                    }

                }*/
                if ("destAddr3".equals(key) && value != "") {
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("storeName".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("custTel".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("workerName".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                }
                else if ("orderStatusCode".equals(key) && value != "") {

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

                    predicate.add(builder.between(root.<LocalDateTime>get("insertDate"),startDate,endDate));
                }
            }
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
                    if(!"".equals(value) ) {
                        if("00".equals(value) ) {
                            predicate.add(builder.equal(root.get(key),value));
                        } else if("9999".equals(value) ){
                            predicate.add(builder.notEqual(root.get(key),"00"));
                        }
                    }
                } else if ("workerName".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else if ("endDate".equals(key) && value != "") {
                    String string = value.toString() + " 23:59:59";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    endDate = LocalDateTime.parse(string, formatter);
                } else if ("startDate".equals(key) && value != "") {
                    String string = value.toString() + " 00:00:00";
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    startDate = LocalDateTime.parse(string, formatter);

                    predicate.add(builder.between(root.<LocalDateTime>get("authDtm"),startDate,endDate));
                }
            }
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
                Object value = searchKeyword.get(key);if("storeNo".equals(key)){
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
                } else
                if ("endDate".equals(key) && value != "") {
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
                } else
                if ("endDate".equals(key) && value != "") {
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
    }

    private static List<Predicate>  searchUserList(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();

        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        try {
            for (String key : searchKeyword.keySet()) {
                Object value = searchKeyword.get(key);
                if ("name".equals(key) && value != ""){
                    predicate.add(builder.like(root.get(key), "%"+value+"%"));
                } else
                if ("endDate".equals(key) && value != "") {
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
    }
}
