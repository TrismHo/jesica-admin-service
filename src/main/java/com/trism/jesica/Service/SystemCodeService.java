package com.trism.jesica.Service;

import com.trism.jesica.persistence.mysql.Entitiy.system.TbSystemCode;
import com.trism.jesica.persistence.mysql.Repository.system.TbSystemCodeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RequiredArgsConstructor
@Service
@Slf4j
public class SystemCodeService {

    private final TbSystemCodeRepository tbSystemCodeRepository;


    @Transactional(readOnly = true)
    public List<TbSystemCode> tbSystemCodeList(String sysType) {
        return tbSystemCodeRepository.findBySysType(sysType);
    }

    @Transactional
    public int updateSystemCode(
                                String sysCode,
                                String sysName,
                                String codeName,
                                String codeValue,
                                String sysType,
                                String memo
                         ) {

        return tbSystemCodeRepository.update(
                sysCode ,
                sysName,
                codeName,
                codeValue,
                sysType,
                memo
                );
    }



}
