package com.trism.jesica.Service;

import com.trism.jesica.Util.SearchUtil;
import com.trism.jesica.config.JesicaProperties;
import com.trism.jesica.exception.ErrorCode;
import com.trism.jesica.exception.ServiceException;
import com.trism.jesica.persistence.Entitiy.board.TbNoticeCompany;
import com.trism.jesica.persistence.Entitiy.board.TbNoticePlatform;
import com.trism.jesica.persistence.Entitiy.board.TbNoticeRelease;
import com.trism.jesica.persistence.Entitiy.board.TbNoticeWorker;
import com.trism.jesica.persistence.Entitiy.event.TbEvent;
import com.trism.jesica.persistence.Repository.board.TbNoticeCompanyRepository;
import com.trism.jesica.persistence.Repository.board.TbNoticePlatformRepository;
import com.trism.jesica.persistence.Repository.board.TbNoticeReleaseRepository;
import com.trism.jesica.persistence.Repository.board.TbNoticeWorkerRepository;
import com.trism.jesica.persistence.Repository.event.TbEventRepository;
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
public class BoardService {

    private final JesicaProperties jesicaProperties;

    @Autowired
    private final TbNoticePlatformRepository tbNoticePlatformRepository;

    @Autowired
    private final TbNoticeCompanyRepository tbNoticeCompanyRepository;

    @Autowired
    private final TbNoticeWorkerRepository tbNoticeWorkerRepository;

    @Autowired
    private final TbEventRepository tbEventRepository;

    @Autowired
    private final TbNoticeReleaseRepository tbNoticeReleaseRepository;


    @Transactional(readOnly = true)
    public List<TbNoticePlatform> tbNoticePlatFormSearch(Map<String,Object> searchValue) {
        Specification<TbNoticePlatform> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key,(String)value);
            predicate = (Specification<TbNoticePlatform>) SearchUtil.searchNoticePlatform(searchValue);
        }
        return searchValue.isEmpty() ? null
                : tbNoticePlatformRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
/*
        return searchValue.isEmpty() ? tbNoticePlatformRepository.findAll(Sort.by(Sort.Direction.DESC, "insertDate"))
                : tbNoticePlatformRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
*/
    }

    @Transactional(readOnly = true)
    public TbNoticePlatform getTbNoticePlatFormDetail(Long noticeNo) {
        Optional<TbNoticePlatform> tbNoticePlatForm = tbNoticePlatformRepository.findById(noticeNo);
        if(tbNoticePlatForm.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbNoticePlatForm.get();
    }

    @Transactional(readOnly = true)
    public List<TbNoticeCompany> tbNoticeCompanySearch(Map<String,Object> searchValue) {
        Specification<TbNoticeCompany> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key,(String)value);
            predicate = (Specification<TbNoticeCompany>) SearchUtil.searchNoticeCompany(searchValue);
        }
        return searchValue.isEmpty() ? null
                : tbNoticeCompanyRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    @Transactional(readOnly = true)
    public TbNoticeCompany getTbNoticeCompanyDetail(Long tbStoreGoodsNo) {
        Optional<TbNoticeCompany> tbNoticePlatForm = tbNoticeCompanyRepository.findById(tbStoreGoodsNo);
        if(tbNoticePlatForm.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbNoticePlatForm.get();
    }


    @Transactional(readOnly = true)
    public List<TbNoticeWorker> tbNoticeWorkerSearch(Map<String,Object> searchValue) {
        Specification<TbNoticeWorker> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key,(String)value);
            predicate = (Specification<TbNoticeWorker>) SearchUtil.searchNoticeWorker(searchValue);
        }
        return searchValue.isEmpty() ? null
                : tbNoticeWorkerRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    @Transactional(readOnly = true)
    public TbNoticeWorker getTbNoticeWorkerDetail(Long tbStoreGoodsNo) {
        Optional<TbNoticeWorker> tbNoticePlatForm = tbNoticeWorkerRepository.findById(tbStoreGoodsNo);
        if(tbNoticePlatForm.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbNoticePlatForm.get();
    }

    @Transactional(readOnly = true)
    public List<TbEvent> tbEventSearch(Map<String,Object> searchValue) {
        Specification<TbEvent> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key,(String)value);
            predicate = (Specification<TbEvent>) SearchUtil.searchEvent(searchValue);
        }
        return searchValue.isEmpty() ? tbEventRepository.findAll(Sort.by(Sort.Direction.DESC, "insertDate"))
                : tbEventRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "insertDate"));
    }

    @Transactional(readOnly = true)
    public List<TbNoticeRelease> tbReleaseSearch(Map<String,Object> searchValue) {
        Specification<TbNoticeRelease> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key,(String)value);
            predicate = (Specification<TbNoticeRelease>) SearchUtil.searchRelese(searchValue);
        }
        return searchValue.isEmpty() ? tbNoticeReleaseRepository.findAll(Sort.by(Sort.Direction.DESC, "updateDate"))
                : tbNoticeReleaseRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "updateDate"));
    }

    @Transactional(readOnly = true)
    public TbEvent getTbEventDetail(Long eventId) {
        Optional<TbEvent> tbNoticePlatForm = tbEventRepository.findById(eventId);
        if(tbNoticePlatForm.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbNoticePlatForm.get();
    }

    @Transactional(readOnly = true)
    public TbNoticeRelease getTbReleaseDetail(Long eventId) {
        Optional<TbNoticeRelease> tbNoticeRelease = tbNoticeReleaseRepository.findById(eventId);
        if(tbNoticeRelease.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbNoticeRelease.get();
    }


    @Transactional(readOnly = true)
    public List<Map<String,Object>> getUpdateListLimit() {
        return tbNoticeReleaseRepository.findAllLimit();
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getPlatformListLimit() {
        return tbNoticePlatformRepository.findAllLimit();
    }

}

