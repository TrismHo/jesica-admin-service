package com.trism.jesica.Service;

import com.trism.jesica.dto.TbUserStaffDTO;
import com.trism.jesica.persistence.mysql.Repository.business.TbUserStaffRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Service
@Slf4j
public class MasterService {

    @Autowired
    private final TbUserStaffRepository tbUserStaffRepository;

    @Transactional(readOnly = true)
    public List<TbUserStaffDTO> getUserDataStatusList(Object name, Object dataStatus, Object appCode, LocalDateTime startDate, LocalDateTime endDate) {
        return  tbUserStaffRepository.findByUserStaffNativeList(name,dataStatus,appCode,startDate,endDate);
    }


    @Transactional(readOnly = true)
    public Map<String, Object> getUserDataStatusPageList(Object name, Object dataStatus, Object appCode, LocalDateTime startDate, LocalDateTime endDate, Pageable pageable) {
        Map<String, Object> map = new HashMap<>();
        Page<TbUserStaffDTO> tbUserStaff = tbUserStaffRepository.findByUserStaffNativePageList(name,dataStatus,appCode,startDate,endDate,pageable);
        map.put("tbUserStaffList",tbUserStaff.getContent());
        map.put("totalPage",tbUserStaff.getTotalPages());
        map.put("totalElement",tbUserStaff.getTotalElements());

        return map;
    }

    @Transactional(readOnly = true)
    public TbUserStaffDTO tbUserSearchDetail(Long userNo) {
        return tbUserStaffRepository.findByUserStaffNative(userNo);
    }


}

