
package com.trism.jesica.Service;

import com.trism.jesica.dto.LangUpdateProperty;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteLang;
import com.trism.jesica.persistence.mysql.Repository.TbSiteLangRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@RequiredArgsConstructor
@Service
@Slf4j
public class LangService {

    private final TbSiteLangRepository tblSiteLangRepository;


    @Transactional(readOnly = true, value = "mysqlTransactionManager")
    public List<TbSiteLang> tblSiteLang() {
        return tblSiteLangRepository.getAllAndActive();
    }

    @Transactional(value = "mysqlTransactionManager" )
    public int updateLang(Long tslId ,
                                        String langName ,
                                        String langKey ,
                                        String langKo ,
                                        String langEn ,
                                        String langKh) {


        String[] array = langKey.split("\\.");
        String langKeyGruop = "";
        String langKeyOne = "";
        String langKeyTwo = "";
        String langKeyThree = "";
        String langKeyFour = "";

        int i = 0;
        for(String arrayStr : array) {
            System.out.println(arrayStr);
            if(i == 0 && !arrayStr.isEmpty()){
                langKeyGruop = arrayStr;
            }else if (i == 1 && !arrayStr.isEmpty()){
                langKeyOne = arrayStr;
            }else if (i == 2 && !arrayStr.isEmpty()){
                langKeyTwo = arrayStr;
            }else if (i == 3 && !arrayStr.isEmpty()){
                langKeyThree = arrayStr;
            }else if (i == 4 && !arrayStr.isEmpty()){
                langKeyFour = arrayStr;
            }
            i++;
        }

        return tblSiteLangRepository.update(tslId ,
                langName,
                langKeyGruop,
                langKeyOne,
                langKeyTwo,
                langKeyThree,
                langKeyFour,
                langKo,
                langEn,
                langKh);
    }
    public LangUpdateProperty getLastUpdated() {
        return tblSiteLangRepository.getByMaxUpdateTime();
    }

    public List<LangUpdateProperty> getUpdateProperty(LocalDateTime lastDateTime) {
        return tblSiteLangRepository.getUpdateProperty(lastDateTime);
    }
    public List<LangUpdateProperty> getAll() {
        return tblSiteLangRepository.getAllList();
    }

   /* @Transactional
    public int update(BasContents basContents , MultipartFile imgFile) {
//        if(basContents.getBcBccId().equals("-1")) {
            basContents.setBcBccId(null);
        }//
        if (imgFile.isEmpty()){
            return basContentsRepository.update(basContents.getBcBsId(), basContents.getBcType(), basContents.getBcContent(), basContents.getBcDisease(), basContents.getBcName() ,basContents.getBcId()  , basContents.getBcBccId());
        } else {
            return basContentsRepository.update(basContents.getBcBsId(), basContents.getBcType(), basContents.getBcContent(), basContents.getBcDisease(), basContents.getBcName() ,basContents.getBcId() , basContents.getBcThumbnail() , basContents.getBcBccId());
        }
    }

    @Transactional(readOnly = true)
    public BasContents getContentsCare(Integer bcId) {
        Optional<BasContents> basContents = basContentsRepository.findById(bcId);
        if (basContents.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return basContents.get();
    }

    @Transactional(readOnly = true)
    public BasContentsCategory getContentsCategory(Integer bccId) {
        BasContentsCategory basContentsCategory = basContentsCategoryRepository.findByBccIdAndBccActive(bccId, 1);
        //if(basContentsCategory == null) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }//
        return basContentsCategory;
    }

    @Transactional(readOnly = true)
    public List<BasContentsCategoryGroup> getCategoryGroup(Integer bccgBcType) {
        List<BasContentsCategoryGroup> basContentsCategoryGroups= basContentsCategoryGroupRepository.findByBccgBcTypeAndBccgActive(bccgBcType, 1);
        return basContentsCategoryGroups;
    }

    @Transactional(readOnly = true)
    public List<BasContentsCategory> getCategoryList(Integer bccBcType, Integer bccBccgId) {
        List<BasContentsCategory> basContentsCategories = basContentsCategoryRepository.findByBccBcTypeAndBccBccgIdAndBccActive(bccBcType,bccBccgId, 1);
        return basContentsCategories;
    }

    @Transactional
    public int delete(Integer bcId) {
        return basContentsRepository.deleteActive(bcId);
    }*/

}

