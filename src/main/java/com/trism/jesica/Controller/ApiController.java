package com.trism.jesica.Controller;

/*import com.trism.manna.Service.LangService;*/

import com.google.gson.JsonObject;
import com.trism.jesica.Service.ApiService;
import com.trism.jesica.Service.CipherService;
import com.trism.jesica.Service.LangService;
import com.trism.jesica.Util.GetClientIp;
import com.trism.jesica.Util.RestTemplateUtil;
import com.trism.jesica.config.JesicaProperties;
import com.trism.jesica.dto.*;
import com.trism.jesica.persistence.Entitiy.block.TbDlvyArea;
import com.trism.jesica.persistence.Entitiy.board.TbNoticeCompany;
import com.trism.jesica.persistence.Entitiy.board.TbNoticePlatform;
import com.trism.jesica.persistence.Entitiy.board.TbNoticeRelease;
import com.trism.jesica.persistence.Entitiy.board.TbNoticeWorker;
import com.trism.jesica.persistence.Entitiy.business.TbUserWorker;
import com.trism.jesica.persistence.Entitiy.common.LoginSession;
import com.trism.jesica.persistence.Entitiy.event.TbEvent;
import com.trism.jesica.persistence.Entitiy.goods.TbStoreCharge;
import com.trism.jesica.persistence.Entitiy.goods.TbStoreGoods;
import com.trism.jesica.persistence.Entitiy.goods.TbStoreOption;
import com.trism.jesica.persistence.Entitiy.goods.TbStorePrice;
import com.trism.jesica.persistence.Entitiy.street.TbDlvyPrice;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLDecoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.*;

@RequestMapping("/api")
@RestController
@Controller
@AllArgsConstructor
@Slf4j
public class ApiController {

    private final LangService langService;
    private final JesicaProperties jesicaProperties;
    HttpSession session;

    private final ApiService apiService;

    @Autowired
    private CipherService cipherService;

    @Autowired
    private RestTemplateUtil restTemplateUtil;

    @Autowired
    private CacheManager cacheManager;

