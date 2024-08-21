package com.trism.jesica.Service;

import com.trism.jesica.persistence.mysql.Repository.call.TbCallAllRepository;
import com.trism.jesica.persistence.mysql.Repository.car.TbRentalInfoRepository;
import com.trism.jesica.persistence.mysql.Repository.manna.TbMannaBrCodeRepository;
import com.trism.jesica.persistence.mysql.Repository.manna.TbMannaOrderRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Service
@Slf4j
public class StatisticsService {
    private final TbMannaOrderRepository tbMannaOrderRepository;

    private final TbCallAllRepository tbCallAllRepository;
    private final TbRentalInfoRepository tbRentalInfoRepository;

    private final TbMannaBrCodeRepository tbMannaBrCodeRepository;

    @Transactional(readOnly = true)
    public List<Map<String,Object>> getTimeList(String orderTypeCode ,LocalDateTime startDate,LocalDateTime endDate,String day) {
        return tbCallAllRepository.getTimeList(orderTypeCode,startDate,endDate,day);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getTimeListAll(String orderTypeCode ,LocalDateTime startDate,LocalDateTime endDate,String day) {
        return tbCallAllRepository.getTimeListAll(startDate,endDate);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getTimeListOrderType(String orderTypeCode ,LocalDateTime startDate,LocalDateTime endDate,String day) {
        return tbCallAllRepository.getTimeListOrderType(orderTypeCode,startDate,endDate);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getTimeListDay(String orderTypeCode ,LocalDateTime startDate,LocalDateTime endDate,String day) {
        return tbCallAllRepository.getTimeListDay(startDate,endDate,day);
    }


    @Transactional(readOnly = true)
    public List<Map<String,Object>> getDayList(String orderTypeCode ,LocalDateTime startDate,LocalDateTime endDate,String day) {
        return tbCallAllRepository.getDayList(orderTypeCode,startDate,endDate,day);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getDayList(String orderTypeCode ,LocalDateTime startDate,LocalDateTime endDate,String day,String storeNo) {
        return tbCallAllRepository.getDayList(orderTypeCode,startDate,endDate,day,storeNo);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getDayListAll(String orderTypeCode ,LocalDateTime startDate,LocalDateTime endDate,String day) {
        return tbCallAllRepository.getDayListAll(startDate,endDate);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getDayListAll(String orderTypeCode ,LocalDateTime startDate,LocalDateTime endDate,String day,String storeNo) {
        return tbCallAllRepository.getDayListAll(startDate,endDate,storeNo);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getDayListOrderType(String orderTypeCode ,LocalDateTime startDate,LocalDateTime endDate,String day) {
        return tbCallAllRepository.getDayListOrderType(orderTypeCode,startDate,endDate);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getDayListOrderType(String orderTypeCode ,LocalDateTime startDate,LocalDateTime endDate,String day,String storeNo) {
        return tbCallAllRepository.getDayListOrderType(orderTypeCode,startDate,endDate,storeNo);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getDayListDay(String orderTypeCode ,LocalDateTime startDate,LocalDateTime endDate,String day) {
        return tbCallAllRepository.getDayListDay(startDate,endDate,day);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getDayListDay(String orderTypeCode ,LocalDateTime startDate,LocalDateTime endDate,String day, String storeNo) {
        return tbCallAllRepository.getDayListDay(startDate,endDate,day,storeNo);
    }

    @Transactional(readOnly = true)
    public List<Map<String,Object>> getMonthListAll(LocalDateTime startDate,LocalDateTime endDate) {
        return tbCallAllRepository.getMonthListAll(startDate,endDate);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getMonthListOrderType(String orderTypeCode ,LocalDateTime startDate,LocalDateTime endDate) {
        return tbCallAllRepository.getMonthListOrderType(orderTypeCode,startDate,endDate);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getWeekListAll(LocalDateTime startDate,LocalDateTime endDate) {
        return tbCallAllRepository.getWeekListAll(startDate,endDate);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getWeekListOrderType(String orderTypeCode ,LocalDateTime startDate,LocalDateTime endDate) {
        return tbCallAllRepository.getWeekListOrderType(orderTypeCode,startDate,endDate);
    }
   /* @Transactional(readOnly = true)
    public List<Map<String,Object>> getUserList(LocalDateTime startDate,LocalDateTime endDate,Integer platform) {
        return tbCallAllRepository.getUserList(startDate,endDate,platform);
    }*/
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getMannaOrderList(LocalDateTime startDate,LocalDateTime endDate,String ordPathCd, String brCode, String ordStatus) {
        return tbMannaOrderRepository.getMannaOrderList(startDate,endDate,ordPathCd,brCode,ordStatus);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getMannaLineDayList(LocalDateTime startDate, LocalDateTime endDate, String ordPathCd, String brCode, String ordStatus) {
        return tbMannaOrderRepository.getMannaLineDayList(startDate,endDate,ordPathCd,brCode,ordStatus);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getMannaLineWeekList(LocalDateTime startDate, LocalDateTime endDate, String ordPathCd, String brCode, String ordStatus) {
        return tbMannaOrderRepository.getMannaLineWeekList(startDate,endDate,ordPathCd,brCode,ordStatus);
    }

    /*@Transactional(readOnly = true)
    public List<Map<String,Object>> getLocationLineWeekList(LocalDateTime startDate,LocalDateTime endDate,Integer platform,String extBrCode) {
        return tbCallAllRepository.getLocationLineWeekList(startDate,endDate,platform,extBrCode);
    }*/
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getLocationLineDayList(LocalDateTime startDate,LocalDateTime endDate,Integer platform) {
        return tbCallAllRepository.getLocationLineDayList(startDate,endDate,platform);
    }


    @Transactional(readOnly = true)
    public List<Map<String,Object>> getUserLineWeekList(LocalDateTime startDate,LocalDateTime endDate,Integer platform,String extBrCode,String addrCode) {
        return tbCallAllRepository.getUserLineWeekList(startDate,endDate,platform,extBrCode,addrCode);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getUserLineDayList(LocalDateTime startDate,LocalDateTime endDate,Integer platform, String extBrCode,String addrCode) {
        return tbCallAllRepository.getUserLineDayList(startDate,endDate,platform,extBrCode,addrCode);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getBaseList(String storeName ,LocalDateTime startDate,LocalDateTime endDate) {
        return tbCallAllRepository.getBaseList(storeName,startDate,endDate);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getSafenNumberList(String storeNo, LocalDateTime startDate,LocalDateTime endDate) {
        return tbRentalInfoRepository.getSafenNumberList(storeNo,startDate,endDate);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getSafenNumberListAll(LocalDateTime startDate,LocalDateTime endDate) {
        return tbRentalInfoRepository.getSafenNumberListAll(startDate,endDate);
    }
}

