package com.trism.jesica.Service;

import com.trism.jesica.persistence.mysql.Repository.manna.TbMannaBrCodeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Service
@Slf4j
public class BrCodeService {

    private final TbMannaBrCodeRepository tbMannaBrCodeRepository;

    @Transactional(readOnly = true)
    public List<Map<String,Object>> getBrCodeList() {
        return tbMannaBrCodeRepository.getBrCodeList();
    }

    @Transactional(readOnly = true)
    public List<Map<String,Object>> getBrCodeSystemList() {
        return tbMannaBrCodeRepository.getBrCodeSystemList();
    }


    @Transactional
    public int updateBrCode(
            String brCode ,
            String brName,
            String useYn,
            String modUserId
    ) {
        return tbMannaBrCodeRepository.update(
                brCode ,
                brName,
                useYn,
                modUserId
        );
    }
    @Transactional
    public int deleteBrCode(
            String brCode
    ) {
        return tbMannaBrCodeRepository.delete(
                brCode
        );
    }
    @Transactional
    public int insertBrCode(
            String brCode ,
            String brName,
            String putUserId
    ) {
        return tbMannaBrCodeRepository.insert(
                brCode ,
                brName,
                putUserId
        );
    }
}

