package com.trism.jesica.Service;

import com.trism.jesica.persistence.Repository.call.TbCallAllRepository;
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

    private final TbCallAllRepository tbCallAllRepository;

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
    public List<Map<String,Object>> getDayListAll(String orderTypeCode ,LocalDateTime startDate,LocalDateTime endDate,String day) {
        return tbCallAllRepository.getDayListAll(startDate,endDate);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getDayListOrderType(String orderTypeCode ,LocalDateTime startDate,LocalDateTime endDate,String day) {
        return tbCallAllRepository.getDayListOrderType(orderTypeCode,startDate,endDate);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getDayListDay(String orderTypeCode ,LocalDateTime startDate,LocalDateTime endDate,String day) {
        return tbCallAllRepository.getDayListDay(startDate,endDate,day);
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
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getUserList(LocalDateTime startDate,LocalDateTime endDate) {
        return tbCallAllRepository.getUserList(startDate,endDate);
    }
}

