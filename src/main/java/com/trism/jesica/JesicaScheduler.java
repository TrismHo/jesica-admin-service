
package com.trism.jesica;

import com.trism.jesica.Service.LangService;
import com.trism.jesica.Util.PropertiesGenerateUtil;
import com.trism.jesica.config.JesicaProperties;
import com.trism.jesica.dto.LangUpdateProperty;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@Slf4j
public class JesicaScheduler {

    @Autowired
    private JesicaProperties jesicaProperties;

    @Autowired
    LangService langService;

    private LocalDateTime dateTime = null;

    @Scheduled(initialDelay = 1000L, fixedDelay = 180000L)
    public void reloadProperties() {
        log.info("@@@ reloadProperties {}", dateTime);

        List<LangUpdateProperty> propList = null;

        //첫 실행시 전체 로드
        if (dateTime == null) {
            log.debug("loading all properties...");
            propList = langService.getAll();
        }
        //두번째 실행부터는 바뀐 정보만 로드
        else {
            log.debug("loading updated properties...");
            propList = langService.getUpdateProperty(dateTime);
        }

        if (propList != null && !propList.isEmpty()) {
            try {
                //가장 최근에 변경된 프로퍼티
                LangUpdateProperty lastUpdated = langService.getLastUpdated();

                String[] language = {"ko", "kh", "en"};
                for (String lang : language) {
                    //프로퍼티 update
                    String result = PropertiesGenerateUtil.updateProperty(propList, jesicaProperties.getMessageFile().getPath(), lang);
                    if ("success".equals(result)) {
                        log.info("언어팩 수정 성공 {}", lang);
                    } else {
                        log.error("언어팩 수정 실패 {}", lang);
                    }
                }

                dateTime = lastUpdated.getTslUpdateDtm();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

