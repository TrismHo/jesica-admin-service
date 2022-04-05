package com.trism.jesica.Service;

import com.trism.jesica.persistence.Entitiy.system.TbServiceProperty;
import com.trism.jesica.persistence.Repository.system.TbServicePropertyRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RequiredArgsConstructor
@Service
@Slf4j
public class SystemPropService {

    private final TbServicePropertyRepository tbServicePropertyRepository;


    @Transactional(readOnly = true)
    public List<TbServiceProperty> tbSystemProp() {
        return tbServicePropertyRepository.findAll();
    }

    @Transactional
    public int updateSystemProp(
                          String propName ,
                          String propValue ,
                          String memo
                         ) {

        return tbServicePropertyRepository.update(
                propName ,
                propValue,
                memo
                );
    }



}
