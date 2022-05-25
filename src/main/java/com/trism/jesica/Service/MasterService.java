package com.trism.jesica.Service;

import com.trism.jesica.dto.TbUserStaffDTO;
import com.trism.jesica.persistence.Repository.business.TbUserStaffRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@RequiredArgsConstructor
@Service
@Slf4j
public class MasterService {

    @Autowired
    private final TbUserStaffRepository tbUserStaffRepository;

    @Transactional(readOnly = true)
    public List<TbUserStaffDTO> getUserList(String name, LocalDateTime startDate, LocalDateTime endDate) {
        return  tbUserStaffRepository.findByUserStaffNativeList(name,startDate,endDate);
    }

    @Transactional(readOnly = true)
    public List<TbUserStaffDTO> getUserDataStatusList(String name,Integer dataStatus, LocalDateTime startDate, LocalDateTime endDate) {
        return  tbUserStaffRepository.findByUserStaffNativeList(name,dataStatus,startDate,endDate);
    }




    @Transactional(readOnly = true)
    public TbUserStaffDTO tbUserSearchDetail(Long userNo) {
        return tbUserStaffRepository.findByUserStaffNative(userNo);
    }

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


}

