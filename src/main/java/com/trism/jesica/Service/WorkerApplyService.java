package com.trism.jesica.Service;

import com.trism.jesica.Util.SearchUtil;
import com.trism.jesica.persistence.Entitiy.TbWorkerApply;
import com.trism.jesica.persistence.Repository.TbWorkerApplyRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Service
@Slf4j
public class WorkerApplyService {

    @Autowired
    private final TbWorkerApplyRepository tbWorkerApplyRepository;



 /*   public static Specification<?> equalsKey(String key ,String value) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(key),"%"+value+"%");
    }*/

  /*  public static Specification<?> searchWith(Map<String, Object> searchKeyword) {
        return (Specification<?>) ((root, query, builder) -> {
            List<Predicate> predicate = getPredicateWithKeyword(searchKeyword, root, builder);
            return builder.and(predicate.toArray(new Predicate[0]));
        });
    }*/

  /*  private static List<Predicate> getWorkList(Map<String, Object> searchKeyword, Root<?> root, CriteriaBuilder builder) {
        List<Predicate> predicate = new ArrayList<>();
        for (String key : searchKeyword.keySet()) {
            Object value = searchKeyword.get(key);
            predicate.add(builder.like(
                    root.get(key),"%"+value+"%")
            );
        }
        return predicate;
    }*/

    @Transactional(readOnly = true)
    public List<TbWorkerApply> getWorkList(Map<String,Object> searchValue) {
        Specification<TbWorkerApply> predicate = null;
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            predicate = (Specification<TbWorkerApply>) SearchUtil.getWorkList(searchValue);
        }
        return searchValue.isEmpty() ? tbWorkerApplyRepository.findAll(Sort.by(Sort.Direction.DESC, "updateDate"))
                                     : tbWorkerApplyRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "updateDate"));
    }

}

