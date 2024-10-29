package com.trism.jesica.Service;

import com.trism.jesica.Util.SearchUtil;
import com.trism.jesica.exception.ErrorCode;
import com.trism.jesica.exception.ServiceException;
import com.trism.jesica.persistence.mysql.Entitiy.library.TbLibrary;
import com.trism.jesica.persistence.mysql.Repository.library.TbLibraryRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RequiredArgsConstructor
@Service
@Slf4j
public class LibraryService {
    private final TbLibraryRepository tbLibraryRepository;

    public Map<String, Object> getLibraryList(Map<String,Object> searchValue, Pageable pageable) {
        Specification<TbLibrary> predicate = null;
        Map<String, Object> map = new HashMap<>();
        for (String key : searchValue.keySet()) {
            Object value = searchValue.get(key);
            log.info("@@ key,value = [key]:" + key + ", [value]:" + value);
            searchValue.put(key, (String) value);
            predicate = (Specification<TbLibrary>) SearchUtil.searchLibraryList(searchValue);
        }
        Page<TbLibrary> custPage = tbLibraryRepository.findAll(predicate, pageable);
        ;
        /*List<TbMannaOrder> list = searchValue.isEmpty() ? null
                : tbMannaOrderRepository.findAll(predicate, Sort.by(Sort.Direction.DESC, "ordDate"));*/

        map.put("libraryList",custPage.getContent());
        map.put("totalPage",custPage.getTotalPages());
        map.put("totalElement",custPage.getTotalElements());
        return map;
    }

    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public TbLibrary tbLibraryDetail(Long libNo) {
        Optional<TbLibrary> tbLibrary = tbLibraryRepository.findByIdAndDataStatus(libNo,1);

        if (tbLibrary.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }

        return tbLibrary.get();
    }

}