    //테스트용 API
    @ResponseBody
    @GetMapping("/test/test")
    public ResponseEntity<?> test()
     {
        log.info("Test::{}", "test");
        /*log.info("TbHead tbBusinessInfoData::{}", tbBusinessInfoData);*/
        Map<String,Object> map = new HashMap<>();
        map.put("result","400");
        map.put("message", "테스트");
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //현재 토큰정보 확인 1번
    //최초1회 실행
    /*@ResponseBody
    @GetMapping("/token/info")
    public ResponseEntity<?> checkToken(HttpServletRequest request)
    {
        log.info("tokenInfo::{}", "test");
        JsonObject params = new JsonObject();
        *//*HttpUtil.callInfo(params,"GET", request);*//*
        ResponseEntity<Map> map = restTemplateUtil.checkToken();
        log.info("result::{}",map);
        Map<String,Object> maps = new HashMap<>();

        maps.put("result","400");
        maps.put("message", "테스트");
        return new ResponseEntity<>(map,HttpStatus.OK);
    }*/

    //리프레쉬 토큰 호출 만료되었을때만 호출
    //vue용
   /* @CrossOrigin(origins = "*", allowedHeaders = "*")
    @PostMapping("/token/refresh/vue")
    public ResponseEntity<?> refreshToken(HttpServletRequest request)
    {
        log.info("Test::{}", "test");
        JsonObject params = new JsonObject();
        Map<String,Object> map = new HashMap<>();
        String accessToken = request.getAttribute("accessToken").toString();


        //쿠키 조회
        Cookie[] cookies = request.getCookies();
        String clientId = null;
        String code = null;
        String deviceId = null;
        String refreshTokenEnd = null;
        String refreshToken = null;

        if(cookies!= null && cookies.length > 0) {
            for(Cookie cookie:cookies) {
                if(cookie.getName().contains("clientId")) {
                    clientId = cookie.getValue();
                    log.info("clientId_first::"+clientId);
                } else if(cookie.getName().contains("code")) {
                    code = cookie.getValue();
                    log.info("code_first::"+code);
                } else if(cookie.getName().contains("deviceId")) {
                    deviceId = cookie.getValue();
                    log.info("deviceId_first::"+deviceId);
                } else if(cookie.getName().contains("refreshToken")) {
                    refreshTokenEnd = cookie.getValue();
                    log.info("refreshTokenEnd_first::"+refreshTokenEnd);
                }

            }
        }
        map.put("accessToken",accessToken);
        map.put("refreshToken",refreshToken);

        log.info("accessToken::{}", accessToken);
        log.info("refreshToken::{}",refreshToken);
        return new ResponseEntity<>(map,HttpStatus.OK);
    }*/

    @ResponseBody
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @GetMapping("/token/refresh/vue")
    public ResponseEntity<?> refreshToken(@RequestHeader HttpHeaders httpHeaders,
                                          HttpServletRequest request,
                                          HttpServletResponse response)
    {
        log.info("Test::{}", "test");
        log.info("httpHeaders::{}"+ httpHeaders);
        JsonObject params = new JsonObject();
        Map<String,Object> map = new HashMap<>();
        HttpSession session = request.getSession();

        try{
            //쿠키 조회
            Cookie[] cookies = request.getCookies();
            String clientId = null;
            String code = null;
            String deviceId = null;
            String refreshTokenEnd = null;
            String refreshToken = null;
            String accessToken = "";
            if(cookies!= null && cookies.length > 0) {
                for(Cookie cookie:cookies) {
                    if(cookie.getName().contains("clientId")) {
                        clientId = cookie.getValue();
                        log.info("clientId_first::"+clientId);
                    } else if(cookie.getName().contains("code")) {
                        code = cookie.getValue();
                        log.info("code_first::"+code);
                    } else if(cookie.getName().contains("deviceId")) {
                        deviceId = cookie.getValue();
                        log.info("deviceId_first::"+deviceId);
                    } else if(cookie.getName().contains("refreshToken")) {
                        refreshTokenEnd = cookie.getValue();
                        log.info("refreshTokenEnd_first::"+refreshTokenEnd);
                    }
                }
            }

            Cache ehCacheAll  = cacheManager.getCache("loginCache");
            clientId =  ehCacheAll.get("clientId").get().toString();
            code = ehCacheAll.get("code").get().toString();
            deviceId = ehCacheAll.get("deviceId").get().toString();
            refreshToken = ehCacheAll.get("refreshToken").get().toString();

            log.info("cache1::"+clientId);
            log.info("cache2::"+code);
            log.info("cache3::"+deviceId);
            log.info("cache4::"+refreshToken);

            //log.info("httpHeaders::{}"+ httpHeaders.get("authorization"));
            if ( httpHeaders.get("authorization") != null) {
                accessToken = httpHeaders.get("authorization").toString();
                //accessToken = httpHeaders.get("authorization").toString();
            }

            //토큰 갱신
            ResponseEntity<Map> tokenMap2 = restTemplateUtil.refreshTokenVue(refreshToken,code,clientId,accessToken);
            Map<String,Object> codeMap2 = (Map)tokenMap2.getBody();
            String resultAccessToken = (String)((Map) tokenMap2.getBody().get("data")).get("accessToken");

            if(!"OK".equals(codeMap2.get("serviceStatus"))){
                map.put("accessToken",null);
            }else {
                log.info("cache4::" + resultAccessToken);
                map.put("accessToken", resultAccessToken);
                session.setAttribute("accessToken",resultAccessToken);
            }


        }catch (Exception e){
            e.printStackTrace();
        }

        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //리프레쉬 토큰 호출 만료되었을때만 호출
    //uuid - 스크립트에서 받아오게 수정
/*
    public ResponseEntity<?> refreshToken(String pass , HttpServletRequest request)
    {
        log.info("Test::{}", "test");
        pass = "1234";
        JsonObject params = new JsonObject();
        String encrypt = cipherService.encryptAES(pass);
        String uuid = UUID.randomUUID().toString();
        restTemplateUtil.refreshToken();
        Map<String,Object> map = new HashMap<>();

        map.put("result","400");
        map.put("message", "테스트");
        return new ResponseEntity<>(map,HttpStatus.OK);
    }
*/


    //지역검색
    @ResponseBody
    @GetMapping("/location/getLocation")
    public ResponseEntity<?> getLocation(@RequestParam("type") String type,HttpSession session)
    {
        ResponseEntity<Map> map = restTemplateUtil.getLocation(session,type);
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //테스트용 API
    @ResponseBody
    @PostMapping("/map/getAddressList")
    public ResponseEntity<?> getAddressList(@RequestParam("address") String address)
    {
        log.info("Test::{}", "test");
        /*log.info("TbHead tbBusinessInfoData::{}", tbBusinessInfoData);*/
        Map<String,Object> map = new HashMap<>();
        map.put("result","400");
        map.put("message", "테스트");
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //언어팩 수정
    @ResponseBody
    @GetMapping("/language/update")
    public ResponseEntity<?> languageUpdate(@RequestParam("tslId") Long tslId,
                                                  @RequestParam("langName") String langName,
                                                  @RequestParam("langKey") String langKey,
                                                  @RequestParam("langKo") String langKo,
                                                  @RequestParam("langEn") String langEn,
                                                  @RequestParam("langKh") String langKh) {
        log.info("languageUpdate tslId::{}", tslId);
        Map<String,Object> map = new HashMap<>();

        try {
            int result = langService.updateLang(tslId ,langName ,langKey ,langKo ,langEn ,langKh);
            map.put("result" , result);

        } catch (Exception e) {
            map.put("result" , 0);
            e.printStackTrace();
            return new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    //제휴본사 insert
    @ResponseBody
    @PostMapping("/affiliated/insert/action")
    public ResponseEntity<?> affiliatedInsertAction(
            @RequestPart(value="tbHeadData" ,required = true) TbHeadData tbHead
            ,@RequestPart(value="tbBusinessInfoData" ,required = false) TbBusinessInfoData tbBusinessInfoData
    ) {
        log.info("TbHead tbHeadNo::{}", tbHead.getHeadNo());
        /*log.info("TbHead tbBusinessInfoData::{}", tbBusinessInfoData);*/
        int result =  apiService.insertTbHead(tbHead, tbBusinessInfoData);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }


    //제휴본사 update
    @ResponseBody
    @PostMapping("/affiliated/update/action")
    public ResponseEntity<?> affiliatedUpdateAction(
            @RequestPart(value="tbHeadData" ,required = true) TbHeadData tbHead
            ,@RequestPart(value="tbBusinessInfoData" ,required = false) TbBusinessInfoData tbBusinessInfoData

    ) {
        /*log.info("TbHead tbBusinessInfoData::{}", tbBusinessInfoData);*/
        int result =  apiService.updateTbHead(tbHead, tbBusinessInfoData);
        Map<String,Object> map = new HashMap<>();
        if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }


    //총판 insert
    @ResponseBody
    @PostMapping("/distributor/insert/action")
    public ResponseEntity<?> distributorInsertAction(
            @RequestPart(value="tbBranchData" ,required = true) TbBranchData tbBranchData
            ,@RequestPart(value="tbBusinessInfoData" ,required = false) TbBusinessInfoData tbBusinessInfoData
) {
        log.info("tbBranchNo::{}", tbBranchData.getBranchNo());
        /*log.info("tbBusinessInfoData::{}", tbBusinessInfoData);*/
        int result =  apiService.insertTbBranch(tbBranchData,tbBusinessInfoData);
        Map<String,Object> map = new HashMap<>();
        if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //총판 update
    @ResponseBody
    @PostMapping("/distributor/update/action")
    public ResponseEntity<?> distributorUpdateAction(
            @RequestPart(value="tbBranchData" ,required = true) TbBranchData tbBranchData
            ,@RequestPart(value="tbBusinessInfoData" ,required = false) TbBusinessInfoData tbBusinessInfoData
    ) {
        log.info("tbBranchNo::{}", tbBranchData.getBranchNo());
        /*log.info("tbBusinessInfoData::{}", tbBusinessInfoData);*/
        int result =  apiService.updateTbBranch(tbBranchData,tbBusinessInfoData);
        Map<String,Object> map = new HashMap<>();
        if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }


    //가맹점 insert
    @ResponseBody
    @PostMapping("/affilfranch/insert/action")
    public ResponseEntity<?> affilfranchInsertAction(
            @RequestPart(value="tbStoreData" ,required = true) TbStoreData tbStoreData
            ,@RequestPart(value="tbBusinessInfoData" ,required = false) TbBusinessInfoData tbBusinessInfoData
    ) {
        log.info("TbHead tbStoreNo::{}", tbStoreData.getStoreNo());
        /*log.info("tbBusinessInfoData::{}", tbBusinessInfoData);*/
        int result =  apiService.insertTbStore(tbStoreData, tbBusinessInfoData);
        Map<String,Object> map = new HashMap<>();
        if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //가맹점 update
    @ResponseBody
    @PostMapping("/affilfranch/update/action")
    public ResponseEntity<?> affilfranchUpdateAction(@RequestPart TbStoreData tbStoreData
                                                    ,@RequestPart(value="tbBusinessInfoData" ,required = false) TbBusinessInfoData tbBusinessInfoData
                                                    ,@RequestPart(value="tbStoreCategoryFo" ,required = false) List<TbStoreCategoryFoData> tbStoreCategoryFo
                                                    ,@RequestPart(value="tbStoreCharge" ,required = false) TbStoreCharge tbStoreCharge
                                                    ,@RequestPart(value="tbStorePrice" ,required = false) TbStorePrice tbStorePrice
                                                    ,@RequestPart(value="deleteList" ,required = false) List<HashMap<String,Object>> deleteList
                                                    ,@RequestPart(value="imgFile1" ,required = false) MultipartFile imgFile
                                                    ,@RequestPart(value="imgFileSmall", required = false) MultipartFile imgFileSmall) {
        log.info("tbStoreNo::{}", tbStoreData.getStoreNo());
     /*   log.info("TbBusinessInfoData::{}", tbBusinessInfoData);
        log.info("TbStoreCategoryFo::{}", tbStoreCategoryFo);*/
        log.info("deleteList::{}", deleteList);
        log.info("imgFile::{}", imgFile);
        log.info("imgFileSmall::{}", imgFileSmall);
        int result =  apiService.updateTbStore(tbStoreData, tbBusinessInfoData, tbStoreCategoryFo,tbStoreCharge,tbStorePrice, deleteList, imgFile, imgFileSmall);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //가맹점 (멀티가맹점) update
    @ResponseBody
    @PostMapping("//affilfranch/multi/update/action")
    public ResponseEntity<?> affilfranchMultiUpdateAction(@RequestPart(value="tbStoreMultiData" ,required = true) TbStoreMultiData tbStoreMultiData) {
        log.info("tbStoreNo::{}", tbStoreMultiData.getStoreNo());
        int result =  apiService.updateMultiTbStore(tbStoreMultiData);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //상품 insert
    @ResponseBody
    @PostMapping("/merchandise/insert/action")
    public ResponseEntity<?> merchandiseInsertAction(@RequestPart(value="tbStoreGoodsData" ,required = true) TbStoreGoodsData tbStoreGoodsData
                                                    ,@RequestPart(value="imgFile1" ,required = false) MultipartFile imgFile1
                                                    ,@RequestPart(value="imgFile2", required = false) MultipartFile imgFile2
                                                    ,@RequestPart(value="imgFile3", required = false) MultipartFile imgFile3
                                                    ,@RequestPart(value="imgFileSmall", required = false) MultipartFile imgFileSmall
    ) {
        log.info("tbStoreGoodsData::{}", tbStoreGoodsData);
        log.info("imgFile1::{}", imgFile1);
        log.info("imgFile2::{}", imgFile2);
        log.info("imgFile3::{}", imgFile3);
        log.info("imgFileSmall::{}", imgFileSmall);
        Map<String,Object> map = new HashMap<>();
        try {
            TbStoreGoods tbStoreGoods = apiService.insertTbStoreGoods(tbStoreGoodsData,imgFile1,imgFile2,imgFile3,imgFileSmall);

            if(tbStoreGoods.getStoreGoodsNo() != null) {
                map.put("result","200");
                map.put("message", "등록 되었습니다.");
            } else {
                map.put("result","400");
                map.put("message", "등록에 실패하였습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //상품 update
    @ResponseBody
    @PostMapping("/merchandise/update/action")
    public ResponseEntity<?> merchandiseUpdateAction(@RequestPart(value="tbStoreGoodsData" ,required = true) TbStoreGoodsData tbStoreGoodsData
            ,@RequestPart(value="tbStoreGoodsItemData" ,required = true) List<TbStoreGoodsItemData> tbStoreGoodsItemData
            ,@RequestPart(value="deleteIdList" ,required = true) List deleteIdList
            ,@RequestPart(value="imgFile1" ,required = false) MultipartFile imgFile1
            ,@RequestPart(value="imgFile2", required = false) MultipartFile imgFile2
            ,@RequestPart(value="imgFile3", required = false) MultipartFile imgFile3
            ,@RequestPart(value="imgFileSmall", required = false) MultipartFile imgFileSmall
    ) {
        log.info("tbStoreGoodsData::{}", tbStoreGoodsData);
        log.info("tbStoreGoodsItemData::{}", tbStoreGoodsItemData);
        log.info("imgFile1::{}", imgFile1);
        log.info("imgFile2::{}", imgFile2);
        log.info("imgFile3::{}", imgFile3);
        log.info("imgFileSmall::{}", imgFileSmall);
        log.info("deleteIdList::{}", deleteIdList);
        Map<String,Object> map = new HashMap<>();
        try {
            TbStoreGoods tbStoreGoods = apiService.updateTbStoreGoods(tbStoreGoodsData, deleteIdList, tbStoreGoodsItemData,imgFile1,imgFile2,imgFile3,imgFileSmall);

            if(tbStoreGoods.getStoreGoodsNo() != null) {
                map.put("result","200");
                map.put("message", "등록 되었습니다.");
            } else {
                map.put("result","400");
                map.put("message", "등록에 실패하였습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //상품 insert
    @ResponseBody
    @PostMapping("/merchanext/insert/action")
    public ResponseEntity<?> merchanextInsertAction(@RequestPart(value="tbStoreOptionData" ,required = true) TbStoreOptionData tbStoreOptionData
            ,@RequestPart(value="tbStoreOptionItemData" ,required = true) List<TbStoreOptionItemData> tbStoreOptionItemData
    ) {
        log.info("tbStoreOptionData::{}", tbStoreOptionData);
        Map<String,Object> map = new HashMap<>();
        try {
            int result = apiService.insertTbStoreOption(tbStoreOptionData, tbStoreOptionItemData);

            if(result > 0) {
                map.put("result","200");
                map.put("message", "등록 되었습니다.");
            } else {
                map.put("result","400");
                map.put("message", "등록에 실패하였습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //상품 update
    @ResponseBody
    @PostMapping("/merchanext/update/action")
    public ResponseEntity<?> merchanextUpdateAction(@RequestPart(value="tbStoreOptionData" ,required = true) TbStoreOptionData tbStoreOptionData
            ,@RequestPart(value="tbStoreOptionItemData" ,required = true) List<TbStoreOptionItemData> tbStoreOptionItemData
            ,@RequestPart(value="deleteIdList" ,required = true) List deleteIdList
    ) {
        log.info("tbStoreOptionData::{}", tbStoreOptionData);
        log.info("tbStoreOptionItemData::{}", tbStoreOptionItemData);
        log.info("deleteIdList::{}", deleteIdList);
        Map<String,Object> map = new HashMap<>();
        try {
            TbStoreOption tbStoreOption = apiService.updateTbStoreOption(tbStoreOptionData, deleteIdList, tbStoreOptionItemData);

            if(tbStoreOption.getStoreNo() != null) {
                map.put("result","200");
                map.put("message", "등록 되었습니다.");
            } else {
                map.put("result","400");
                map.put("message", "등록에 실패하였습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //제휴본사 조회
    @ResponseBody
    @PostMapping("/search/head/list")
    public ResponseEntity<?> searchHeadList(@RequestBody Map<String,Object> searchValue) {
        log.info("TbStore searchValue::{}", searchValue);
        Map<String,Object> map = new HashMap<>();
        map.put("searchHeadList",apiService.tbHeadSearchList(searchValue));
      /*  if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }*/
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    // 총판조회
    @ResponseBody
    @PostMapping("/search/branch/list")
    public ResponseEntity<?> searchBranchList(@RequestBody Map<String,Object> searchValue) {
        log.info("TbStore searchValue::{}", searchValue);
        Map<String,Object> map = new HashMap<>();
        map.put("searchBranchList",apiService.tbBranchSearchList(searchValue));
      /*  if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }*/
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    // 브랜드조회
    @ResponseBody
    @PostMapping("/search/brand/list")
    public ResponseEntity<?> searchBrandList(@RequestBody Map<String,Object> searchValue) {
        log.info("TbStore searchValue::{}", searchValue);
        Map<String,Object> map = new HashMap<>();
        map.put("searchBrandList",apiService.tbBrandSearchList(searchValue));
      /*  if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }*/
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    // 가맹점 조회
    @ResponseBody
    @PostMapping("/search/store/list")
    public ResponseEntity<?> searchStoreList(@RequestBody Map<String,Object> searchValue) {
        log.info("TbStore searchValue::{}", searchValue);
        Map<String,Object> map = new HashMap<>();
        map.put("searchStoreList",apiService.tbStoreSearchList(searchValue));
      /*  if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }*/
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //배달대행 조회
    @ResponseBody
    @PostMapping("/search/dlvy/list")
    public ResponseEntity<?> searchDlvyList(@RequestBody Map<String,Object> searchValue) {
        log.info("TbStore searchValue::{}", searchValue);
        Map<String,Object> map = new HashMap<>();
        map.put("searchDlvyList",apiService.tbDlvySearchList(searchValue));
      /*  if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }*/
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    /**
     * 파일 보기
     */
    @RequestMapping("/img/fileLoad")
    public void fileLoad(String filePath, HttpServletRequest req , HttpServletResponse res) {
        log.info(filePath);

        InputStream is = null;
        ByteArrayOutputStream bos = null;
        Path path = null;

        Paths.get(filePath);
        try {
            //test
            path = Paths.get(jesicaProperties.getBaseImgPath().getPath(), URLDecoder.decode(filePath,"UTF-8"));
            is = new FileInputStream(path.toFile().getPath());

            bos = new ByteArrayOutputStream();

            byte [] buffer = new byte[512];
            int readBuffer = 0;
            while((readBuffer = is.read(buffer)) != -1) {
                bos.write(buffer, 0, readBuffer);
            }
            res.getOutputStream().write(bos.toByteArray());
        }catch (FileNotFoundException e) {
           log.info("file not found!!");
        }catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (is != null) {
                    is.close();
                }
                if (bos != null) {
                    bos.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    //카테고리 Fo insert
    @ResponseBody
    @PostMapping("/categoryFo/insert")
    public ResponseEntity<?> categoryFoInsert(@RequestParam("storeNo") String storeNo,
                                              @RequestParam("catCode") String catCode,
                                                @RequestParam("catLevel") Integer catLevel,
                                                @RequestParam("parentCatCode") String parentCatCode
                                              ) {
        log.info("storeNo cateCode::{}", storeNo);

        int result =  apiService.insertCategoryFo(Long.parseLong(storeNo), catCode, catLevel, parentCatCode);
        Map<String,Object> map = new HashMap<>();
        if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //카테고리 Fo delete
    @ResponseBody
    @PostMapping("/categoryFo/delete")
    public ResponseEntity<?> categoryFoDelete(@RequestParam("storeNo") String storeNo,
                                              @RequestParam("catCode") String catCode,
                                                @RequestParam(value = "catLevel", required = false) Integer catLevel,
                                                @RequestParam (value ="parentCatCode", required = false) String parentCatCode
                                              ) {
        log.info("storeNo cateCode::{}", storeNo);
        int result =  apiService.deleteCategoryFo(Long.parseLong(storeNo), catCode, catLevel, parentCatCode);
        Map<String,Object> map = new HashMap<>();
        if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //상품그룹 등록
    @ResponseBody
    @PostMapping("/merchant/merchangroup/insert")
    public ResponseEntity<?> merchangroupInsert(@RequestBody TbStoreCategoryData tbStoreCategoryData
    ) {
        log.info("tbStoreCategoryData::{}", tbStoreCategoryData);

        int result =  apiService.insertTbStoreCategory(tbStoreCategoryData);
        Map<String,Object> map = new HashMap<>();
        if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    // 상품그룹 카테고리 조회
    @ResponseBody
    @PostMapping("/merchant/merchangroup/store")
    public ResponseEntity<?> searchMerchangroupList(@RequestParam("storeNo") String storeNo) {
        log.info("TbStoreCategory storeNo::{}", storeNo);
        Map<String,Object> map = new HashMap<>();
        map.put("searchBranchList",apiService.searchMerchangroupList(Integer.parseInt(storeNo)));
      /*  if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");merchant/merchangroup/insert
        }*/
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //상품그룹 삭제
    @ResponseBody
    @PostMapping("/merchant/merchangroup/delete")
    public ResponseEntity<?> merchangroupDelete(@RequestParam("storeCatNo") Long storeCatNo,
                                                @RequestParam("storeNo") Integer storeNo
    ) {
        log.info("storeCatNo::{}", storeCatNo);

        int result =  apiService.deleteTbStoreCategory(storeCatNo, storeNo);
        Map<String,Object> map = new HashMap<>();
        if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }




    //상품그룹 수정
    @ResponseBody
    @PostMapping("/merchant/merchangroup/update")
    public ResponseEntity<?> merchangroupUpdate(@RequestBody TbStoreCategoryData tbStoreCategoryData
    ) {
        log.info("tbStoreCategoryData::{}", tbStoreCategoryData);

        int result =  apiService.updateTbStoreCategory(tbStoreCategoryData);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    // 상품그룹 카테고리 조회
    @ResponseBody
    @PostMapping("/merchant/merchangroup/option")
    public ResponseEntity<?> searchMerchangroupOptionList(@RequestParam("storeNo") String storeNo) {
        log.info("TbStoreCategory storeNo::{}", storeNo);
        Map<String,Object> map = new HashMap<>();
        map.put("searchBranchList",apiService.searchMerchangroupList(Integer.parseInt(storeNo)));
      /*  if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");merchant/merchangroup/insert
        }*/
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //가맹점카테고리(상품그룹 조회)
    @ResponseBody
    @PostMapping("/search/merchandise/searchStoreCategory")
    public ResponseEntity<?> tbStoreCategorySearch(@RequestBody Map<String,Object> searchValue) {
        log.info("TbStore searchValue::{}", searchValue);
        Map<String,Object> map = new HashMap<>();
        map.put("storeCategory",apiService.tbStoreCategorySearch(searchValue));
      /*  if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }*/
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //가맹점상품매핑(매핑 추가)
    @ResponseBody
    @PostMapping("/merchandise/addStoreCategoryGoods")
    public ResponseEntity<?> addStoreCategoryGoods(@RequestParam("storeCatNo") String storeCatNo,
                                                   @RequestParam("storeGoodsNo") String storeGoodsNo) {
        log.info("storeCatNo::{}", storeCatNo);
        Map<String,Object> map = new HashMap<>();


        try {
            int result = apiService.addStoreCategoryGoods(Long.parseLong(storeCatNo), Long.parseLong(storeGoodsNo));
            map.put("result", result);
            if(result > 0) {
                map.put("result","200");
                map.put("message", "등록 되었습니다.");
            } else {
                map.put("result","400");
                map.put("message", "등록에 실패하였습니다.");
            }
        } catch (DataIntegrityViolationException e) {
            log.info("history already exist");
            map.put("result","500");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //가맹점상품매핑(매핑 삭제)
    @ResponseBody
    @PostMapping("/merchandise/deleteStoreCategoryGoods")
    public ResponseEntity<?> deleteStoreCategoryGoods(@RequestParam("storeCatNo") String storeCatNo,
                                                   @RequestParam("storeGoodsNo") String storeGoodsNo) {
        log.info("storeCatNo::{}", storeCatNo);
        Map<String,Object> map = new HashMap<>();
        int result = apiService.deleteStoreCategoryGoods(Long.parseLong(storeCatNo), Long.parseLong(storeGoodsNo));
        map.put("result", result);
        if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //가맹점 옵션 리스트
    @ResponseBody
    @PostMapping("search/merchandise/searchStoreOption")
    public ResponseEntity<?> searchStoreOption(@RequestBody Map<String,Object> searchValue) {
        log.info("searchValue::{}", searchValue.get("storeNo"));
        Map<String,Object> map = new HashMap<>();
        List<TbStoreOptionSubDTO> searchStoreOption = apiService.searchStoreOption(searchValue);
        map.put("storeCategoryList",  searchStoreOption);
        return new ResponseEntity<>(map,HttpStatus.OK);
    }


    //가맹점 옵션 매핑된 리스트
    @ResponseBody
    @PostMapping("search/merchandise/searchStoreGoodsOption")
    public ResponseEntity<?> searchStoreGoodsOption(@RequestBody Map<String,Object> searchValue) {
        log.info("searchValue::{}", searchValue);
        Map<String,Object> map = new HashMap<>();
        List<TbStoreOptionSubDTO> storeGoodsOptionList = apiService.searchStoreGoodsOption(searchValue);
        map.put("storeGoodsOptionList",  storeGoodsOptionList);
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //가맹점 검색 기능
    @GetMapping("get/storeTxt")
    public ResponseEntity<?> storeTxt(@RequestParam("storeName") String storeName) {
        log.info("storeName::{}", storeName);
        Map<String,Object> map = new HashMap<>();
        List<TbStoreDTO> storeTxtList = apiService.storeTxt(storeName);

        map.put("storeTxtList",  storeTxtList);
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //가맹점 검색 기능
    @GetMapping("get/branchTxt")
    public ResponseEntity<?> branchTxt(@RequestParam("branchName") String branchName) {
        log.info("storeName::{}", branchName);
        Map<String,Object> map = new HashMap<>();
        List<TbStoreDTO> branchTxtList = apiService.getBranchTxt(branchName);

        map.put("branchTxtList",  branchTxtList);
        return new ResponseEntity<>(map,HttpStatus.OK);
    }


    //가맹점옵션매핑(옵션 추가)
    @ResponseBody
    @PostMapping("/merchandise/addStoreGoodsOption")
    public ResponseEntity<?> addStoreGoodsOption(@RequestParam("storeOptNo") String storeOptNo,
                                                   @RequestParam("storeGoodsNo") String storeGoodsNo) {
        log.info("storeCatNo::{}", storeOptNo);
        Map<String,Object> map = new HashMap<>();
        try {
            int result = apiService.addStoreGoodsOption(Long.parseLong(storeOptNo), Long.parseLong(storeGoodsNo));
            map.put("result", result);
            if(result > 0) {
                map.put("result","200");
                map.put("message", "등록 되었습니다.");
            } else {
                map.put("result","400");
                map.put("message", "등록에 실패하였습니다.");
            }
        } catch (DataIntegrityViolationException e) {
            log.info("history already exist");
            map.put("result","500");
            map.put("message", "등록에 실패하였습니다.");
        }


        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //가맹점옵션매핑(옵션 삭제)
    @ResponseBody
    @PostMapping("/merchandise/delStoreGoodsOption")
    public ResponseEntity<?> deleteStoreGoodsOption(@RequestParam("storeOptNo") String storeOptNo,
                                                      @RequestParam("storeGoodsNo") String storeGoodsNo) {
        log.info("storeCatNo::{}", storeOptNo);
        Map<String,Object> map = new HashMap<>();
        int result = apiService.deleteStoreGoodsOption(Long.parseLong(storeOptNo), Long.parseLong(storeGoodsNo));
        map.put("result", result);
        if(result > 0) {
            map.put("result","200");
            map.put("message", "삭제 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "삭제에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //SystemCode
    @ResponseBody
    @PostMapping("/system/code/list")
    public ResponseEntity<?> systemCodeList(@RequestParam("sysType") String sysType) {
        log.info("TbSystemCode systemType::{}", sysType);
        Map<String,Object> map = new HashMap<>();
        map.put("systemCodeList",apiService.systemCodeList(sysType));
      /*  if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }*/
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //드라이버 insert
    @ResponseBody
    @PostMapping(value="/deliveryman/insert/action" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> deliverymanInsertAction(
            @RequestPart(value="tbUserWorkerData" ,required = true) TbUserWorkerData tbUserWorkerData
            ,@RequestPart(value="imgFile" ,required = false) MultipartFile imgFile,
            HttpSession session, HttpServletRequest request
    ) {
        log.info("TbUserWorker storeNo::{}", tbUserWorkerData.getStoreNo());
        /*log.info("TbUser tbUserWorker::{}", tbUserWorker);*/
        TbUserWorker tbUserWorker = null;
        int result = 0;
        try {

            if("".equals(tbUserWorkerData.getUserId())){
                tbUserWorkerData.setUserId(null);
            }
            if("".equals(tbUserWorkerData.getRegistNum())){
                tbUserWorkerData.setRegistNum(null);
            }
            if("".equals(tbUserWorkerData.getMemo())){
                tbUserWorkerData.setMemo(null);
            }
            if("".equals(tbUserWorkerData.getBankTypeCode())){
                tbUserWorkerData.setBankTypeCode(null);
            }
            if("".equals(tbUserWorkerData.getAddr())){
                tbUserWorkerData.setAddr(null);
            }
            if("".equals(tbUserWorkerData.getRetireDate())){
                tbUserWorkerData.setRetireDate(null);
            }
            if("".equals(tbUserWorkerData.getBankAccount())){
                tbUserWorkerData.setBankAccount(null);
            }
            tbUserWorker =  apiService.insertTbUserWork(tbUserWorkerData, imgFile, session);
            if (tbUserWorker != null) {
                if(tbUserWorker.getUserNo() != null){
                    ResponseEntity<Map> tokenMap = restTemplateUtil.driverStatusInit(tbUserWorker.getUserNo(), session);
                    Map<String, Object> codeMap2 = (Map) tokenMap.getBody();//아이디가 있으면 update
                    if ("OK".equals(codeMap2.get("serviceStatus"))) {
                        log.info("driverStatusOk:::" + tbUserWorkerData.getUserNo());
                        result = 1;
                    } else {
                        log.info("driverStatusError");
                    }
                }
            }
        } catch (DataIntegrityViolationException e) {
            result = 500;
        } catch (Exception e){
            e.printStackTrace();
        }

        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        String ip = GetClientIp.getClientIP(request);


        Map<String,Object> map = new HashMap<>();
        if(result ==  1 ) {
            log.info("Update_role :adminId = {} / userId =  {} / ip = {} / type = {}" ,loginSession.getUserLoginId(), tbUserWorkerData.getUserId() , ip , "save");
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else if (result == 500){
            map.put("result","500");
            map.put("message", "중복에러");
        } else  {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //사용자 insert
    @ResponseBody
    @PostMapping(value="/userStaff/insert/action" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> userStaffInsertAction(
            HttpServletRequest request,
            HttpSession session,
            @RequestPart(value="tbUserStaffData" ,required = true) TbUserStaffData tbUserStaffData
    ) {
        log.info("TbUserStaffData headNo::{}", tbUserStaffData.getHeadNo());
        /*log.info("TbUser tbUserWorker::{}", tbUserWorker);*/
        int result = 0;

        try {
            result =  apiService.insertTbUserStaff(tbUserStaffData);
        }   catch (DataIntegrityViolationException e) {
            result = 500;
        } catch (Exception e){
            e.printStackTrace();
        }
        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        String ip = GetClientIp.getClientIP(request);

        Map<String,Object> map = new HashMap<>();
        if(result == 1 ) {
            log.info("Update_role :adminId = {} / userId =  {} / ip = {} / type = {}" ,loginSession.getUserLoginId(), tbUserStaffData.getUserId() , ip , "save");
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else if(result == 500){
            map.put("result","500");
            map.put("message", "중복에러");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }
    //사용자 update
    @ResponseBody
    @PostMapping(value="/userStaff/update/action" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> userStaffUpdateAction(
            HttpSession session,
            HttpServletRequest request,
            @RequestPart(value="tbUserStaffData" ,required = true) TbUserStaffData tbUserStaffData
    ) {
        log.info("TbUserStaffData headNo::{}", tbUserStaffData.getHeadNo());
        log.info("tbUserStaffData ::{}", tbUserStaffData);
        /*log.info("TbUser tbUserWorker::{}", tbUserWorker);*/

        if(tbUserStaffData.getDataStatus().ordinal() == 1){
            tbUserStaffData.setBlockTypeCode(null);
        }
        int result =  apiService.updateTbUserStaff(tbUserStaffData);

        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        String ip = GetClientIp.getClientIP(request);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            log.info("Update_role :adminId = {} / userId =  {} / ip = {} / type = {}" , loginSession.getUserLoginId(), tbUserStaffData.getUserId() , ip , "update");
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //사용자 update 기존패스워드 검사 -값이 매번 바뀜 사용x
    @ResponseBody
    @PostMapping(value="/userStaff/oldpass/confirm" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> userStaffoldpassConfirm(
            HttpSession session,
            HttpServletRequest request,
            @RequestPart(value="tbUserStaffData" ,required = true) TbUserStaffData tbUserStaffData
    ) {
        log.info("TbUserStaffData headNo::{}", tbUserStaffData.getHeadNo());
        int result =  apiService.confirmOldPass(tbUserStaffData);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }


    //드라이버 update
    @ResponseBody
    @PostMapping(value="/deliveryman/update/action" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> deliverymanUpdateAction(
            @RequestPart(value="tbUserWorkerData" ,required = true) TbUserWorkerData tbUserWorkerData,
            @RequestPart(value="tbWorkerChargeData" ,required = true) TbWorkerChargeData tbWorkerChargeData
            ,@RequestPart(value="imgFile" ,required = false) MultipartFile imgFile
            ,HttpSession session
    ) {
        log.info("TbUserWorker headNo::{}", tbUserWorkerData.getHeadNo());
        /*log.info("TbUser tbUserWorker::{}", tbUserWorker);*/

        if("".equals(tbUserWorkerData.getUserId())){
            tbUserWorkerData.setUserId(null);
        }
        if("".equals(tbUserWorkerData.getRegistNum())){
            tbUserWorkerData.setRegistNum(null);
        }
        if("".equals(tbUserWorkerData.getMemo())){
            tbUserWorkerData.setMemo(null);
        }
        if("".equals(tbUserWorkerData.getBankTypeCode())){
            tbUserWorkerData.setBankTypeCode(null);
        }
        if("".equals(tbUserWorkerData.getAddr())){
            tbUserWorkerData.setAddr(null);
        }
        if("".equals(tbUserWorkerData.getRetireDate())){
            tbUserWorkerData.setRetireDate(null);
        }
        if("".equals(tbUserWorkerData.getBankAccount())){
            tbUserWorkerData.setBankAccount(null);
        }
        int result = 0;
        try {
            result =  apiService.updateTbUser(tbUserWorkerData,tbWorkerChargeData, imgFile, session);
        } catch (Exception e){
            log.error("error :"+e.getMessage());
        }


        if(result == 1){
            ResponseEntity<Map> tokenMap = restTemplateUtil.driverStatusInit(tbUserWorkerData.getUserNo(), session);
            Map<String,Object> codeMap2 = (Map)tokenMap.getBody();//아이디가 있으면 update
            if("OK".equals(codeMap2.get("serviceStatus"))){
                log.info("driverStatusOk:::"+tbUserWorkerData.getUserNo());
                result = 1;
            } else {
                log.info("driverStatusError");
            }
        }

        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "수정 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "수정에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //배송그룹 insert
    @ResponseBody
    @PostMapping(value="/deliverygrp/insert/action" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> deliverygrpInsertAction(
            @RequestPart(value="tbDelivery" ,required = true) TbDeliveryData tbDeliveryData
    ) {
        log.info("TbDelivery headNo::{}", tbDeliveryData.getHeadNo());
        /*log.info("TbUser tbUserWorker::{}", tbUserWorker);*/
        int result =  apiService.insertTbDelivery(tbDeliveryData);
        Map<String,Object> map = new HashMap<>();
        if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //배송그룹 update
    @ResponseBody
    @PostMapping(value="/deliverygrp/update/action" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> deliverygrpUpdateAction(
            @RequestPart(value="tbDelivery" ,required = true) TbDeliveryData tbDeliveryData
    ) {
        log.info("TbDelivery dlvyNo::{}", tbDeliveryData.getDlvyNo());
        /*log.info("TbUser tbUserWorker::{}", tbUserWorker);*/
        int result =  apiService.updateTbDelivery(tbDeliveryData);
        Map<String,Object> map = new HashMap<>();
        if(result > 0) {
            map.put("result","200");
            map.put("message", "수정 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "수정에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //가맹점 검색 기능
    @GetMapping("/delivery/findByBranchNo")
    public ResponseEntity<?> findByBranchNo(@RequestParam("branchNo") Integer branchNo,
                                            @RequestParam("dlvyGroupType") String dlvyGroupType) {
        log.info("branchNo::{}", branchNo);
        Map<String,Object> map = new HashMap<>();
        List<TbDlvyDTO> deliveryList = apiService.deliveryList(branchNo, dlvyGroupType);

        map.put("deliveryList",  deliveryList);
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //공유 그룹 검색
    @GetMapping("/deliveryshare/deliveryShareList")
    public ResponseEntity<?> deliveryshareList(@RequestParam("dlvyNo") Long dlvyNo) {
        log.info("dlvyNo::{}", dlvyNo);
        Map<String,Object> map = new HashMap<>();
        List<TbDlvyShareDTO> deliveryShareList = apiService.deliveryShareList(dlvyNo);

        map.put("deliveryShareList",  deliveryShareList);
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //공유 그룹 검색(추가)
    @GetMapping("/deliveryshare/addList")
    public ResponseEntity<?> deliveryshareAddList(@RequestParam("dlvyNo") Long dlvyNo,
                                                  @RequestParam("addList") List addList
    ) {
        log.info("dlvyNo::{}", dlvyNo);
        log.info("addList::{}", addList);
        Map<String,Object> map = new HashMap<>();
        int result = apiService.deliveryshareAddList(dlvyNo, addList);

        if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //공유 그룹 검색(삭제)
    @GetMapping("/deliveryshare/delList")
    public ResponseEntity<?> deliveryshareDelList(@RequestParam("dlvyNo") Long dlvyNo,
                                                  @RequestParam("delList") List delList
    ) {
        log.info("dlvyNo::{}", dlvyNo);
        log.info("addList::{}", delList);
        Map<String,Object> map = new HashMap<>();
        int result = apiService.deliveryshareDelList(dlvyNo, delList);

        if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //공유지연시간세팅
    @GetMapping("/deliveryshare/delayTimeSet")
    public ResponseEntity<?> delayTimeSet(@RequestParam("giveDlvyNo") Long giveDlvyNo,
                                              @RequestParam("acceptDlvyNo") Long acceptDlvyNo,
                                              @RequestParam("delayTime") Integer delayTime
    ) {
        log.info("giveDlvyNo::{}", giveDlvyNo);
        log.info("acceptDlvyNo::{}", acceptDlvyNo);
        log.info("delayTime::{}", delayTime);
        Map<String,Object> map = new HashMap<>();
        int result = apiService.delayTimeSet(giveDlvyNo, acceptDlvyNo, delayTime);

        if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //배송블럭요금제 등록
   @ResponseBody
    @PostMapping(value="/deliveryblock/insert/action" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> deliveryblockInsertAction(
            @RequestPart(value="tbDlvyAreaCharge" ,required = true) TbDlvyAreaChargeData tbDlvyAreaChargeData
    ) {
        log.info("TbDlvyAreaChargeData tbDlvyAreaChargeData::{}", tbDlvyAreaChargeData);
        /*log.info("TbUser tbUserWorker::{}", tbUserWorker);*/
        int result =  apiService.insertTbDlvyAreaCharge(tbDlvyAreaChargeData);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //배송블럭 등록
    @ResponseBody
    @PostMapping(value="/deliveryblock/block/insert" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> deliveryblockAdd(
            @RequestPart(value="tbDlvyArea" ,required = true) TbDlvyArea tbDlvyArea,
            @RequestPart(value="tbDlvyAreaList" ,required = true) List tbDlvyAreaList
    ) {
        log.info("TbDlvyArea tbDlvyArea::{}", tbDlvyArea);
        log.info("TbDlvyAreaList tbDlvyAreaList::{}", tbDlvyAreaList);

        int result =  apiService.insertTbDlvyArea(tbDlvyArea, tbDlvyAreaList);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }


    //블록 등록 리스트
    @ResponseBody
    @PostMapping("/deliveryblock/dlvyArea/list")
    public ResponseEntity<?> deliveryblockAreaList(@RequestParam("areaChargeNo") String areaChargeNo) {
        log.info("areaChargeNo::{}", areaChargeNo);
        Map<String,Object> map = new HashMap<>();
        List<TbDlvyArea> tbDlvyAreaList = apiService.tbDlvyAreaList(Long.parseLong(areaChargeNo));

        map.put("tbDlvyAreaList",  tbDlvyAreaList);
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //블록 등록 좌표 리스트
    @ResponseBody
    @PostMapping("/deliveryblock/dlvyAreaGeo/list")
    public ResponseEntity<?> deliveryblockAreaGeoList(@RequestParam("areaChargeNo") String areaChargeNo) {
        log.info("areaChargeNo::{}", areaChargeNo);
        Map<String,Object> map = new HashMap<>();
        List tbDlvyAreaGeoList = apiService.tbDlvyAreaGeoList(Long.parseLong(areaChargeNo));

        map.put("tbDlvyAreaGeoList",  tbDlvyAreaGeoList);
        return new ResponseEntity<>(map,HttpStatus.OK);
    }


    //배송블럭 등록
    @ResponseBody
    @PostMapping(value="/deliveryblock/dlvyArea/resort" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> deliveryBlockSort(
            @RequestPart(value="sortList" ,required = true) List sortList
    ) {
        log.info("List sortList::{}", sortList);

        int result =  apiService.deliveryBlockSort(sortList);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //시스템 상품 상세 update
    @ResponseBody
    @PostMapping("/systemgoods/detail/update")
    public ResponseEntity<?> systemGoodsUpdate(@RequestPart TbSystemGoodsData tbSystemGoodsData
            ,@RequestPart(value="imgFile1" ,required = false) MultipartFile imgFile1
            ,@RequestPart(value="imgFile2" ,required = false) MultipartFile imgFile2
            ,@RequestPart(value="imgFileSmall" ,required = false) MultipartFile imgFileSmall
            ) {
        log.info("tbSystemGoodsData::{}", tbSystemGoodsData);
        log.info("imgFile1::{}", imgFile1);
        log.info("imgFile2::{}", imgFile2);
        log.info("imgFileSmall::{}", imgFile2);
        int result =  apiService.updateTbSystemGoods(tbSystemGoodsData, imgFile1, imgFile2, imgFileSmall);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //시스템 상품 상세 insert
    @ResponseBody
    @PostMapping("/systemgoods/detail/insert")
    public ResponseEntity<?> systemGoodsInsert(@RequestPart TbSystemGoodsData tbSystemGoodsData
            ,@RequestPart(value="imgFile1" ,required = false) MultipartFile imgFile1
            ,@RequestPart(value="imgFile2" ,required = false) MultipartFile imgFile2
            ,@RequestPart(value="imgFileSmall" ,required = false) MultipartFile imgFileSmall
    ) {
        log.info("tbSystemGoodsData::{}", tbSystemGoodsData);
        log.info("imgFile1::{}", imgFile1);
        log.info("imgFile2::{}", imgFile2);
        log.info("imgFileSmall::{}", imgFileSmall);
        int result =  apiService.insertTbSystemGoods(tbSystemGoodsData, imgFile1, imgFile2, imgFileSmall);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }



    //배송거리요금 등록
    @ResponseBody
    @PostMapping(value="/deliverystreet/insert/action" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> deliverystreetAdd(
            @RequestPart(value="tbDlvyPriceCharge" ,required = true) TbDlvyPriceChargeData tbDlvyPriceChargeData
    ) {
        log.info("TbDlvyPriceChargeData tbDlvyPriceChargeData::{}", tbDlvyPriceChargeData);

        int result =  apiService.insertTbDlvyPriceCharge(tbDlvyPriceChargeData);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //블록 등록 리스트
    @ResponseBody
    @PostMapping("/deliverystreet/dlvyPrice/list")
    public ResponseEntity<?> deliveryPriceList(@RequestParam("groupNo") String groupNo) {
        log.info("groupNo::{}", groupNo);
        Map<String,Object> map = new HashMap<>();
        List<TbDlvyPrice> tbDlvyPriceList = apiService.tbDlvyPriceList(Long.parseLong(groupNo));

        map.put("tbDlvyPriceList",  tbDlvyPriceList);
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //배송블럭요금제 등록
    @ResponseBody
    @PostMapping(value="/deliverystreet/price/insert" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> deliverystreetInsertAction(
            @RequestPart(value="tbDlvyPrice" ,required = true) TbDlvyPrice tbDlvyPrice
    ) {
        log.info("TbDlvyPrice tbDlvyPrice::{}", tbDlvyPrice);
        /*log.info("TbUser tbUserWorker::{}", tbUserWorker);*/
        int result =  apiService.insertTbDlvyPrice(tbDlvyPrice);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //배송블럭요금제 수정
    @ResponseBody
    @PostMapping(value="/deliverystreet/price/update" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> deliverystreetUpdateAction(
            @RequestPart(value="tbDlvyPrice" ,required = true) TbDlvyPrice tbDlvyPrice
    ) {
        log.info("TbDlvyPrice tbDlvyPrice::{}", tbDlvyPrice);
        /*log.info("TbUser tbUserWorker::{}", tbUserWorker);*/
        int result =  apiService.updateTbDlvyPrice(tbDlvyPrice);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }




    @ResponseBody
    @PostMapping(value="/storemngcharge/update/action" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> storemngchargeUpdateAction(
            @RequestPart(value="tbStoreMngChargeData" ,required = true) TbStoreMngChargeData tbStoreMngChargeData,
            @RequestPart(value="tbStoreServiceChargeData0" ,required = true) TbStoreServiceChargeData tbStoreServiceChargeDat0,
            @RequestPart(value="tbStoreServiceChargeData1" ,required = true) TbStoreServiceChargeData tbStoreServiceChargeData1
    ) {
        log.info("tbStoreMngChargeData::{}", tbStoreMngChargeData);
        log.info("tbStoreServiceChargeData0::{}", tbStoreServiceChargeDat0);
        log.info("tbStoreServiceChargeData1::{}", tbStoreServiceChargeData1);
        /*log.info("TbUser tbUserWorker::{}", tbUserWorker);*/
        int result = 0;
        int result1 = 0;
        int result2 = 0;
        try {
            result = apiService.updateStoreMngCharge(tbStoreMngChargeData);
            result1 = apiService.updateStoreServiceCharge(tbStoreServiceChargeDat0);
            result2 = apiService.updateStoreServiceCharge(tbStoreServiceChargeData1);
        } catch (Exception e) {
            e.printStackTrace();
        }

        Map<String,Object> map = new HashMap<>();
        if(result + result1 + result2  >= 3 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }
    @ResponseBody
    @PostMapping(value="/storedlvycharge/update/action" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> storedlvychargeUpdateAction(
            @RequestPart(value="tbStoreDlvyChargeData" ,required = true) TbStoreDlvyChargeData tbStoreDlvyChargeData
    ) {
        log.info("tbStoreDlvyChargeData::{}", tbStoreDlvyChargeData);
        /*log.info("TbUser tbUserWorker::{}", tbUserWorker);*/
        int result =  apiService.updateStoreDlvyCharge(tbStoreDlvyChargeData);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }


    //공유 그룹 검색
    @GetMapping("/userStaff/list")
    public ResponseEntity<?> userStaffList(@RequestParam("headNo") Integer headNo,
                                           @RequestParam("branchNo") Integer branchNo,
                                           @RequestParam("storeNo") Integer storeNo,
                                           @RequestParam("userType") Integer userType
    ) {
        log.info("headNo::{}", headNo);
        log.info("branchNo::{}", branchNo);
        log.info("storeNo::{}", storeNo);
        log.info("userType::{}", userType);
        Map<String,Object> map = new HashMap<>();
        List<TbUserStaffDTO> userStaffList = apiService.getUserStaffList(headNo, branchNo, storeNo ,userType);

        map.put("userStaffList",  userStaffList);
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //플랫폼 공지 등록
    @ResponseBody
    @PostMapping(value="/board/platform/insert" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> tbNoticePlatformInsertAction(
            @RequestPart(value="tbNoticePlatform" ,required = true) TbNoticePlatform tbNoticePlatform
    ) {
        log.info("TbNoticePlatform tbNoticePlatform::{}", tbNoticePlatform);
        int result =  apiService.insertTbNoticePlatform(tbNoticePlatform);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //플랫폼 공지 수정
    @ResponseBody
    @PostMapping(value="/board/platform/update" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> tbNoticePlatformUpdateAction(
            @RequestPart(value="tbNoticePlatform" ,required = true) TbNoticePlatform tbNoticePlatform
    ) {
        log.info("TbNoticePlatform tbNoticePlatform::{}", tbNoticePlatform);
        int result =  apiService.updateTbNoticePlatform(tbNoticePlatform);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //제휴사 공지 등록
    @ResponseBody
    @PostMapping(value="/board/company/insert" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> tbNoticeCompanyInsertAction(
            @RequestPart(value="tbNoticeCompany" ,required = true) TbNoticeCompany tbNoticeCompany
    ) {
        log.info("TbNoticeCompany tbNoticeCompany::{}", tbNoticeCompany);
        int result =  apiService.insertTbNoticeCompany(tbNoticeCompany);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //제휴사 공지 수정
    @ResponseBody
    @PostMapping(value="/board/company/update" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> tbNoticeCompanyUpdateAction(
            @RequestPart(value="tbNoticeCompany" ,required = true) TbNoticeCompany tbNoticeCompany
    ) {
        log.info("TbNoticeCompany tbNoticeCompany::{}", tbNoticeCompany);
        int result =  apiService.updateTbNoticeCompany(tbNoticeCompany);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //배송원 공지 등록
    @ResponseBody
    @PostMapping(value="/board/worker/insert" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> tbNoticeWorkerInsertAction(
            @RequestPart(value="tbNoticeWorker" ,required = true) TbNoticeWorker tbNoticeWorker
    ) {
        log.info("TbNoticeWorker tbNoticeWorker::{}", tbNoticeWorker);
        int result =  apiService.insertTbNoticeWorker(tbNoticeWorker);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //배송원 공지 수정
    @ResponseBody
    @PostMapping(value="/board/worker/update" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> tbNoticeWorkerUpdateAction(
            @RequestPart(value="tbNoticeWorker" ,required = true) TbNoticeWorker tbNoticeWorker
    ) {
        log.info("TbNoticeWorker tbNoticeCompany::{}", tbNoticeWorker);
        int result =  apiService.updateTbNoticeWorker(tbNoticeWorker);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //이벤트 페이지 insert
    @ResponseBody
    @PostMapping("/board/event/insert")
    public ResponseEntity<?> eventInsert(@RequestPart TbEvent tbEvent
            ,@RequestPart(value="imgFileSmall" ,required = false) MultipartFile imgFileSmall
    ) {
        log.info("tbEvent::{}", tbEvent);
        log.info("imgFileSmall::{}", imgFileSmall);
        int result =  apiService.insertEvent(tbEvent, imgFileSmall);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }


    //이벤트 페이지 update
    @ResponseBody
    @PostMapping("/board/event/update")
    public ResponseEntity<?> eventUpdate(@RequestPart TbEvent tbEvent
            ,@RequestPart(value="imgFileSmallFile" ,required = false) MultipartFile imgFileSmallFile
    ) {
        log.info("tbEvent::{}", tbEvent);
        log.info("imgFileSmallFile::{}", imgFileSmallFile);
        int result =  apiService.updateEvent(tbEvent, imgFileSmallFile);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "수정 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "수정에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //릴리즈내역 공지 등록
    @ResponseBody
    @PostMapping(value="/board/release/insert" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> tbNoticeReleseInsertAction(
            @RequestPart(value="tbNoticeRelease" ,required = true) TbNoticeRelease tbNoticeRelease
    ) {
        log.info("TbNoticePlatform tbNoticeRelease::{}", tbNoticeRelease);
        int result =  apiService.insertTbNoticeRelease(tbNoticeRelease);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //릴리즈내역 공지 수정
    @ResponseBody
    @PostMapping(value="/board/release/update" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> tbNoticeReleseUpdateAction(
            @RequestPart(value="tbNoticeRelease" ,required = true) TbNoticeRelease tbNoticeRelease
    ) {
        log.info("TbNoticePlatform tbNoticeRelease::{}", tbNoticeRelease);
        int result =  apiService.updateTbNoticeRelease(tbNoticeRelease);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }
    //플랫폼 공지삭제
    @ResponseBody
    @PostMapping("/board/release/delete")
    public ResponseEntity<?> noticeReleaseDelete(@RequestParam("noticeNo") Long noticeNo
    ) {
        log.info("noticeNo::{}", noticeNo);

        int result =  apiService.noticeReleaseDelete(noticeNo);
        Map<String,Object> map = new HashMap<>();
        if(result > 0) {
            map.put("result","200");
            map.put("message", "삭제 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "삭제에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //플랫폼 공지삭제
    @ResponseBody
    @PostMapping("/board/platform/delete")
    public ResponseEntity<?> noticePlatFormDelete(@RequestParam("noticeNo") Long noticeNo
    ) {
        log.info("noticeNo::{}", noticeNo);

        int result =  apiService.noticePlatFormDelete(noticeNo);
        Map<String,Object> map = new HashMap<>();
        if(result > 0) {
            map.put("result","200");
            map.put("message", "삭제 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "삭제에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //제휴사 공지삭제
    @ResponseBody
    @PostMapping("/board/company/delete")
    public ResponseEntity<?> noticeCompanyDelete(@RequestParam("noticeNo") Long noticeNo
    ) {
        log.info("noticeNo::{}", noticeNo);

        int result =  apiService.noticeCompanyDelete(noticeNo);
        Map<String,Object> map = new HashMap<>();
        if(result > 0) {
            map.put("result","200");
            map.put("message", "삭제 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "삭제에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }
    //배송원 공지삭제
    @ResponseBody
    @PostMapping("/board/worker/delete")
    public ResponseEntity<?> noticeWorkerDelete(@RequestParam("noticeNo") Long noticeNo
    ) {
        log.info("noticeNo::{}", noticeNo);

        int result =  apiService.noticeWorkerDelete(noticeNo);
        Map<String,Object> map = new HashMap<>();
        if(result > 0) {
            map.put("result","200");
            map.put("message", "삭제 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "삭제에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //주문플랫폼정산 그룹 insert
    @ResponseBody
    @PostMapping("/settlement/servicechargegrp/insert")
    public ResponseEntity<?> servicechargegrpInsert(@RequestPart TbServiceChargeGroupData tbServiceChargeGroupData
    ) {
        log.info("TbServiceChargeGroupData::{}", tbServiceChargeGroupData);
        int result =  apiService.insertServiceChargeGrp(tbServiceChargeGroupData);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //주문플랫폼정산 그룹이름 update
    @ResponseBody
    @PostMapping("/settlement/servicechargegrp/groupName/update")
    public ResponseEntity<?> servicechargegrpNameInsert(@RequestParam("chargeName") String chargeName,
                                                        @RequestParam("chargeNo") Long chargeNo
    ) {
        log.info("chargeName::{}", chargeName);
        log.info("chargeNo::{}", chargeNo);
        int result =  apiService.updateServiceChargeGrpName(chargeName, chargeNo);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }


    //주문플랫폼정산 그룹 update
    @ResponseBody
    @PostMapping("/settlement/servicechargegrp/update")
    public ResponseEntity<?> servicechargegrpInsert(@RequestParam(value="tbServiceChargeDataList") String tbServiceChargeDataList
    ) {
        log.info("tbServiceChargeGroupDataList::{}", tbServiceChargeDataList);

        int result = 0;
        Map<String,Object> map = new HashMap<>();
        try {

            String jsonData = tbServiceChargeDataList.replaceAll("&quot;", "\"");


            JSONParser parser = new JSONParser();
            Object obj = parser.parse(jsonData);
            JSONArray jsonArray = (JSONArray)obj;


            List<TbServiceChargeData> tbServiceChargeDataList1 = new ArrayList<TbServiceChargeData>();
            for(int i=0;i<jsonArray.size();i++){

                TbServiceChargeData tbServiceChargeData = new TbServiceChargeData();
                JSONObject jsonObj = (JSONObject) jsonArray.get(i);

                tbServiceChargeData.setChargeNo(Long.parseLong(jsonObj.get("chargeNo").toString()));
                tbServiceChargeData.setPlatformType(Integer.parseInt(jsonObj.get("platformType").toString()));
                tbServiceChargeData.setServiceType(Integer.parseInt(jsonObj.get("serviceType").toString()));
                tbServiceChargeData.setSvcRate0(Integer.parseInt(jsonObj.get("svcRate0").toString()));
                tbServiceChargeData.setSvcRate1(Integer.parseInt(jsonObj.get("svcRate1").toString()));
                tbServiceChargeData.setSvcRate2(Integer.parseInt(jsonObj.get("svcRate2").toString()));
                tbServiceChargeData.setSvcRate3(Integer.parseInt(jsonObj.get("svcRate3").toString()));
                tbServiceChargeData.setHeadNo1(Integer.parseInt(jsonObj.get("headNo1").toString()));
                tbServiceChargeData.setHeadNo2(Integer.parseInt(jsonObj.get("headNo2").toString()));
                tbServiceChargeData.setHeadNo3(Integer.parseInt(jsonObj.get("headNo3").toString()));
                tbServiceChargeData.setBranchNo1(Integer.parseInt(jsonObj.get("branchNo1").toString()));
                tbServiceChargeData.setBranchNo2(Integer.parseInt(jsonObj.get("branchNo2").toString()));
                tbServiceChargeData.setBranchNo3(Integer.parseInt(jsonObj.get("branchNo3").toString()));
                tbServiceChargeDataList1.add(tbServiceChargeData);
            }
            System.out.println(tbServiceChargeDataList1);
            result =  apiService.updateServiceChargeGrp(tbServiceChargeDataList1);

            if(result > 0 ) {
                map.put("result","200");
                map.put("message", "등록 되었습니다.");
            } else {
                map.put("result","400");
                map.put("message", "등록에 실패하였습니다.");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //제휴본사 조회
    @ResponseBody
    @PostMapping("/search/systemCate/list")
    public ResponseEntity<?> searchCateCodeList(@RequestBody Map<String,Object> searchValue) {
        log.info("TbSystemCategory ::{}", searchValue);
        Map<String,Object> map = new HashMap<>();
        map.put("searchCateList",apiService.searchCateCodeList(searchValue));
      /*  if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }*/
        return new ResponseEntity<>(map,HttpStatus.OK);
    }
   /* //기본옵션등록
    @ResponseBody
    @PostMapping("/storeGoodsItem/insert")
    public ResponseEntity<?> insertStoreGoodsitem(@RequestParam("storeGoodsNo") String storeGoodsNo,
                                              @RequestParam("viewOrder") String viewOrder,
                                              @RequestParam("itemStatus") Integer itemStatus,
                                              @RequestParam("itemName") String itemName,
                                              @RequestParam("itemPrice") Integer itemPrice
    ) {
        log.info("storeGoodsNo ::{}", storeGoodsNo);

        int result =  apiService.insertStoreGoodsitem(Long.parseLong(storeGoodsNo), viewOrder, itemStatus, itemName, itemPrice);
        Map<String,Object> map = new HashMap<>();
        if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //기본옵션수정
    @ResponseBody
    @PostMapping("/storeGoodsItem/update")
    public ResponseEntity<?> updateStoreGoodsitem(@RequestParam("storeGoodsNo") String storeGoodsNo,
                                                  @RequestParam("basicItemNo") Integer basicItemNo,
                                                  @RequestParam("viewOrder") String viewOrder,
                                                  @RequestParam("itemStatus") Integer itemStatus,
                                                  @RequestParam("itemName") String itemName,
                                                  @RequestParam("itemPrice") Integer itemPrice
    ) {
        log.info("storeGoodsNo ::{}", storeGoodsNo);

        int result =  apiService.updateStoreGoodsitem(Long.parseLong(storeGoodsNo), basicItemNo, viewOrder, itemStatus, itemName, itemPrice);
        Map<String,Object> map = new HashMap<>();
        if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //기본옵션삭제
    @ResponseBody
    @PostMapping("/storeGoodsItem/delete")
    public ResponseEntity<?> deleteStoreGoodsitem(@RequestParam("storeGoodsNo") String storeGoodsNo,
                                                  @RequestParam("basicItemNo") Integer basicItemNo
    ) {
        log.info("storeGoodsNo ::{}", storeGoodsNo);
        int result =  apiService.deleteStoreGoodsitem(Long.parseLong(storeGoodsNo), basicItemNo);
        Map<String,Object> map = new HashMap<>();
        if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }*/


    //기사가입신청내역
    @ResponseBody
    @PostMapping("/driver/attach/list")
    public ResponseEntity<?> attachList(@RequestParam("applyNo") String applyNo) {
        log.info("applyNo::{}", applyNo);
        Map<String,Object> map = new HashMap<>();
        List<TbWorkerApplyAttachDTO> tbWorkerApplyAttchList = apiService.tbWorkerApplyAttchList(Integer.parseInt(applyNo));
     /*   List<TbWorkerApplyAttachDTO> tbWorkerApplyListNew = new ArrayList<TbWorkerApplyAttachDTO>();
        for (TbWorkerApplyAttachDTO tbWorkerApplyAttachDTO : tbWorkerApplyAttchList) {
            String authTime = "";
            String insertTime = "";
            tbWorkerApplyAttachDTO(tbWorkerApplyAttachDTO.getInsertDate().format(DateTimeFormatter.ofPattern("yyyyMMdd HH:mm:ss")));
            tbWorkerApplyListNew.(url2);
            tbWorkerApplyListNew.add(tbWorkerApply);
        }*/
        map.put("tbWorkerApplyAttchList",  tbWorkerApplyAttchList);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }


    //기사가입신청 승인(프로필,면허증,경력확인서)
    @ResponseBody
    @PostMapping("/driver/attach/apporval")
    public ResponseEntity<?> attachApproval(@RequestParam("attachNo") String attachNo,
                                            @RequestParam("applyAttachType") String applyAttachType,
                                            @RequestParam("authStatus") String authStatus,
                                            @RequestParam("param1") String param1,
                                            @RequestParam("param2") String param2,
                                            @RequestParam("param3") String param3,
                                            @RequestParam("uploadFile") String uploadFile,
                                            @RequestParam("applyNo") String applyNo,
                                            @RequestParam("updateUserId") String updateUserId
    )  {
        log.info("attachNo attachNo::{}", attachNo);
        Map<String,Object> map = new HashMap<>();

        try {
            int result = apiService.attachApproval(Long.parseLong(attachNo),
                    Integer.parseInt(applyAttachType),
                    param1,
                    param2,
                    param3,
                    uploadFile,
                    Integer.parseInt(authStatus),
                    Integer.parseInt(applyNo),
                    updateUserId);
            map.put("result" , result);
        } catch (Exception e) {
            map.put("result" , 0);
            e.printStackTrace();
            return new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity<>(map, HttpStatus.OK);
    }


    //차량관리 insert
    @ResponseBody
    @PostMapping("/car/insert/action")
    public ResponseEntity<?> carInsertAction(@RequestPart(value="tbStoreRentalCarData" ,required = true) TbStoreRentalCarData tbStoreRentalCarData
    ) {
        log.info("w::{}", tbStoreRentalCarData);
        Map<String,Object> map = new HashMap<>();
        try {
            LocalDateTime currentDateTime = LocalDateTime.now();
            tbStoreRentalCarData.setInsertDate(currentDateTime);

            int result = apiService.insertTbStoreRentalCar(tbStoreRentalCarData);

            if(result == 1) {
                map.put("result","200");
                map.put("message", "등록 되었습니다.");
            } else {
                map.put("result","400");
                map.put("message", "등록에 실패하였습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //차량관리 update
    @ResponseBody
    @PostMapping("/car/update/action")
    public ResponseEntity<?> carUpdateAction(@RequestPart(value="tbStoreRentalCarData" ,required = true) TbStoreRentalCarData tbStoreRentalCarData
    ) {
        log.info("tbStoreRentalCar::{}", tbStoreRentalCarData);
        Map<String,Object> map = new HashMap<>();
        try {
            int result = apiService.updateTbStoreRentalCar(tbStoreRentalCarData);

            if(result == 1) {
                map.put("result","200");
                map.put("message", "등록 되었습니다.");
            } else {
                map.put("result","400");
                map.put("message", "등록에 실패하였습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(map,HttpStatus.OK);
    }


    //외부연동 API TEST
    @ResponseBody
    @PostMapping("/rentcar/insert/action")
    public ResponseEntity<?> carUpdateAction(
            @RequestParam("storeName") String storeName,
            @RequestParam("carNum") String carNum,
            @RequestParam("custDriverTel1") String custDriverTel1,
            @RequestParam("reservStartDate") String reservStartDate,
            @RequestParam("reservEndDate") String reservEndDate,
            HttpSession session
    ) {
        Map<String,Object> map = new HashMap<>();

        String random = numberGen(40,1);
        try {
            TbRentalInfoData tbRentalInfoData = new TbRentalInfoData();
            tbRentalInfoData.setReservNum(random);
            tbRentalInfoData.setStoreName(storeName);
            tbRentalInfoData.setCarNum(carNum);
            tbRentalInfoData.setCustTel(null);
            tbRentalInfoData.setCustDriverTel1(custDriverTel1);
            tbRentalInfoData.setReservStartDate(reservStartDate);
            tbRentalInfoData.setReservEndDate(reservEndDate);

            ResponseEntity<Map> resultMap = restTemplateUtil.insertCarRent(tbRentalInfoData,session);
            Map<String,Object> bodyMap = (Map)resultMap.getBody();
            log.info("result ::"+bodyMap);
            if(!"OK".equals(bodyMap.get("serviceStatus"))){
                log.info("result :: 오류");
                map.put("result", 500);
            }else {
                log.info("result :: 성공");
                map.put("result", 200);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //기사가입신청 승인(프로필,면허증,경력확인서)
    @ResponseBody
    @PostMapping("/main/chart/list")
    public ResponseEntity<?> attachApproval()  {
        Map<String,Object> map = new HashMap<>();
        try {
            map.put("getCallAllListType2040" , apiService.getCallAllListType2040());
            map.put("getCallAllListType2041" , apiService.getCallAllListType2041());
            map.put("getCallAllListType2140" , apiService.getCallAllListType2140());
            map.put("getCallAllListType2141" , apiService.getCallAllListType2141());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    /**
     * 전달된 파라미터에 맞게 난수를 생성한다
     * @param len : 생성할 난수의 길이
     * @param dupCd : 중복 허용 여부 (1: 중복허용, 2:중복제거)
     *
     */
    public static String numberGen(int len, int dupCd ) {
        Random rand = new Random();
        String numStr = ""; //난수가 저장될 변수

        for(int i=0;i<len;i++) {

            //0~9 까지 난수 생성
            String ran = Integer.toString(rand.nextInt(10));

            if(dupCd==1) {
                //중복 허용시 numStr에 append
                numStr += ran;
            }else if(dupCd==2) {
                //중복을 허용하지 않을시 중복된 값이 있는지 검사한다
                if(!numStr.contains(ran)) {
                    //중복된 값이 없으면 numStr에 append
                    numStr += ran;
                }else {
                    //생성된 난수가 중복되면 루틴을 다시 실행한다
                    i-=1;
                }
            }
        }
        return numStr;
    }
}


