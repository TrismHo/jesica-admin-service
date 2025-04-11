package com.trism.jesica.Controller;

/*import com.trism.manna.Service.LangService;*/

import com.google.gson.JsonObject;
import com.trism.jesica.Service.*;
import com.trism.jesica.Util.DateUtil;
import com.trism.jesica.Util.GetClientIp;
import com.trism.jesica.Util.RestTemplateUtil;
import com.trism.jesica.config.JesicaProperties;
import com.trism.jesica.config.KeyGeneratorConfig;
import com.trism.jesica.dto.*;
import com.trism.jesica.persistence.mysql.Entitiy.block.TbDlvyArea;
import com.trism.jesica.persistence.mysql.Entitiy.board.TbNoticeCompany;
import com.trism.jesica.persistence.mysql.Entitiy.board.TbNoticePlatform;
import com.trism.jesica.persistence.mysql.Entitiy.board.TbNoticeRelease;
import com.trism.jesica.persistence.mysql.Entitiy.board.TbNoticeWorker;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbUserWorker;
import com.trism.jesica.persistence.mysql.Entitiy.common.LoginSession;
import com.trism.jesica.persistence.mysql.Entitiy.cust.TbCust;
import com.trism.jesica.persistence.mysql.Entitiy.event.TbEvent;
import com.trism.jesica.persistence.mysql.Entitiy.goods.*;
import com.trism.jesica.persistence.mysql.Entitiy.library.TbLibrary;
import com.trism.jesica.persistence.mysql.Entitiy.manna.*;
import com.trism.jesica.persistence.mysql.Entitiy.safe.TbSafenMapping;
import com.trism.jesica.persistence.mysql.Entitiy.street.TbDlvyPrice;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteAcl;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteMenu;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSystemCode;
import com.trism.jesica.persistence.mysql.Entitiy.vacs.TbVacsVact;
import com.trism.jesica.persistence.mysql.Entitiy.worker.TbWorkerApply;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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

    private final MasterService masterService;

    private final AuthService authService;
    private final RabbitMqService rabbitMqService;

    private final MannaService mannaService;
    private final ApiService apiService;

    @Autowired
    private CipherService cipherService;

    @Autowired
    private RestTemplateUtil restTemplateUtil;

    @Autowired
    private ExtraLinkService extraLinkService;

    @Autowired
    private CacheManager cacheManager;

    @Autowired
    private SystemPropService systemPropService;

    @Autowired
    private WorkerApplyService workerApplyService;

    private final WorkGroupService workGroupService;

    private final KeyGeneratorConfig keyGeneratorConfig;

    private final DriverApplyService driverApplyService;

    private final StatisticsService statisticsService;

    private final BrCodeService brCodeService;

    private final BoardService boardService;

   // private final OracleService oracleService;
    private final LibraryService libraryService ;

    private final SystemCodeService systemCodeService;

    private JdbcTemplate jdbcTemplate;

    //테스트용 API
    @ResponseBody
    @PostMapping(value="/company/change")
    public ResponseEntity<?> companyChange(
            HttpServletRequest request,
            @RequestParam("company") String company
    ) {
        log.info("company::{}", company);
        HttpSession session = request.getSession();
        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        loginSession.setCompany(company);
        Map<String,Object> map = new HashMap<>();
        map.put("result","200");
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    @GetMapping(value="/test")
    public String test() {
        List<LangUpdateProperty> result = langService.getAll();
        System.out.println(result.get(0).getTslId());
        return "a";
    }

   /* @GetMapping(value="/oracletest")
    public String testoracle() {
        MnA1Today mnA1Today = oracleService.oracleTest();
        System.out.println(mnA1Today.getOrdNo());
        System.out.println(mnA1Today.getPutDate());
        return "a";
    }

    @GetMapping(value="/testoracleProdecual")
    public String testoracleProdecual() throws SQLException, JsonProcessingException {
        MnA1Today mnA1Today = oracleService.oracleTest();

        //String result = oracleService.getCouponDetail("490","1069");
        Map<String, Object> inputParams = new HashMap<>();
        inputParams.put("in_REQ_NUM", "MS_01_03_01_V01");
        inputParams.put("in_LANGUAGE", "0001");
        inputParams.put("in_DEVICE", "TFA");
        inputParams.put("in_SERVICE_YN", "N");
        inputParams.put("in_VALUE", null);
        inputParams.put("in_INFO", "");
        inputParams.put("in_ARRAY_STR1", null);
        inputParams.put("in_ARRAY_STR2", null);
        inputParams.put("in_ARRAY_STR3", null);
        inputParams.put("in_ARRAY_NUM1", null);
        inputParams.put("in_ARRAY_NUM2", null);
        inputParams.put("in_ARRAY_NUM3", null);
        Map<String ,Object> result2 = oracleService.callProcedure(inputParams);
       *//* String sql = "{call SP_SV_API_APP_CU_MS.BD_GET_COUPON_LIST_V01(?, ?, ?)}";
        jdbcTemplate.call(sql, "490", "1069");*//*


        return "a";
    }*/

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
           /* ResponseEntity<Map> tokenMap2 = restTemplateUtil.refreshTokenVue(refreshToken,code,clientId,accessToken);
            Map<String,Object> codeMap2 = (Map)tokenMap2.getBody();
            String resultAccessToken = (String)((Map) tokenMap2.getBody().get("data")).get("accessToken");

            if(!"OK".equals(codeMap2.get("serviceStatus"))){
                map.put("accessToken",null);
            }else {
                log.info("cache4::" + resultAccessToken);
                map.put("accessToken", resultAccessToken);
                session.setAttribute("accessToken",resultAccessToken);
            }*/


        } catch (Exception e) {
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

    /**
     * 관제 - 배송원상세
     */
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @GetMapping("/deliveryman/detail/vue")
    public ResponseEntity<?> detailDeliveryManForControl(@RequestParam("userNo") Long userNo) {
        log.info("userNo:: ''", userNo);

        Map map = new HashMap();

        try {
            TbUserWorkerDTO tbUserWorker = workGroupService.getTbUserWorkerDTO(userNo);
            log.info("tbUserWorker::{}", tbUserWorker);

            if (StringUtils.isNotEmpty(tbUserWorker.getProfileFile())) {
                map.put("profileFile", URLEncoder.encode(tbUserWorker.getProfileFile(), "UTF-8"));
            }
            if (StringUtils.isNotEmpty(tbUserWorker.getLicenseFile())) {
                map.put("licenseFile", URLEncoder.encode(tbUserWorker.getLicenseFile(), "UTF-8"));
            }

            map.put("userWorker", tbUserWorker);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ResponseEntity<>(map, HttpStatus.OK);
    }




    //지역검색
   /* @ResponseBody
    @GetMapping("/location/getLocation")
    public ResponseEntity<?> getLocation(@RequestParam("type") String type,HttpSession session)
    {
        ResponseEntity<Map> map = restTemplateUtil.getLocation(session,type);
        return new ResponseEntity<>(map,HttpStatus.OK);
    }
*/


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

    //언어팩
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

    //입출근 신청관리 상세 update
    @ResponseBody
    @PostMapping("/cashwithdraw/update/action")
    public ResponseEntity<?> cashWithdrawUpdateAction(
            @RequestPart(value="tbCashWithdraw" ,required = false) TbCashWithdrawData tbCashWithdrawData,
            @RequestPart(value="withdrawDate" ,required = true) String withdrawDate
    ) {
        log.info("TbCashWithdraw::{}", tbCashWithdrawData);
        int result =  apiService.cashWithdrawUpdate(tbCashWithdrawData,withdrawDate);
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
            ,@RequestPart(value="tbBranchPrice" ,required = false) TbBranchPrice tbBranchPrice
    ) {
        log.info("tbBranchNo::{}", tbBranchData.getBranchNo());
        /*log.info("tbBusinessInfoData::{}", tbBusinessInfoData);*/
        int result =  apiService.updateTbBranch(tbBranchData,tbBusinessInfoData,tbBranchPrice);
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

    //시스템설정 수정
    @ResponseBody
    @GetMapping("/system/code/update")
    public ResponseEntity<?> systempropUpdate(
            @RequestParam("sysCode") String sysCode,
            @RequestParam("sysName") String sysName,
            @RequestParam("codeName") String codeName,
            @RequestParam("codeValue") String codeValue,
            @RequestParam("sysType") String sysType,
            @RequestParam("memo") String memo
    ) {
        log.info("systemcodeupdate tslId::{}", sysCode);
        Map<String,Object> map = new HashMap<>();

        if("".equals(memo)){
            memo = null;
        }

        try {
            int result = systemCodeService.updateSystemCode(sysCode ,sysName ,codeName,codeValue,sysType,memo );
            map.put("result" , result);

        } catch (Exception e) {
            map.put("result" , 0);
            e.printStackTrace();
            return new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity<>(map, HttpStatus.OK);
    }


    //시/도 검색 - 배너
    @ResponseBody
    @PostMapping("/system/code/area/list")
    public ResponseEntity<?> systemCodeList(@RequestParam("sysType") String sysType,
                                            @RequestParam("sysCode") String sysCode) {
        log.info("TbSystemCode systemType::{}", sysType);
        Map<String,Object> map = new HashMap<>();
        map.put("systemCodeList",apiService.systemCodeList(sysType,sysCode));
      /*  if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }*/
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //지역 입력 - 배너
    @ResponseBody
    @PostMapping("/banner/location/add")
    public ResponseEntity<?> bannerLocationAdd(@RequestParam("addr1") String addr1,
                                            @RequestParam("bannerNo") Long bannerNo,
                                            @RequestParam("addr2") String addr2) {
        log.info("TbSystemCode bannerNo::{}", bannerNo);
        Map<String,Object> map = new HashMap<>();
        int result = apiService.bannerLocationAreaAdd(bannerNo ,addr1 ,addr2);
        List<TbAppBannerLocationDTO> tbAppBannerLocation = apiService.getAppBannerLocation(bannerNo);
        //map.put("systemCodeList",apiService.bannerLocationAreaAdd(bannerNo ,addr1 ,addr2));
        map.put("bannerList",tbAppBannerLocation);
      /*  if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }*/
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //지역 삭제 - 배너
    @ResponseBody
    @PostMapping("/banner/location/delete")
    public ResponseEntity<?> bannerLocationDelete(  @RequestParam("bannerNo") Long bannerNo,@RequestParam("bnrLocNo") Long bnrLocNo) {
        log.info("TbSystemCode bannerNo::{}", bnrLocNo);
        Map<String,Object> map = new HashMap<>();
        apiService.bannerLocationAreaDelete(bnrLocNo,bannerNo);
        List<TbAppBannerLocationDTO> tbAppBannerLocation = apiService.getAppBannerLocation(bannerNo);
        map.put("bannerList",tbAppBannerLocation);
      /*  if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }*/
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //가상계좌정보
    @ResponseBody
    @PostMapping("/workGroup/cybankAccount/reset")
    public ResponseEntity<?> cybankAccountReset(
            @RequestParam("cybankTypeCode") String cyBankTypeCode,
            @RequestParam("no") String no,
            @RequestParam("owner") String owner,
            @RequestParam("type") Integer type,
            @RequestParam("oldBankCode") String oldBankCode,
            @RequestParam("oldNo") String oldNo
    ) {
        log.info("cyBankTypeCode::{}", cyBankTypeCode);
        Map<String,Object> map = new HashMap<>();
        List<TbVacsVact> vacsVact =  apiService.cybankAccountReset(cyBankTypeCode,no,type,oldBankCode,oldNo,owner);
        map.put("vacsVact",vacsVact);
        if(vacsVact != null){
            if(vacsVact.size() > 0) {
                map.put("result","200");
                map.put("cybankAccount",vacsVact.get(0).getAcctNo());
            } else {
                map.put("result","400");
                map.put("cybankAccount",null);
            }
        } else {
            map.put("result","400");
            map.put("cybankAccount",null);
        }

        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //드라이버 insert
    @ResponseBody
    @PostMapping(value="/deliveryman/insert/action" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> deliverymanInsertAction(
            @RequestPart(value="tbUserWorkerData" ,required = true) TbUserWorkerData tbUserWorkerData
            ,@RequestPart(value="imgFile" ,required = false) MultipartFile imgFile
            ,@RequestPart(value="imgFile2" ,required = false) MultipartFile imgFile2,
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
            if("".equals(tbUserWorkerData.getCybankOwner())){
                tbUserWorkerData.setCybankOwner(null);
            }
            if("".equals(tbUserWorkerData.getProfileFile())){
                tbUserWorkerData.setProfileFile(null);
            }
            if("".equals(tbUserWorkerData.getProfileFileSmall())){
                tbUserWorkerData.setProfileFileSmall(null);
            }
            if("".equals(tbUserWorkerData.getLicenseFile())){
                tbUserWorkerData.setLicenseFile(null);
            }
            if("".equals(tbUserWorkerData.getLicenseNum())){
                tbUserWorkerData.setLicenseNum(null);
            }
            if("".equals(tbUserWorkerData.getLicenseType())){
                tbUserWorkerData.setLicenseType(null);
            }
            if("".equals(tbUserWorkerData.getLicenseExpDate())){
                tbUserWorkerData.setLicenseExpDate(null);
            }
            if("".equals(tbUserWorkerData.getBlockTypeCode())){
                tbUserWorkerData.setBlockTypeCode(null);
            }
            if("".equals(tbUserWorkerData.getRegistrationNum())){
                tbUserWorkerData.setRegistrationNum(null);
            }
            if("".equals(tbUserWorkerData.getInsurancePolicy())){
                tbUserWorkerData.setInsurancePolicy(null);
            }

            tbUserWorker =  apiService.insertTbUserWork(tbUserWorkerData, imgFile,imgFile2, session);
            /*if (tbUserWorker != null) {
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
            }*/
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
        Integer resultCode = 0;

        try {
            List<TbSiteMenu> tbSiteMenus =  authService.getTbSiteMenuVisibleLevelList();
            apiService.insertTbUserStaff(tbUserStaffData,tbSiteMenus);
            resultCode = 1;

        }   catch (DataIntegrityViolationException e) {
        } catch (Exception e){
            resultCode = 500;
            e.printStackTrace();
        }
        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        String ip = GetClientIp.getClientIP(request);

        Map<String,Object> map = new HashMap<>();
        if(resultCode == 1) {
            /*
            *      Long.parseLong(map.get("userNo").toString()),
                   Long.parseLong(map.get("menuNo").toString()),
                   Integer.parseInt(map.get("permission").toString()),
                   Integer.parseInt(map.get("downloadAble").toString()));
            * */
            log.info("Update_role :adminId = {} / userId =  {} / ip = {} / type = {}" ,loginSession.getUserLoginId(), tbUserStaffData.getUserId() , ip , "save");
            resultCode = 1;
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else if(resultCode == 500){
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
            map.put("message", "수정 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "수정에 실패하였습니다.");
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
            ,@RequestPart(value="imgFile2" ,required = false) MultipartFile imgFile2
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
        if("".equals(tbUserWorkerData.getProfileFile())){
            tbUserWorkerData.setProfileFile(null);
        }
        if("".equals(tbUserWorkerData.getProfileFileSmall())){
            tbUserWorkerData.setProfileFileSmall(null);
        }
        if("".equals(tbUserWorkerData.getLicenseFile())){
            tbUserWorkerData.setLicenseFile(null);
        }
        if("".equals(tbUserWorkerData.getLicenseNum())){
            tbUserWorkerData.setLicenseNum(null);
        }
        if("".equals(tbUserWorkerData.getLicenseType())){
            tbUserWorkerData.setLicenseType(null);
        }
        if("".equals(tbUserWorkerData.getLicenseExpDate())){
            tbUserWorkerData.setLicenseExpDate(null);
        }
        if("".equals(tbUserWorkerData.getBlockTypeCode())){
            tbUserWorkerData.setBlockTypeCode(null);
        }
        if("".equals(tbUserWorkerData.getRegistrationNum())){
            tbUserWorkerData.setRegistrationNum(null);
        }
        if("".equals(tbUserWorkerData.getInsurancePolicy())){
            tbUserWorkerData.setInsurancePolicy(null);
        }

        int result = 0;
        try {
            result =  apiService.updateTbUser(tbUserWorkerData,tbWorkerChargeData, imgFile, imgFile2, session);
        } catch (Exception e){
            log.error("error :"+e.getMessage());
        }

        /*if(result == 1){
            ResponseEntity<Map> tokenMap = restTemplateUtil.driverStatusInit(tbUserWorkerData.getUserNo(), session);
            Map<String,Object> codeMap2 = (Map)tokenMap.getBody();//아이디가 있으면 update
            if("OK".equals(codeMap2.get("serviceStatus"))){
                log.info("driverStatusOk:::"+tbUserWorkerData.getUserNo());
                result = 1;
            } else {
                log.info("driverStatusError");
            }
        }*/

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

    //드라이버 삭제
    @ResponseBody
    @PostMapping(value="/deliveryman/delete/action")
    public ResponseEntity<?> deliverymanDelete(
            @RequestParam("phone") String phone
    ) {
        log.info("phone::{}", phone);

        int result =  apiService.deleteDeliveryman(phone);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "삭제 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "삭제 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //드라이버 삭제
    @ResponseBody
    @PostMapping(value="/driverapply/delete/action")
    public ResponseEntity<?> driverApplyDelete(
            @RequestParam("phone") String phone
    ) {
        log.info("phone::{}", phone);

        int result =  apiService.deleteDriverApply(phone);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "삭제 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "삭제 실패하였습니다.");
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
  /* @ResponseBody
    @PostMapping(value="/deliveryblock/insert/action" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> deliveryblockInsertAction(
            @RequestPart(value="tbDlvyAreaCharge" ,required = true) TbDlvyAreaData tbDlvyAreaData
    ) {
        log.info("TbDlvyAreaData tbDlvyAreaData::{}", tbDlvyAreaData);
        *//*log.info("TbUser tbUserWorker::{}", tbUserWorker);*//*
        int result =  apiService.insertTbDlvyArea(tbDlvyAreaData);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }*/

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

    //배송블럭 수정
    @ResponseBody
    @PostMapping(value="/deliveryblock/block/update" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> deliveryblockUp(
            @RequestPart(value="tbDlvyArea" ,required = true) TbDlvyArea tbDlvyArea,
            @RequestPart(value="tbDlvyAreaList" ,required = true) List tbDlvyAreaList
    ) {
        log.info("TbDlvyArea tbDlvyArea::{}", tbDlvyArea);
        log.info("TbDlvyAreaList tbDlvyAreaList::{}", tbDlvyAreaList);

        int result =  apiService.updateTbDlvyArea(tbDlvyArea, tbDlvyAreaList);
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

    //배송블럭 삭제
    @ResponseBody
    @PostMapping(value="/deliveryblock/block/delete")
    public ResponseEntity<?> deliveryblockDel(
            @RequestParam("areaNo") String areaNo
    ) {
        log.info("areaNo::{}", areaNo);

        int result =  apiService.deleteTbDlvyArea(Long.parseLong(areaNo));
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
    public ResponseEntity<?> deliveryblockAreaList(@RequestParam("groupNo") String groupNo,
                                                   @RequestParam("groupType") String groupType,
                                                   @RequestParam("areaChargeType") String areaChargeType) {
        log.info("groupNo::{}", groupNo);
        Map<String,Object> map = new HashMap<>();
        List<TbDlvyArea> tbDlvyAreaList = apiService.tbDlvyAreaList(Long.parseLong(groupNo),Integer.parseInt(groupType),Integer.parseInt(areaChargeType));

        map.put("tbDlvyAreaList",  tbDlvyAreaList);
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //블록 등록 좌표 리스트
    @ResponseBody
    @PostMapping("/deliveryblock/dlvyAreaGeo/list")
    public ResponseEntity<?> deliveryblockAreaGeoList(@RequestParam("groupNo") String groupNo,
                                                      @RequestParam("groupType") String groupType,
                                                      @RequestParam("areaChargeType") String areaChargeType
    ) {
        log.info("groupNo::{}", groupNo);
        Map<String,Object> map = new HashMap<>();
        List tbDlvyAreaGeoList = apiService.tbDlvyAreaGeoList(Long.parseLong(groupNo),Integer.parseInt(groupType),Integer.parseInt(areaChargeType));

        map.put("tbDlvyAreaGeoList",  tbDlvyAreaGeoList);
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //블록 등록 좌표 단일조회
    @ResponseBody
    @PostMapping("/deliveryblock/dlvyAreaGeo/detail")
    public ResponseEntity<?> deliveryblockAreaGeoDetail(@RequestParam("groupNo") String groupNo,
                                                      @RequestParam("groupType") String groupType,
                                                      @RequestParam("areaChargeType") String areaChargeType,
                                                      @RequestParam("areaNo") String areaNo) {
        log.info("groupNo::{}", groupNo);
        Map<String,Object> map = new HashMap<>();
        List tbDlvyAreaGeoList = apiService.tbDlvyAreaGeoDetail(Long.parseLong(groupNo),Integer.parseInt(groupType),Long.parseLong(areaNo),Integer.parseInt(areaChargeType));

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
   /* @ResponseBody
    @PostMapping(value="/deliverystreet/insert/action" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> deliverystreetAdd(
            @RequestPart(value="tbDlvyPriceCharge" ,required = true) TbDlvyPrice tbDlvyPriceData
    ) {
        log.info("TbDlvyPriceData tbDlvyPriceData::{}", tbDlvyPriceData);

        int result =  apiService.insertTbDlvyPrice(tbDlvyPriceData);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }*/

    //블록 등록 리스트
    @ResponseBody
    @PostMapping("/deliverystreet/dlvyPrice/list")
    public ResponseEntity<?> deliveryPriceList(@RequestParam("groupNo") String groupNo,@RequestParam("groupType") String groupType) {
        log.info("groupNo::{}", groupNo);
        Map<String,Object> map = new HashMap<>();
        List<TbDlvyPrice> tbDlvyPriceList = apiService.tbDlvyPriceList(Long.parseLong(groupNo),Integer.parseInt(groupType));

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

    @ResponseBody
    @PostMapping("/file/upload/event")
    public String eventUpdate(
            MultipartHttpServletRequest multipartRequest
            ,HttpServletResponse response
    ) {
        PrintWriter printWriter = null;

        try {
            OutputStream os = null;
            /*if (imgFile != null && !imgFile.isEmpty()) {*/
                String fileName = RandomStringUtils.random(8, 33, 125, true, true);

                Path filePath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                        jesicaProperties.getBoardPath().getPath(),
                        jesicaProperties.getEventPath().getPath()
                );

                byte[] bytes = multipartRequest.getFile("upload").getBytes();
                File uploadFile = new File(filePath.toFile().getPath());
                if (!uploadFile.exists()) {
                    uploadFile.mkdirs();
                }
                int pos = multipartRequest.getFile("upload").getOriginalFilename().lastIndexOf(".");
                String ext = multipartRequest.getFile("upload").getOriginalFilename().substring(pos + 1);
                Path upoladFullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                        jesicaProperties.getBoardPath().getPath(),
                        jesicaProperties.getEventPath().getPath()
                        , fileName + "." + ext);
                Path upoladFileNamePath = Paths.get(
                        jesicaProperties.getBoardPath().getPath(),
                        jesicaProperties.getEventPath().getPath()
                        , fileName + "." + ext);

                os = new FileOutputStream(new File(upoladFullPath.toFile().getPath()));
                os.write(bytes);
                os.close();
                String fileUrl = jesicaProperties.getImgHttp().getPath()+upoladFileNamePath;
                printWriter = response.getWriter(); // 서버로 파일 전송 후 이미지 정보 확인을 위해 filename, uploaded, fileUrl 정보를 response 해주어야 함
                printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
                printWriter.flush();

            /*}*/
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @ResponseBody
    @PostMapping("/file/upload/platform")
    public String platFormUpdate(
            MultipartHttpServletRequest multipartRequest
            ,HttpServletResponse response
    ) {
        PrintWriter printWriter = null;

        try {
            OutputStream os = null;
            /*if (imgFile != null && !imgFile.isEmpty()) {*/
                String fileName = RandomStringUtils.random(8, 33, 125, true, true);

                Path filePath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                        jesicaProperties.getBoardPath().getPath(),
                        jesicaProperties.getPlatFormPath().getPath()
                );

                byte[] bytes = multipartRequest.getFile("upload").getBytes();
                File uploadFile = new File(filePath.toFile().getPath());
                if (!uploadFile.exists()) {
                    uploadFile.mkdirs();
                }
                int pos = multipartRequest.getFile("upload").getOriginalFilename().lastIndexOf(".");
                String ext = multipartRequest.getFile("upload").getOriginalFilename().substring(pos + 1);
                Path upoladFullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                        jesicaProperties.getBoardPath().getPath(),
                        jesicaProperties.getPlatFormPath().getPath()
                        , fileName + "." + ext);
                Path upoladFileNamePath = Paths.get(
                        jesicaProperties.getBoardPath().getPath(),
                        jesicaProperties.getPlatFormPath().getPath()
                        , fileName + "." + ext);

                os = new FileOutputStream(new File(upoladFullPath.toFile().getPath()));
                os.write(bytes);
                os.close();
                String fileUrl = jesicaProperties.getImgHttp().getPath()+upoladFileNamePath;
                printWriter = response.getWriter(); // 서버로 파일 전송 후 이미지 정보 확인을 위해 filename, uploaded, fileUrl 정보를 response 해주어야 함
                printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
                printWriter.flush();

            /*}*/
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
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
    public ResponseEntity<?> eventInsert(@RequestPart TbEvent tbEvent,
            @RequestPart String startDate,
            @RequestPart String endDate,
            HttpSession session

            /*,@RequestPart(value="imgFileSmall" ,required = false) MultipartFile imgFileSmall*/
    ) {
        log.info("tbEvent::{}", tbEvent);
        log.info("startDate::{}", startDate);
        log.info("endDate::{}", endDate);

        startDate = startDate.trim()+ " 00:00:00";
        endDate = endDate.trim()+ " 23:59:59";

        LocalDateTime startDateText = LocalDateTime.parse(startDate,
                DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        LocalDateTime endDateText = LocalDateTime.parse(endDate,
                DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        tbEvent.setStartDate(startDateText);
        tbEvent.setEndDate(endDateText);

        /*log.info("imgFileSmall::{}", imgFileSmall);*/
        int result =  apiService.insertEvent(tbEvent);
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
    public ResponseEntity<?> eventUpdate(@RequestPart TbEvent tbEvent,
            @RequestPart String startDate,
            @RequestPart String endDate
            /*,@RequestPart(value="imgFileSmallFile" ,required = false) MultipartFile imgFileSmallFile*/
    ) {
        log.info("tbEvent::{}", tbEvent);
        log.info("startDate::{}", startDate);
        log.info("endDate::{}", endDate);

        startDate = startDate.trim()+ " 00:00:00";
        endDate = endDate.trim()+ " 23:59:59";

        LocalDateTime startDateText = LocalDateTime.parse(startDate,
                DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        LocalDateTime endDateText = LocalDateTime.parse(endDate,
                DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        tbEvent.setStartDate(startDateText);
        tbEvent.setEndDate(endDateText);
        /*log.info("imgFileSmallFile::{}", imgFileSmallFile);*/
        int result =  apiService.updateEvent(tbEvent);
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

    //이벤트 삭제
    @ResponseBody
    @PostMapping("/board/event/delete")
    public ResponseEntity<?> eventDelete(@RequestParam("eventNo") Long eventNo
    ) {
        log.info("eventNo::{}", eventNo);

        int result =  apiService.eventDelete(eventNo);
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


    //릴리즈내역 공지 등록
    @ResponseBody
    @PostMapping(value="/system/release/insert" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
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
    @PostMapping(value="/system/release/update" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
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
    @PostMapping("/system/release/delete")
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

    /**
     * 기사가입신청내역 리스트
     */
    @GetMapping("/driver/apply/list")
    public ResponseEntity<?> listAffiliated(Locale locale, HttpServletRequest request, HttpSession session,
                                       @RequestParam Map<String,Object> searchValue,
                                       Model model) {
        log.info("@@searchValue {}",searchValue);
        Map<String,Object> map = new HashMap<>();
        try {
            if (!searchValue.isEmpty()) {

                putSearchOption(session, searchValue);

                List<TbWorkerApply> tbWorkerApplyList =  workerApplyService.getWorkList(searchValue);
                List<TbWorkerApply> tbWorkerApplyListNew = new ArrayList<TbWorkerApply>();
                for (TbWorkerApply tbWorkerApply : tbWorkerApplyList) {
                    String url = "";
                    String url2 = "";
                    String url3 = "";
                    if (tbWorkerApply.getProfileFileSmall() != null) {
                        url = URLEncoder.encode(tbWorkerApply.getProfileFileSmall(), "UTF-8");
                    }
                    if (tbWorkerApply.getProfileFile() != null) {
                        url2 = URLEncoder.encode(tbWorkerApply.getProfileFile(), "UTF-8");
                    }
                    if (tbWorkerApply.getCareerFile() != null) {
                        url3 = URLEncoder.encode(tbWorkerApply.getCareerFile(), "UTF-8");
                    }
                    tbWorkerApply.setProfileFileSmall(url);
                    tbWorkerApply.setProfileFile(url2);
                    tbWorkerApply.setCareerFile(url3);
                    tbWorkerApplyListNew.add(tbWorkerApply);
                }
                map.put("data", tbWorkerApplyListNew);
            } else {
                searchValue = getSearchOption(session);
                map.put("data", null);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ResponseEntity<>(map, HttpStatus.OK);
    }


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
                                            @RequestParam("updateUserId") String updateUserId,
                                            @RequestParam("rejectMemo") String rejectMemo,
                                            @RequestParam("pushKey") String pushKey,
                                            HttpSession session
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
                    updateUserId,
                    rejectMemo,
                    pushKey,
                    session);
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

        String random = numberGen(7,1);
        try {
            TbRentalInfoData tbRentalInfoData = new TbRentalInfoData();
            tbRentalInfoData.setReservNum(DateUtil.now_yyyymmdd() +"-"+ random);
            tbRentalInfoData.setStoreName(storeName);
            tbRentalInfoData.setCarNum(carNum);
            tbRentalInfoData.setCustTel(null);
            tbRentalInfoData.setCustDriverTel1(custDriverTel1);
            tbRentalInfoData.setReservStartDate(reservStartDate);
            tbRentalInfoData.setReservEndDate(reservEndDate);

           /* ResponseEntity<Map> resultMap = restTemplateUtil.insertCarRent(tbRentalInfoData,session);
            Map<String,Object> bodyMap = (Map)resultMap.getBody();
            log.info("result ::"+bodyMap);
            if(!"OK".equals(bodyMap.get("serviceStatus"))){
                log.info("result :: 오류");
                map.put("result", 500);
            }else {
                log.info("result :: 성공");
                map.put("result", 200);
            }*/

        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //외부연동 API 안심번호 강제 할당
    @ResponseBody
    @PostMapping("/rentcar/resetSafenNum")
    public ResponseEntity<?> carUpdateAction(
            @RequestParam("rentalNo") String rentalNo,
            HttpSession session
    ) {
        log.info("rentalNo ::"+rentalNo);
        Map<String,Object> map = new HashMap<>();

        try {

           /* ResponseEntity<Map<String, Object>> resultMap = restTemplateUtil.resetSafenNum(Long.parseLong(rentalNo),session);
            Map<String,Object> bodyMap = (Map)resultMap.getBody();
            log.info("result ::"+bodyMap);
            if(!"OK".equals(bodyMap.get("serviceStatus"))){
                log.info("result :: 오류 500");
                map.put("result", 500);
            }else {
                log.info("result :: 성공");
                map.put("result", 200);
                //성공하면 다시 update
             *//*   Map<String,String> safunDate = (Map)resultMap.getBody().get("data");
                log.info("safenNo ::"+safunDate.get("safen_no"));*//*
               *//* int result = apiService.updateTbRentalInfoSafenNum(Integer.parseInt(rentalNo),safunDate.get("safen_no"));*//*
                *//*if(result == 1){
                    log.info("result :: 성공");
                    map.put("result", 200);
                } else {
                    log.info("result :: 오류 600");
                    map.put("result", 600);
                }*//*
            }
*/
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    @ResponseBody
    @PostMapping("/main/chart/list")
    public ResponseEntity<?> chartData(@RequestParam("searchDate") String searchDate, @RequestParam("appCode") String appCode, HttpSession session)  {
        Map<String,Object> map = new HashMap<>();
        try {
            map.put("getCallAllListType2040" , apiService.getCallAllListType2040(searchDate));
            map.put("getCallAllListType2041" , apiService.getCallAllListType2041(searchDate));
            map.put("getCallAllListType2140" , apiService.getCallAllListType2140(searchDate));
            map.put("getCallAllListType2141" , apiService.getCallAllListType2141(searchDate));

            //맛집 주문통계 추가
            LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey") ;

            if("".equals(appCode)){
                map.put("getUserCount" , apiService.getUserCount(2, null));
            } else {
                map.put("getUserCount" , apiService.getUserCount(2, appCode));
            }

         /*   if("jesicar".equals(loginSession.getCompany())) {
                map.put("getUserCount" , apiService.getUserCount(1, appCode));
            } else if ("yangpa".equals(loginSession.getCompany())) {

            }*/



        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    // 고객리스트 페이징
    @ResponseBody
    @RequestMapping(value = {"/user/chart/page"})
    public DataTableModel userChartPageList(HttpServletRequest request, DataTableDTO paging,
                                    @RequestParam Map<String,Object> searchValue){

        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        String company = loginSession.getCompany();
        String appCode = loginSession.getAppCode();
        Map<String,Object> map = new HashMap<>();

      /*  if(!"".equals(appCode)){
            searchValue.put("appCode",appCode);
        } else {
            searchValue.put("appCode","");
        }*/
        paging.setStart(1);
        paging.setLength(10000000);
      /*  paging.setStart(Integer.parseInt(searchValue.get("start").toString()));
        paging.setLength(Integer.parseInt(searchValue.get("length").toString()));*/
        int page = paging.getStart() / paging.getLength(); //Calculate page number

        Map<String, Object> resultMap = null;

        Pageable pageable;
        pageable = PageRequest.of(
                page,
                paging.getLength(),
                Sort.by("c.yyyymmdd").descending()
        ) ;
        try {
            getSearchOption(session);
           /* if("jesicar".equals(company)) {
                searchValue.put("platformType","1");
            } else if ("yangpa".equals(company)) {
                searchValue.put("platformType","2");
            }*/
            searchValue.put("platformType","2");
            if (!searchValue.isEmpty()){

                Map<String,Object> timeList = null;
                LocalDateTime startDate = null;
                LocalDateTime endDate = null;
                Integer platfromCode = null;
                String extBrCode = null;
                String addrCode = null;
                /*if("jesicar".equals(company)) {
                    platfromCode = 1;
                    searchValue.put("platformType","1");
                } else if ("yangpa".equals(company)) {
                    platfromCode = 2;

                }*/
                platfromCode = 2;
                searchValue.put("platformType","2");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                if (searchValue.get("startDate") != null) {
                    String string = searchValue.get("startDate").toString() + " 00:00:00";
                    startDate = LocalDateTime.parse(string, formatter);
                } else {
                    String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
                    startDate = LocalDateTime.parse(string, formatter);
                }
                if (searchValue.get("endDate") != null) {
                    String string = searchValue.get("endDate").toString() + " 23:59:59";
                    endDate = LocalDateTime.parse(string, formatter);
                } else {
                    String string =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
                    endDate = LocalDateTime.parse(string, formatter);
                }

                extBrCode = ObjectUtils.isNotEmpty(searchValue.get("extBrCode")) ? searchValue.get("extBrCode").toString() : null;
                addrCode = ObjectUtils.isNotEmpty(searchValue.get("addrCode")) ? searchValue.get("addrCode").toString() : null;
                appCode = ObjectUtils.isNotEmpty(searchValue.get("appCode")) ? searchValue.get("appCode").toString() : null;

                if (!"".equals(searchValue.get("dayType"))) {
                    timeList =  statisticsService.getUserLineListPage(startDate,endDate, platfromCode, extBrCode, addrCode , appCode, pageable ,searchValue.get("dayType").toString());
                } else {
                    timeList =  statisticsService.getUserLineListPage(startDate,endDate, platfromCode, extBrCode, addrCode , appCode, pageable ,"2");
                }

                map.put("timeList" , timeList);
                resultMap = timeList;
            } else {

                Map<String,Object> timeList = null;
                Integer platfromCode = null;
                String extBrCode = null;
                String addrCode = null;
               /* if("jesicar".equals(company)) {
                    platfromCode = 1;
                    searchValue.put("platformType","1");
                } else if ("yangpa".equals(company)) {
                    platfromCode = 2;

                }*/
                platfromCode = 2;
                searchValue.put("platformType","2");
                extBrCode = ObjectUtils.isNotEmpty(searchValue.get("extBrCode")) ? searchValue.get("extBrCode").toString() : null;
                addrCode = ObjectUtils.isNotEmpty(searchValue.get("addrCode")) ? searchValue.get("addrCode").toString() : null;
                appCode = ObjectUtils.isNotEmpty(searchValue.get("appCode")) ? searchValue.get("appCode").toString() : null;

                LocalDateTime startDate = null;
                LocalDateTime endDate = null;

                searchValue.put("startDate",DateUtil.now_yyyy_mm_dd_month());
                searchValue.put("endDate", DateUtil.now_yyyy_mm_dd_yester());

                String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
                String string1 =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

                startDate = LocalDateTime.parse(string, formatter);
                endDate = LocalDateTime.parse(string1, formatter);
                if (!"".equals(searchValue.get("dayType"))) {
                    timeList =  statisticsService.getUserLineListPage(startDate,endDate, platfromCode, extBrCode, addrCode , appCode, pageable ,searchValue.get("dayType").toString());
                } else {
                    timeList =  statisticsService.getUserLineListPage(startDate,endDate, platfromCode, extBrCode, addrCode , appCode, pageable ,"2");
                }
                map.put("timeList" , timeList);
                resultMap = timeList;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        List<HashMap<String,Object>> list = (List<HashMap<String,Object>>) resultMap.get("tbCustList");
        // paging 객체 Set

        // 응답값 Set
        return DataTableModel.builder()
                .recordsTotal(Integer.parseInt(resultMap.get("totalElement").toString()))
                .data(list)
                .build();
    }

    // 주문통계
    @ResponseBody
    @RequestMapping(value = {"/mannaorder/chart/page"})
    public DataTableModel orderChartPageList(HttpServletRequest request, DataTableDTO paging,
                                            @RequestParam Map<String,Object> searchValue){

        log.info("@@searchValue {}",searchValue);

        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        String company = loginSession.getCompany();
        String appCode = loginSession.getAppCode();
        Map<String,Object> map = new HashMap<>();

        /*paging.setStart(Integer.parseInt(searchValue.get("start").toString()));
        paging.setLength(Integer.parseInt(searchValue.get("length").toString()));*/
        paging.setStart(1);
        paging.setLength(10000000);
        int page = paging.getStart() / paging.getLength(); //Calculate page number

        Map<String, Object> resultMap = null;

        Pageable pageable;
        pageable = PageRequest.of(
                page,
                paging.getLength(),
                Sort.by("c.yyyymmdd").descending()
        ) ;
        try {
            getSearchOption(session);
         /*   if("jesicar".equals(company)) {
                searchValue.put("platformType","1");
            } else if ("yangpa".equals(company)) {
                searchValue.put("platformType","2");
            }*/
            searchValue.put("platformType","2");
            if (!searchValue.isEmpty()){

                Map<String,Object> timeList = null;
                LocalDateTime startDate = null;
                LocalDateTime endDate = null;
                String ordPathCd = null;
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                if (searchValue.get("startDate") != null) {
                    String string = searchValue.get("startDate").toString() + " 00:00:00";
                    startDate = LocalDateTime.parse(string, formatter);
                } else {
                    String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
                    startDate = LocalDateTime.parse(string, formatter);
                }
                if (searchValue.get("endDate") != null) {
                    String string = searchValue.get("endDate").toString() + " 23:59:59";
                    endDate = LocalDateTime.parse(string, formatter);
                } else {
                    String string =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
                    endDate = LocalDateTime.parse(string, formatter);
                }
                if("jesicar".equals(company)) {
                    ordPathCd = "1063";
                    searchValue.put("ordPathCd","1063");
                } else if ("yangpa".equals(company)) {
                    ordPathCd = "1069";
                    searchValue.put("ordPathCd","1069");
                }
                String brCode = null;
                String ordStatus = null;
                String brandTypeCd = null;
                brCode = ObjectUtils.isNotEmpty(searchValue.get("brCode")) ? searchValue.get("brCode").toString() : null;
                ordStatus = ObjectUtils.isNotEmpty(searchValue.get("ordStatus")) ? searchValue.get("ordStatus").toString() : null;
                brandTypeCd = ObjectUtils.isNotEmpty(searchValue.get("brandTypeCd")) ? searchValue.get("brandTypeCd").toString() : null;
                log.info("@@searchValue {}",searchValue);
                if (!"".equals(searchValue.get("dayType"))) {
                    resultMap =  statisticsService.getMannaOrderListPage(startDate,endDate, ordPathCd, brCode , ordStatus,brandTypeCd, pageable, searchValue.get("dayType").toString());
                } else {
                    resultMap =  statisticsService.getMannaOrderListPage(startDate,endDate, ordPathCd, brCode , ordStatus,brandTypeCd, pageable, "2");
                }
            } else {

                String ordPathCd = null;
                String brCode = null;
                String ordStatus = null;
                String brandTypeCd = null;
                /*if("jesicar".equals(company)) {
                    ordPathCd = "1063";
                    searchValue.put("ordPathCd","1063");
                } else if ("yangpa".equals(company)) {
                    ordPathCd = "1069";
                    searchValue.put("ordPathCd","1069");
                }*/
                ordPathCd = "1069";
                searchValue.put("ordPathCd","1069");
                brCode = ObjectUtils.isNotEmpty(searchValue.get("brCode")) ? searchValue.get("brCode").toString() : null;
                brandTypeCd = ObjectUtils.isNotEmpty(searchValue.get("brandTypeCd")) ? searchValue.get("brandTypeCd").toString() : null;
                ordStatus = ObjectUtils.isNotEmpty(searchValue.get("ordStatus")) ? searchValue.get("ordStatus").toString() : null;

                LocalDateTime startDate = null;
                LocalDateTime endDate = null;

                searchValue.put("startDate",DateUtil.now_yyyy_mm_dd_month());
                searchValue.put("endDate", DateUtil.now_yyyy_mm_dd_yester());

                String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
                String string1 =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

                startDate = LocalDateTime.parse(string, formatter);
                endDate = LocalDateTime.parse(string1, formatter);
                log.info("@@searchValue {}",searchValue);
                if (!"".equals(searchValue.get("dayType"))) {
                    resultMap =  statisticsService.getMannaOrderListPage(startDate,endDate, ordPathCd, brCode , ordStatus,brandTypeCd, pageable, searchValue.get("dayType").toString());
                } else {
                    resultMap =  statisticsService.getMannaOrderListPage(startDate,endDate, ordPathCd, brCode , ordStatus,brandTypeCd, pageable, "2");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        List<HashMap<String,Object>> list = (List<HashMap<String,Object>>) resultMap.get("TbMannaOrderList");
        // paging 객체 Set

        // 응답값 Set
        return DataTableModel.builder()
                .recordsTotal(Integer.parseInt(resultMap.get("totalElement").toString()))
                .data(list)
                .build();
    }

    @ResponseBody
    @PostMapping("/user/chart/list")
    public ResponseEntity<?> chartData(@RequestBody Map<String,Object> searchValue, HttpSession session)  {
        Map<String,Object> map = new HashMap<>();
        try {
            LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
            String company = loginSession.getCompany();

            if (!searchValue.isEmpty()){
                List<Map<String,Object>> timeList = null;
                LocalDateTime startDate = null;
                LocalDateTime endDate = null;
                Integer platfromCode = null;
                String extBrCode = null;
                String appCode = null;

                String addrCode = null;
              /*  if("jesicar".equals(company)) {
                    platfromCode = 1;
                    searchValue.put("platformType","1");
                } else if ("yangpa".equals(company)) {
                    platfromCode = 2;
                    searchValue.put("platformType","2");
                } */
                platfromCode = 2;
                searchValue.put("platformType","2");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                if (searchValue.get("startDate") != null) {
                    String string = searchValue.get("startDate").toString() + " 00:00:00";
                    startDate = LocalDateTime.parse(string, formatter);
                } else {
                    String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
                    startDate = LocalDateTime.parse(string, formatter);
                }
                if (searchValue.get("endDate") != null) {
                    String string = searchValue.get("endDate").toString() + " 23:59:59";
                    endDate = LocalDateTime.parse(string, formatter);
                } else {
                    String string =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
                    endDate = LocalDateTime.parse(string, formatter);
                }
                appCode = ObjectUtils.isNotEmpty(searchValue.get("appCode")) ? searchValue.get("appCode").toString() : null;
                addrCode = ObjectUtils.isNotEmpty(searchValue.get("addrCode")) ? searchValue.get("addrCode").toString() : null;
                extBrCode = ObjectUtils.isNotEmpty(searchValue.get("extBrCode")) ? searchValue.get("extBrCode").toString() : null;

                if (!"".equals(searchValue.get("dayType"))) {
                    if("2".equals(searchValue.get("dayType").toString())) {
                        timeList =  statisticsService.getUserLineDayList(startDate,endDate, platfromCode, extBrCode, addrCode , appCode);
                    } else {
                        timeList =  statisticsService.getUserLineWeekList(startDate,endDate, platfromCode, extBrCode, addrCode ,appCode);
                    }
                } else {
                    timeList =  statisticsService.getUserLineDayList(startDate,endDate, platfromCode, extBrCode, addrCode , appCode);
                }

                map.put("timeList" , timeList);
            }
            /*else {

                List<Map<String,Object>> timeList = null;
                Integer platfromCode = null;
                String extBrCode = null;
                String addrCode = null;
                String appCode = null;
                if("jesicar".equals(company)) {
                    platfromCode = 1;
                    searchValue.put("platformType","1");
                } else if ("yangpa".equals(company)) {
                    platfromCode = 2;
                    searchValue.put("platformType","2");
                }
                if (searchValue.get("extBrCode") != null && searchValue.get("extBrCode") != "") {
                    extBrCode = searchValue.get("extBrCode").toString();
                } else {
                    extBrCode = null;
                }
                if (searchValue.get("addrCode") != null && searchValue.get("addrCode") != "") {
                    addrCode = searchValue.get("addrCode").toString();
                } else {
                    addrCode = null;
                }
                if (searchValue.get("appCode") != null && searchValue.get("appCode") != "") {
                    appCode = searchValue.get("appCode").toString();
                } else {
                    appCode = null;
                }

                LocalDateTime startDate = null;
                LocalDateTime endDate = null;

                searchValue.put("startDate",DateUtil.now_yyyy_mm_dd_month());
                searchValue.put("endDate", DateUtil.now_yyyy_mm_dd_yester());

                String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
                String string1 =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

                startDate = LocalDateTime.parse(string, formatter);
                endDate = LocalDateTime.parse(string1, formatter);

                if (searchValue.get("dayType") != null) {
                    if("2".equals(searchValue.get("dayType").toString())) {
                        timeList =  statisticsService.getUserLineDayList(startDate,endDate, platfromCode, extBrCode, addrCode , appCode);
                    } else {
                        timeList =  statisticsService.getUserLineWeekList(startDate,endDate, platfromCode, extBrCode, addrCode ,appCode);
                    }
                }  else {
                    timeList =  statisticsService.getUserLineDayList(startDate,endDate, platfromCode, extBrCode, addrCode , appCode);
                }
                map.put("timeList" , timeList);
            }*/


        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @ResponseBody
    @PostMapping("/location/chart/list")
    public ResponseEntity<?> chartDataLocation(@RequestBody Map<String,Object> searchValue, HttpSession session)  {
        Map<String,Object> map = new HashMap<>();
        try {
            LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
            String company = loginSession.getCompany();

            if (!searchValue.isEmpty()){

                List<Map<String,Object>> timeList = null;
                LocalDateTime startDate = null;
                LocalDateTime endDate = null;
                Integer platfromCode = null;
                String extBrCode = null;

               /*  if("jesicar".equals(company)) {
                    platfromCode = 1;
                    searchValue.put("platformType","1");
                } else if ("yangpa".equals(company)) {
                    platfromCode = 2;
                    searchValue.put("platformType","2");
                } */
                platfromCode = 2;
                searchValue.put("platformType","2");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                if (searchValue.get("startDate") != null) {
                    String string = searchValue.get("startDate").toString() + " 00:00:00";
                    startDate = LocalDateTime.parse(string, formatter);
                } else {
                    String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
                    startDate = LocalDateTime.parse(string, formatter);
                }
                if (searchValue.get("endDate") != null) {
                    String string = searchValue.get("endDate").toString() + " 23:59:59";
                    endDate = LocalDateTime.parse(string, formatter);
                } else {
                    String string =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
                    endDate = LocalDateTime.parse(string, formatter);
                }
                if (searchValue.get("extBrCode") != null && searchValue.get("extBrCode") != "") {
                    extBrCode = searchValue.get("extBrCode").toString();
                } else {
                    extBrCode = null;
                }
                timeList =  statisticsService.getLocationLineDayList(startDate,endDate, platfromCode );
                /*if (searchValue.get("dayType") != null) {
                    if("1".equals(searchValue.get("dayType").toString())) {
                        timeList =  statisticsService.getLocationLineWeekList(startDate,endDate, platfromCode, extBrCode );
                    } else {

                    }
                }*/
                map.put("timeList" , timeList);
            } else {

                List<Map<String,Object>> timeList = null;
                Integer platfromCode = null;
                String extBrCode = null;
                String addrCode = null;
               /*  if("jesicar".equals(company)) {
                    platfromCode = 1;
                    searchValue.put("platformType","1");
                } else if ("yangpa".equals(company)) {
                    platfromCode = 2;
                    searchValue.put("platformType","2");
                } */
                platfromCode = 2;
                searchValue.put("platformType","2");
                if (searchValue.get("extBrCode") != null && searchValue.get("extBrCode") != "") {
                    extBrCode = searchValue.get("extBrCode").toString();
                } else {
                    extBrCode = null;
                }
                LocalDateTime startDate = null;
                LocalDateTime endDate = null;

                searchValue.put("startDate",DateUtil.now_yyyy_mm_dd_month());
                searchValue.put("endDate", DateUtil.now_yyyy_mm_dd_yester());

                String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
                String string1 =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

                startDate = LocalDateTime.parse(string, formatter);
                endDate = LocalDateTime.parse(string1, formatter);
                timeList =  statisticsService.getLocationLineDayList(startDate,endDate, platfromCode);
                map.put("timeList" , timeList);
            }


        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @ResponseBody
    @PostMapping("/manna/order/list")
    public ResponseEntity<?> mannaOrderData(@RequestBody Map<String,Object> searchValue, HttpSession session)  {
        Map<String,Object> map = new HashMap<>();
        try {
            LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
            String company = loginSession.getCompany();

            if (!searchValue.isEmpty()){

                List<Map<String,Object>> timeList = null;
                LocalDateTime startDate = null;
                LocalDateTime endDate = null;
                String ordPathCd = null;
                String brCode = null;
                String brandTypeCd = null;
                String ordStatus = null;
              /*  if("jesicar".equals(company)) {
                    ordPathCd = "1063";
                    searchValue.put("ordPathCd","1063");
                } else if ("yangpa".equals(company)) {
                    searchValue.put("ordPathCd","1069");
                }*/
                ordPathCd = "1069";
                searchValue.put("ordPathCd","1069");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                if (searchValue.get("startDate") != null) {
                    String string = searchValue.get("startDate").toString() + " 00:00:00";
                    startDate = LocalDateTime.parse(string, formatter);
                } else {
                    String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
                    startDate = LocalDateTime.parse(string, formatter);
                }
                if (searchValue.get("endDate") != null) {
                    String string = searchValue.get("endDate").toString() + " 23:59:59";
                    endDate = LocalDateTime.parse(string, formatter);
                } else {
                    String string =  DateUtil.now_yyyy_mm_dd()+ " 23:59:59";
                    endDate = LocalDateTime.parse(string, formatter);
                }
                if (searchValue.get("brCode") != null && searchValue.get("brCode") != "") {
                    brCode = searchValue.get("brCode").toString();
                }
                if (searchValue.get("ordStatus") != null && searchValue.get("ordStatus") != "") {
                    ordStatus = searchValue.get("ordStatus").toString();
                }
                brandTypeCd = ObjectUtils.isNotEmpty(searchValue.get("brandTypeCd")) ? searchValue.get("brandTypeCd").toString() : null;
                if (!"".equals(searchValue.get("dayType"))) {
                    if("1".equals(searchValue.get("dayType").toString())) {
                        timeList =  statisticsService.getMannaLineWeekList(startDate,endDate, ordPathCd, brCode, brandTypeCd, ordStatus);
                    } else {
                        timeList =  statisticsService.getMannaLineDayList(startDate,endDate, ordPathCd, brCode, brandTypeCd, ordStatus);
                    }
                } else {
                    timeList =  statisticsService.getMannaLineDayList(startDate,endDate, ordPathCd, brCode, brandTypeCd, ordStatus);
                }

                map.put("timeList" , timeList);
            } else {

                List<Map<String,Object>> timeList = null;
                String ordPathCd = null;
                String brCode = null;
                String ordStatus = null;
                String brandTypeCode = null;
               /* if("jesicar".equals(company)) {
                    ordPathCd = "1063";
                    searchValue.put("ordPathCd","1063");
                } else if ("yangpa".equals(company)) {
                    ordPathCd = "1069";
                    searchValue.put("ordPathCd","1069");
                }*/
                ordPathCd = "1069";
                searchValue.put("ordPathCd","1069");
                LocalDateTime startDate = null;
                LocalDateTime endDate = null;

                searchValue.put("startDate",DateUtil.now_yyyy_mm_dd_month());
                searchValue.put("endDate", DateUtil.now_yyyy_mm_dd_yester());

                String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
                String string1 =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

                startDate = LocalDateTime.parse(string, formatter);
                endDate = LocalDateTime.parse(string1, formatter);
                timeList =  statisticsService.getMannaLineDayList(startDate,endDate, ordPathCd, brCode, brandTypeCode, ordStatus );
                map.put("timeList" , timeList);
            }


        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(map, HttpStatus.OK);
    }
    @ResponseBody
    @PostMapping("/manna/order/main")
    public ResponseEntity<?> mannaOrderMain(@RequestParam("brandTypeCd") Object brandTypeCd, HttpSession session)  {
        Map<String,Object> map = new HashMap<>();
        try {
            List<Map<String,Object>> timeList = null;
            String ordPathCd = jesicaProperties.getOrdPathCd().getPickOrder();
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;
            String brCode =null;
            String ordStatus ="5";

            String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
            String string1 =  DateUtil.now_yyyy_mm_dd()+ " 23:59:59";
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");


            startDate = LocalDateTime.parse(string, formatter);
            endDate = LocalDateTime.parse(string1, formatter);
            if("".equals(brandTypeCd.toString())){
                timeList =  statisticsService.getMannaLineDayList(startDate,endDate, ordPathCd ,brCode, null, ordStatus);
            } else {
                timeList =  statisticsService.getMannaLineDayList(startDate,endDate, ordPathCd ,brCode, brandTypeCd.toString(), ordStatus);
            }

            map.put("timeList" , timeList);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    //쿠폰 등록
    @ResponseBody
    @PostMapping("/coupon/management/insert")
    public ResponseEntity<?> couponInsert(@RequestBody TbCouponData tbCouponData) {
        log.info("tbStoreCategoryData::{}", tbCouponData);

        int result =  apiService.insertTbCoupon(tbCouponData);
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

    //쿠폰 수정
    @ResponseBody
    @PutMapping("/coupon/management/update")
    public ResponseEntity<?> updateTbCoupon(@RequestBody TbCouponData tbCouponData) {
        log.info("tbCouponData::{}", tbCouponData);

        Map<String,Object> map = new HashMap<>();
        try {
            int result = apiService.updateTbCoupon(tbCouponData);

            if(result == 1) {
                map.put("result","200");
                map.put("message", "수정 되었습니다.");
            } else {
                map.put("result","400");
                map.put("message", "수정에 실패하였습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //쿠폰 삭제
    @ResponseBody
    @DeleteMapping("/coupon/management/delete")
    public ResponseEntity<?> deleteTbCoupon(@RequestParam Long couponNo) {
        log.info("couponNo::{}", couponNo);

        Map<String,Object> map = new HashMap<>();
        try {
            int result = apiService.deleteTbCoupon(couponNo);

            if(result == 1) {
                map.put("result","200");
                map.put("message", "삭제 되었습니다.");
            } else {
                map.put("result", "400");
                map.put("message", "삭제에 실패하였습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    //배너 순서변경 리스트
    @ResponseBody
    @GetMapping("/banner/sortList")
    public ResponseEntity<?> getSortList(@RequestParam("serviceType") Integer serviceType, @RequestParam("platformType") Integer platformType) {
        log.info("serviceType::{}", serviceType);
        log.info("platformType::{}", platformType);

        Map<String, Object> map = new HashMap();
        try {
            List<TbAppBannerDTO> listBannerSort = apiService.bannerSortList(serviceType, platformType);

            map.put("listBannerSort", listBannerSort);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @ResponseBody
    @GetMapping("/banner/update/viewOrder")
    public ResponseEntity<?> updateViewOrder(@RequestParam("bannerNos") String bannerNos) {
        log.info("bannerNos::{}", bannerNos);

        Map<String,Object> map = new HashMap<>();
        try {
            int result = apiService.updateViewOrder(bannerNos);

            if(result == 1) {
                map.put("result","200");
                map.put("message", "변경 되었습니다.");
            } else {
                map.put("result","400");
                map.put("message", "변경에 실패하였습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //배너 등록 - 게시글 검색
    @ResponseBody
    @GetMapping("/board/search")
    public ResponseEntity<?> searchBoardList(@RequestParam Integer platformType, @RequestParam Integer boardType, @RequestParam(required = false) Long boardNo, @RequestParam(required = false) String keyword) {
        log.info("platformType::{} ", platformType);
        log.info("boardType::{} ", boardType);
        log.info("boardNo::{} ", boardNo);
        log.info("keyword::{} ", keyword);

        Map<String, Object> map = new HashMap<>();
        List<?> boardList;

        try {
            boardList = apiService.searchBoard(platformType, boardType, boardNo, keyword);
            map.put("boardList", boardList);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    //배너 등록
    @ResponseBody
    @PostMapping("/banner/insert")
    public ResponseEntity<?> insertAppBanner(@RequestPart TbAppBannerData tbAppBannerData
                                             ,@RequestPart List<Map<String,String>> areaList
            ,@RequestPart(value="imgFile", required = false) MultipartFile imgFile) {
        log.info("TbAppBannerData tbAppBannerData::{}", tbAppBannerData);
        log.info("imgFile imgFile::{}", imgFile);

        Map<String,Object> map = new HashMap<>();
        try {
            int result = apiService.insertTbAppBanner(tbAppBannerData, imgFile, areaList);


            if(result == 1) {
                map.put("serviceType",tbAppBannerData.getServiceType());
                map.put("result", "200");
                map.put("message", "등록 되었습니다.");
            } else {
                map.put("result", "400");
                map.put("message", "등록에 실패하였습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    //배너 수정
    @ResponseBody
    @PutMapping("/banner/update")
    public ResponseEntity<?> updateAppBanner(@RequestPart TbAppBannerData tbAppBannerData
            ,@RequestPart(value="imgFile", required = false) MultipartFile imgFile) {
        log.info("tbAppBannerData::{}", tbAppBannerData);
        Map<String,Object> map = new HashMap<>();

        try {
            int result = apiService.updateTbAppBanner(tbAppBannerData, imgFile);

            if(result == 1) {
                map.put("result", "200");
                map.put("message", "수정 되었습니다.");
            } else {
                map.put("result", "400");
                map.put("message", "수정에 실패하였습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    //배너삭제
    @ResponseBody
    @DeleteMapping("/banner/delete")
    public ResponseEntity<?> deleteAppBanner(@RequestParam Long bannerNo) {
        log.info("bannerNo::{}", bannerNo);

        Map<String, Object> map = new HashMap<>();
        try {
            int result = apiService.deleteTbAppBanner(bannerNo);

            if (result == 1) {
                map.put("result", "200");
                map.put("message", "삭제 되었습니다.");
            } else {
                map.put("result", "400");
                map.put("message", "삭제에 실패하였습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    //렌트카 리스트
    @ResponseBody
    @PostMapping("/rentcar/getCarList")
    public ResponseEntity<?> getCarList(@RequestParam("storeNo") String storeNo
                                        ) {
        log.info("storeNo::{}", storeNo);

        Map<String,Object> map = new HashMap<>();
        List<TbStoreRentalCarDTO> resultList = null;
        try {
            resultList = extraLinkService.getCarList(Long.parseLong(storeNo));
            map.put("resultList",resultList);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //고객 비밀번호 변경
    @ResponseBody
    @PutMapping("/user/cust/updatePwd")
    public ResponseEntity<?> updateCustPwd(@RequestBody TbCustData tbCustData) {

        log.info("TbCustData::{}", tbCustData);
        Map<String,Object> map = new HashMap<>();

        try {
            int result = apiService.updateCustPassword(tbCustData);

            if (result == 1) {
                if (result == 1) {
                    map.put("result", "200");
                    map.put("message", "변경 되었습니다.");
                } else {
                    map.put("result", "400");
                    map.put("message", "변경에 실패하였습니다.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    //고객 정보 변경
    @ResponseBody
    @PutMapping("/user/cust/update")
    public ResponseEntity<?> updateCust(@RequestBody TbCustData tbCustData) {

        log.info("tbCustData::{} ", tbCustData);
        Map<String, Object> map = new HashMap<>();

        try {
            int result = apiService.updateCust(tbCustData);

            if (result == 1) {
                map.put("result", "200");
                map.put("message", "변경 되었습니다.");
            } else {
                map.put("result", "400");
                map.put("message", "변경에 실패하였습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    //시스템설정 수정
    @ResponseBody
    @GetMapping("/systemprop/update")
    public ResponseEntity<?> systempropUpdate(
                                            @RequestParam("propName") String propName,
                                            @RequestParam("propValue") String propValue,
                                            @RequestParam("memo") String memo
                                         ) {
        log.info("languageUpdate tslId::{}", propName);
        Map<String,Object> map = new HashMap<>();

        try {
            int result = systemPropService.updateSystemProp(propName ,propValue ,memo );
            map.put("result" , result);

        } catch (Exception e) {
            map.put("result" , 0);
            e.printStackTrace();
            return new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    //총판코드 수정
    @ResponseBody
    @GetMapping("/brcode/update")
    public ResponseEntity<?> brCodeUpdate(
            @RequestParam("brCode") String brCode,
            @RequestParam("brName") String brName,
            @RequestParam("useYn") String useYn,
            @RequestParam("modUserId") String modUserId
    ) {
        log.info("brCode::{}", brCode);
        Map<String,Object> map = new HashMap<>();

        try {
            int result = brCodeService.updateBrCode(brCode ,brName, useYn, modUserId);
            map.put("result" , result);

        } catch (Exception e) {
            map.put("result" , 0);
            e.printStackTrace();
            return new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    //총판코드 삭제
    @ResponseBody
    @GetMapping("/brcode/delete")
    public ResponseEntity<?> brCodeUpdate(
            @RequestParam("brCode") String brCode
    ) {
        log.info("brCode::{}", brCode);
        Map<String,Object> map = new HashMap<>();

        try {
            int result = brCodeService.deleteBrCode(brCode);
            map.put("result" , result);

        } catch (Exception e) {
            map.put("result" , 0);
            e.printStackTrace();
            return new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    //총판코드 수정
    @ResponseBody
    @GetMapping("/brcode/insert")
    public ResponseEntity<?> brCodeInsert(
            @RequestParam("brCode") String brCode,
            @RequestParam("brName") String brName,
            @RequestParam("putUserId") String putUserId
    ) {
        log.info("languageUpdate tslId::{}", brCode);
        Map<String,Object> map = new HashMap<>();
        try {
            int result = brCodeService.insertBrCode(brCode ,brName, putUserId);
            map.put("result" , result);

        } catch (Exception e) {
            map.put("result" , 0);
            e.printStackTrace();
            return new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    /**
     * 샘플파일 다운로드
     */
    @GetMapping("/car/sampleDownload")
    public ResponseEntity<Resource> sampleFileDownload() throws IOException {
        Path sampleFilePath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                jesicaProperties.getSamplePath().getPath(),"sample.xlsx"
        );
        Resource resource = new InputStreamResource(Files.newInputStream(sampleFilePath));
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType("application/octet-stream"))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + "sample.xlsx" + "\"")
                .body(resource);
    }

    /**
     * 샘플파일 다운로드 -> 관리자 자료상세파일 다운로드로 변경 10.28
     */
    @GetMapping("/file/download")
    public void fileDownload(
            HttpServletResponse response,
            @RequestParam("filePath") String filePath,
            @RequestParam("fileName") String fileName,
            @RequestParam("contentType") String contentType,
            @RequestParam("fileOriginName") String fileOriginName
    ) throws IOException {

        //Path path = Paths.get(jesicaProperties.getBaseImgPath().getPath(), URLDecoder.decode(filePath,"UTF-8"));
        Path path = Paths.get(URLDecoder.decode(filePath,"UTF-8"),fileName);
        File file = new File(path.toString());
        long fileLength = file.length();
        //파일의 크기와 같지 않을 경우 프로그램이 멈추지 않고 계속 실행되거나, 잘못된 정보가 다운로드 될 수 있다.

        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileOriginName + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Content-Type", contentType);
        response.setHeader("Content-Length", "" + fileLength);
        response.setHeader("Pragma", "no-cache;");
        response.setHeader("Expires", "-1;");

        try(
                FileInputStream fis = new FileInputStream(file);
                OutputStream out = response.getOutputStream();
        ){
            int readCount = 0;
            byte[] buffer = new byte[1024];
            while((readCount = fis.read(buffer)) != -1){
                out.write(buffer,0,readCount);
            }
        }catch(Exception ex){
            ex.printStackTrace();
            throw new RuntimeException("file Save Error");
        }
    }

    //사용자 update
    @ResponseBody
    @PostMapping(value="/userStaff/passUp/action" , consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<?> userStaffUpdateActionUseUser(
            @RequestPart(value="tbUserStaffData" ,required = true) TbUserStaffData tbUserStaffData
    ) {
        log.info("tbUserStaffData ::{}", tbUserStaffData);

        int result =  apiService.updateTbUserStaffUseUser(tbUserStaffData);

        //LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        //String ip = GetClientIp.getClientIP(request);
        Map<String,Object> map = new HashMap<>();
        if(result > 0 ) {
            //log.info("Update_role :adminId = {} / userId =  {} / ip = {} / type = {}" , loginSession.getUserLoginId(), tbUserStaffData.getUserId() , ip , "update");
            map.put("result","200");
            map.put("message", "수정 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "수정에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }


    // 메뉴 권한 insert
    @ResponseBody
    @PostMapping("/system/menu/insert")
    public ResponseEntity<?> menuInsert(
            @RequestParam("menuNo") String menuNo,
            @RequestParam("userNo") String userNo
    ) {
        log.info("menuNo::{}", menuNo);
        Map<String,Object> map = new HashMap<>();
        int result = apiService.systemMenuInsert(Long.parseLong(menuNo),Long.parseLong(userNo));
        if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    // 메뉴 권한 insert
    /*@ResponseBody
    @PostMapping("/system/menu/insert/multi")
    public ResponseEntity<?> menuInsertMulti(
            @RequestParam("menuNo") String menuNo,
            @RequestParam("userNo") String userNo
    ) {
        log.info("menuNo::{}", menuNo);
        Map<String,Object> map = new HashMap<>();
        int result = apiService.systemMenuInsert(Long.parseLong(menuNo),Long.parseLong(userNo));
        if(result > 0) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }*/

    // 메뉴 권한 delete
    @ResponseBody
    @PostMapping("/system/menu/delete")
    public ResponseEntity<?> menuDelete(
            @RequestParam("menuNo") String menuNo,
            @RequestParam("userNo") String userNo
    ) {
        log.info("menuNo::{}", menuNo);
        Map<String,Object> map = new HashMap<>();
        int result = apiService.systemMenuDelete(Long.parseLong(menuNo),Long.parseLong(userNo));
        if(result > 0) {
            map.put("result","200");
            map.put("message", "삭제 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "삭제에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    // 다운로드 권한 체크
    @ResponseBody
    @PostMapping("/system/menu/update")
    public ResponseEntity<?> menuDownChk(
            @RequestBody List<HashMap<String,Object>> menuPermissionList
    ) {
        int result = apiService.updateAclMulTi(menuPermissionList);
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


    //안심번호 리스트
    @ResponseBody
    @PostMapping("/search/safenNum/list")
    public ResponseEntity<?> searchSafenNumList(@RequestBody Map<String,Object> searchValue) {
        log.info("TbStore searchValue::{}", searchValue);
        Map<String,Object> map = new HashMap<>();
        try {
            if ((String)searchValue.get("keyword") != null){
                if ((String)searchValue.get("keyword") != ""){
                    List<TbSafenMapping> tbSafenMapping = driverApplyService.getTbSafenMappingList("%"+(String)searchValue.get("keyword")+"%");
                    map.put("tbSafenMapping", tbSafenMapping);
                }else {
                    List<TbSafenMapping> tbSafenMapping = driverApplyService.getTbSafenMappingListAll();
                    map.put("tbSafenMapping", tbSafenMapping);
                }
            }
            //안심번호 리스트(매칭안된것들)

        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }


    //안심번호 재할당
    @ResponseBody
    @PostMapping("/car/safenNum/asssignment")
    public ResponseEntity<?> searchSafenNumAsssignment(@RequestBody Map<String,Object> searchValue) {
        log.info("TbStore searchValue::{}", searchValue);
        Map<String,Object> map = new HashMap<>();
            if ((String)searchValue.get("safenNumNew") != null){
                if ((String)searchValue.get("safenNumNew") != ""){
                    driverApplyService.getTbSafenMappingAsssignment((String)searchValue.get("safenNumNew"),Integer.parseInt((String)searchValue.get("rentalCarNoNew")));
                    map.put("result",200);
                    map.put("safenNumNew",(String)searchValue.get("safenNumNew"));
                }else
                    map.put("result",0000);
            }
            //안심번호 리스트(매칭안된것들)

        return new ResponseEntity<>(map,HttpStatus.OK);
    }


    // 맛집주문내역 페이징
    @ResponseBody
    @RequestMapping(value = {"/order/list"})
    public DataTableModel list(HttpServletRequest request, DataTableDTO paging,
                               @RequestParam Map<String,Object> searchValue){
        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        String appCode = loginSession.getAppCode();


        paging.setStart(Integer.parseInt(searchValue.get("start").toString()));
        paging.setLength(Integer.parseInt(searchValue.get("length").toString()));


        int page = paging.getStart() / paging.getLength(); //Calculate page number
        Map<String ,Object> map =  new HashMap<>();
        // paging 객체 Set

        Pageable pageable;
        pageable = PageRequest.of(
                page,
                paging.getLength(),
                Sort.by("ordDate").descending()
        ) ;
      /*  if(!"".equals(appCode)){
            searchValue.put("appCode",appCode);
        } else {
            searchValue.put("codeValue","";
        }*/

        Map<String, Object> resultMap =  mannaService.tbCallAllList(searchValue,pageable);
        List<TbMannaOrder> list = (List<TbMannaOrder>) resultMap.get("orderlist");
        for(int i = 0 ; i < list.size() ; i++) {
            TbCust tbCust = list.get(i).getTbCust();
            if(tbCust != null) {
                if(tbCust.getExtBrCode() != null){
                    list.get(i).setExtBrCode(list.get(i).getTbCust().getExtBrCode());
                }
                if(tbCust.getExtMasterStCode() != null){
                    list.get(i).setExtMasterStCode(list.get(i).getTbCust().getExtMasterStCode());
                }
                if(tbCust.getExtRecommStCode() != null){
                    list.get(i).setExtRecommStCode(list.get(i).getTbCust().getExtRecommStCode());
                }
            }
        }

        // 응답값 Set
        return DataTableModel.builder()
                .recordsTotal(Integer.parseInt(resultMap.get("totalElement").toString()))
                .data(list)
                .build();
    }

    @ResponseBody
    @PostMapping("/membership/coupon/publish/list")
    public DataTableModel getCouponPublishList(HttpServletRequest request, DataTableDTO paging,
                                                @RequestParam Map<String,Object> searchValue){

        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        String company = loginSession.getCompany();

        paging.setStart(Integer.parseInt(searchValue.get("start").toString()));
        paging.setLength(Integer.parseInt(searchValue.get("length").toString()));
        int page = paging.getStart() / paging.getLength(); //Calculate page number

        Map<String, Object> resultMap = null;

        Pageable pageable;
        pageable = PageRequest.of(
                page,
                paging.getLength(),
                Sort.by("insertDate").descending()
        ) ;
        try {
            getSearchOption(session);
            if("jesicar".equals(company)) {
                searchValue.put("platformType","1");
            } else if ("yangpa".equals(company)) {
                searchValue.put("platformType","2");
            }
            resultMap = mannaService.getCouponPublishList(searchValue, pageable);

        } catch (Exception e) {
            e.printStackTrace();
        }
        List<TbMannaCouponPublish> list = (List<TbMannaCouponPublish>) resultMap.get("couponPublishList");
        // paging 객체 Set


        // 응답값 Set
        return DataTableModel.builder()
                .recordsTotal(Integer.parseInt(resultMap.get("totalElement").toString()))
                .data(list)
                .build();
    }

    @ResponseBody
    @PostMapping("/membership/coupon/regist/list")
    public DataTableModel getCouponRegistList(HttpServletRequest request, DataTableDTO paging,
                                               @RequestParam Map<String,Object> searchValue){

        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        String company = loginSession.getCompany();

        paging.setStart(Integer.parseInt(searchValue.get("start").toString()));
        paging.setLength(Integer.parseInt(searchValue.get("length").toString()));
        int page = paging.getStart() / paging.getLength(); //Calculate page number

        Map<String, Object> resultMap = null;

        Pageable pageable;
        pageable = PageRequest.of(
                page,
                paging.getLength(),
                Sort.by("regDate").descending()
        ) ;
        try {
            getSearchOption(session);
            if("jesicar".equals(company)) {
                searchValue.put("platformType","1");
            } else if ("yangpa".equals(company)) {
                searchValue.put("platformType","2");
            }
            resultMap = mannaService.getCouponRegistList(searchValue, pageable);

        } catch (Exception e) {
            e.printStackTrace();
        }
        List<TbMannaCouponRegist> list = (List<TbMannaCouponRegist>) resultMap.get("couponRegistList");
        // paging 객체 Set


        // 응답값 Set
        return DataTableModel.builder()
                .recordsTotal(Integer.parseInt(resultMap.get("totalElement").toString()))
                .data(list)
                .build();
    }

    @ResponseBody
    @PostMapping("/system/master/list")
    public DataTableModel systemMasterList(HttpServletRequest request, DataTableDTO paging,
                                              @RequestParam Map<String,Object> searchValue){

        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        String company = loginSession.getCompany();


        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        Map<String, Object> resultMap = null;

        if (searchValue.get("startDate") != null) {
            String string = searchValue.get("startDate").toString() + " 00:00:00";
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            startDate = LocalDateTime.parse(string, formatter);
        } else {
            String string = "2020-01-01" + " 00:00:00";
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            startDate = LocalDateTime.parse(string, formatter);
        }
        if (searchValue.get("endDate") != null) {
            String string = searchValue.get("endDate").toString() + " 23:59:59";
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            endDate = LocalDateTime.parse(string, formatter);
        } else {
            String string =  DateUtil.now_yyyy_mm_dd()+ " 23:59:59";
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            endDate = LocalDateTime.parse(string, formatter);
        }

        paging.setStart(Integer.parseInt(searchValue.get("start").toString()));
        paging.setLength(Integer.parseInt(searchValue.get("length").toString()));
        int page = paging.getStart() / paging.getLength(); //Calculate page number

        Object dataStatus = null;
        Object name = null;
        Object appCode = null;
        if (!searchValue.isEmpty() && searchValue != null){

            if(searchValue.get("dataStatus") != null && searchValue.get("dataStatus") != null){
                if(searchValue.get("dataStatus") != ""){
                    dataStatus = searchValue.get("dataStatus");
                }
            }
            if(searchValue.get("name") != null && searchValue.get("name") != null){
                if(searchValue.get("name") != ""){
                    name = searchValue.get("name");
                }
            }
            if(searchValue.get("appCode") != null && searchValue.get("appCode") != null){
                if(searchValue.get("appCode") != ""){
                    appCode = searchValue.get("appCode");
                }
            }
        } else {
            searchValue.put("startDate", "2020-01-01");
            searchValue.put("endDate", DateUtil.now_yyyy_mm_dd());
        }


        Pageable pageable;
        pageable = PageRequest.of(
                page,
                paging.getLength(),
                Sort.by("insertDate").descending()
        ) ;
        try {
            getSearchOption(session);
            if("jesicar".equals(company)) {
                searchValue.put("platformType","1");
            } else if ("yangpa".equals(company)) {
                searchValue.put("platformType","2");
            }
            resultMap = masterService.getUserDataStatusPageList(name,dataStatus,appCode,startDate,endDate, pageable);

        } catch (Exception e) {
            e.printStackTrace();
        }
        List<TbUserStaffDTO> list = (List<TbUserStaffDTO>) resultMap.get("tbUserStaffList");
        System.out.println(list);
        List<TbSystemCode> appVersionList = apiService.systemCodeList("AC");
        /*for(int i = 0 ; i < list.size() ; i ++) {
            for(TbSystemCode code : appVersionList) {
                if(ObjectUtils.isNotEmpty(list.get(i).getAppCode())){
                    if(list.get(i).getAppCode().equals(code.getSysCode())) {
                        list.get(i).setAppName(code.getCodeName());
                    }
                }
            }
        }*/
        // paging 객체 Set


        // 응답값 Set
        return DataTableModel.builder()
                .recordsTotal(Integer.parseInt(resultMap.get("totalElement").toString()))
                .data(list)
                .build();
    }


    // 쿠폰정보 수정
    @ResponseBody
    @PostMapping("/membership/coupon/update")
    public ResponseEntity<?> membershipCouponUpdate(
            @RequestParam Map<String, String> searchValue
    ) {
        Map<String,Object> map = new HashMap<>();
        try {
            apiService.membershipCouponUpdate(searchValue);
            map.put("resultCode",200);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("resultCode",400);
        }

        return new ResponseEntity<>(map,HttpStatus.OK);
    }
    // 고객리스트 (페이징 x)
    @ResponseBody
    @PostMapping("/cust/all")
    public ResponseEntity<?> custAll(
            @RequestParam Map<String, Object> searchValue
    ) {
        Map<String,Object> map = new HashMap<>();
        List<TbCust> resultList = null;
        try {
            resultList = boardService.getCustAll(searchValue);
            map.put("resultList",resultList);
            map.put("resultCode",200);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    @ResponseBody
    @PostMapping("/cust/list/pop")
    public DataTableModel2 getCustListPop(HttpServletRequest request, DataTableDTO paging,
                                          @RequestParam Map<String,Object> searchValue){

        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        String company = loginSession.getCompany();

        paging.setStart(Integer.parseInt(searchValue.get("start").toString()));
        paging.setLength(Integer.parseInt(searchValue.get("length").toString()));
        int page = paging.getStart() / paging.getLength(); //Calculate page number

        Map<String, Object> resultMap = null;

        Pageable pageable;
        pageable = PageRequest.of(
                page,
                paging.getLength(),
                Sort.by("insertDate").descending()
        ) ;
        try {
            getSearchOption(session);
            if("jesicar".equals(company)) {
                searchValue.put("platformType","1");
            } else if ("yangpa".equals(company)) {
                searchValue.put("platformType","2");
            }
            resultMap = boardService.getCustListPop(searchValue, pageable);

        } catch (Exception e) {
            e.printStackTrace();
        }
        List<TbCust> list = (List<TbCust>) resultMap.get("custList");
        // paging 객체 Set

        List<TbSystemCode> A1List = apiService.systemCodeList("A1");
        List<TbSystemCode> A2List = apiService.systemCodeList("A2");

        // 응답값 Set
        return DataTableModel2.builder()
                .recordsTotal(Integer.parseInt(resultMap.get("totalElement").toString()))
                .data(list)
                .a1(A1List)
                .a2(A2List)
                .build();
    }



    // 고객리스트 페이징
    @ResponseBody
    @RequestMapping(value = {"/cust/list"})
    public DataTableModel2 custList(HttpServletRequest request, DataTableDTO paging,
                               @RequestParam Map<String,Object> searchValue){

        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        String company = loginSession.getCompany();
        String appCode = loginSession.getAppCode();

      /*  if(!"".equals(appCode)){
            searchValue.put("appCode",appCode);
        } else {
            searchValue.put("appCode","");
        }*/
        paging.setStart(Integer.parseInt(searchValue.get("start").toString()));
        paging.setLength(Integer.parseInt(searchValue.get("length").toString()));
        int page = paging.getStart() / paging.getLength(); //Calculate page number

        Map<String, Object> resultMap = null;

        Pageable pageable;
        pageable = PageRequest.of(
                page,
                paging.getLength(),
                Sort.by("insertDate").descending()
        ) ;
        try {
            getSearchOption(session);
            if("jesicar".equals(company)) {
                searchValue.put("platformType","1");
            } else if ("yangpa".equals(company)) {
                searchValue.put("platformType","2");
            }
            resultMap = boardService.getCustList(searchValue, pageable);

        } catch (Exception e) {
            e.printStackTrace();
        }
        List<TbCust> list = (List<TbCust>) resultMap.get("custList");
        List<TbSystemCode> appVersionList = apiService.systemCodeList("AC");
        for(int i = 0 ; i < list.size() ; i ++) {
            for(TbSystemCode code : appVersionList) {
                if(ObjectUtils.isNotEmpty(list.get(i).getAppCode())){
                    if(list.get(i).getAppCode().equals(code.getSysCode())) {
                        list.get(i).setAppName(code.getCodeName());
                    }
                }
            }
        }
        // paging 객체 Set

        List<TbSystemCode> A1List = apiService.systemCodeList("A1");
        List<TbSystemCode> A2List = apiService.systemCodeList("A2");

        // 응답값 Set
        return DataTableModel2.builder()
                .recordsTotal(Integer.parseInt(resultMap.get("totalElement").toString()))
                .data(list)
                .a1(A1List)
                .a2(A2List)
                .build();
    }


    // 플랫폼 공지
    @ResponseBody
    @RequestMapping(value = {"/platform/list"})
    public DataTableModel platformList(HttpServletRequest request, DataTableDTO paging,
                                    @RequestParam Map<String,Object> searchValue){


        paging.setStart(Integer.parseInt(searchValue.get("start").toString()));
        paging.setLength(Integer.parseInt(searchValue.get("length").toString()));
        int page = paging.getStart() / paging.getLength(); //Calculate page number

        Map<String, Object> resultMap = null;

        Pageable pageable;
        pageable = PageRequest.of(
                page,
                paging.getLength(),
                Sort.by("insertDate").descending()
        ) ;
        try {
            getSearchOption(session);
            Map<String,Object> map = permission(session,"board/platform");

            searchValue.put("platformType",map.get("platformType"));
         /*   searchValue.put("appCode",map.get("appCode"));*/
            resultMap = boardService.tbNoticePlatFormSearch(searchValue, pageable);

        } catch (Exception e) {
            e.printStackTrace();
        }
        List<TbNoticePlatform> list = (List<TbNoticePlatform>) resultMap.get("platformList");
        List<TbSystemCode> appVersionList = apiService.systemCodeList("AC");
        for(int i = 0 ; i < list.size() ; i ++) {
            for(TbSystemCode code : appVersionList) {
                if(ObjectUtils.isNotEmpty(list.get(i).getAppCode())){
                    if(list.get(i).getAppCode().equals(code.getSysCode())) {
                        list.get(i).setAppName(code.getCodeName());
                    }
                }
            }
        }



        // paging 객체 Set

        // 응답값 Set
        return DataTableModel.builder()
                .recordsTotal(Integer.parseInt(resultMap.get("totalElement").toString()))
                .data(list)
                .build();
    }

    // 이벤트 공지
    @ResponseBody
    @RequestMapping(value = {"/event/list"})
    public DataTableModel eventList(HttpServletRequest request, DataTableDTO paging,
                                       @RequestParam Map<String,Object> searchValue){


        paging.setStart(Integer.parseInt(searchValue.get("start").toString()));
        paging.setLength(Integer.parseInt(searchValue.get("length").toString()));
        int page = paging.getStart() / paging.getLength(); //Calculate page number

        Map<String, Object> resultMap = null;

        Pageable pageable;
        pageable = PageRequest.of(
                page,
                paging.getLength(),
                Sort.by("insertDate").descending()
        ) ;
        try {
            getSearchOption(session);
            Map<String,Object> map = permission(session,"board/event");

            searchValue.put("platformType",map.get("platformType"));
            resultMap = boardService.tbEventSearch(searchValue, pageable);

        } catch (Exception e) {
            e.printStackTrace();
        }
        List<TbEvent> list = (List<TbEvent>) resultMap.get("eventList");
        // paging 객체 Set
        List<TbSystemCode> appVersionList = apiService.systemCodeList("AC");
        for(int i = 0 ; i < list.size() ; i ++) {
            for(TbSystemCode code : appVersionList) {
                if(ObjectUtils.isNotEmpty(list.get(i).getAppCode())){
                    if(list.get(i).getAppCode().equals(code.getSysCode())) {
                        list.get(i).setAppName(code.getCodeName());
                    }
                }
            }
        }
        // 응답값 Set
        return DataTableModel.builder()
                .recordsTotal(Integer.parseInt(resultMap.get("totalElement").toString()))
                .data(list)
                .build();
    }

    // 자료실 - 관리자 자료
    @ResponseBody
    @RequestMapping(value = {"/library/file/list"})
    public DataTableModel fileList(HttpServletRequest request, DataTableDTO paging,
                               @RequestParam Map<String,Object> searchValue){

        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        String company = loginSession.getCompany();
        String appCode = loginSession.getAppCode();

        if(!"".equals(appCode)){
            searchValue.put("appCode",appCode);
        } else {
            searchValue.put("appCode","");
        }
        paging.setStart(Integer.parseInt(searchValue.get("start").toString()));
        paging.setLength(Integer.parseInt(searchValue.get("length").toString()));
        int page = paging.getStart() / paging.getLength(); //Calculate page number

        Map<String, Object> resultMap = null;

        Pageable pageable;
        pageable = PageRequest.of(
                page,
                paging.getLength(),
                Sort.by("insertDate").descending()
        ) ;
        try {
            getSearchOption(session);
            if("jesicar".equals(company)) {
                searchValue.put("platformType","1");
            } else if ("yangpa".equals(company)) {
                searchValue.put("platformType","2");
            }
            resultMap =  libraryService.getLibraryList(searchValue, pageable);

        } catch (Exception e) {
            e.printStackTrace();
        }
        List<TbLibrary> list = (List<TbLibrary>) resultMap.get("libraryList");
        // paging 객체 Set


        // 응답값 Set
        return DataTableModel.builder()
                .recordsTotal(Integer.parseInt(resultMap.get("totalElement").toString()))
                .data(list)
                .build();
    }


    @ResponseBody
    @PostMapping("/library/file/insert")
    public ResponseEntity<?> libraryFileInsert(
             @RequestPart(value="libraryInfo" ,required = false) TbLibrary libraryInfo
            ,@RequestPart(value="attachFile" ,required = false) MultipartFile[] attachFile) {
        log.info("libraryInfo::{}", libraryInfo);
        log.info("attachFile::{}", attachFile);
        Map<String,Object> map = new HashMap<>();
        TbLibrary library = apiService.insertLibraryFile(libraryInfo,attachFile);

        if(ObjectUtils.isNotEmpty(library)) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    // 맛집주문내역 페이징
    @ResponseBody
    @RequestMapping(value = {"/eventpush/list"})
    public DataTableModel pushList(HttpServletRequest request, DataTableDTO paging,
                               @RequestParam Map<String,Object> searchValue){

        paging.setStart(Integer.parseInt(searchValue.get("start").toString()));
        paging.setLength(Integer.parseInt(searchValue.get("length").toString()));


        int page = paging.getStart() / paging.getLength(); //Calculate page number
        Map<String ,Object> map =  new HashMap<>();
        // paging 객체 Set

        Pageable pageable;
        pageable = PageRequest.of(
                page,
                paging.getLength(),
                Sort.by("insertDate").descending()
        ) ;

        Map<String, Object> resultMap =  mannaService.tbMannaEventPushSearch(searchValue,pageable);
        List<TbMannaEventPush> list = (List<TbMannaEventPush>) resultMap.get("eventPushList");
        List<TbSystemCode> appVersionList = apiService.systemCodeList("AC");
        for(int i = 0 ; i < list.size() ; i ++) {
            for(TbSystemCode code : appVersionList) {
                if(ObjectUtils.isNotEmpty(list.get(i).getBrandTypeCd())){
                    if(list.get(i).getBrandTypeCd().equals(code.getCodeValue())) {
                        list.get(i).setAppName(code.getCodeName());
                    }
                }
            }
        }

        // 응답값 Set
        return DataTableModel.builder()
                .recordsTotal(Integer.parseInt(resultMap.get("totalElement").toString()))
                .data(list)
                .build();
    }

    // 맛집주문내역 페이징
    /*@ResponseBody
    @RequestMapping(value = {"/eventpust/log/list"})
    public DataTableModel pushLogList(HttpServletRequest request, DataTableDTO paging,
                                       @RequestParam Map<String,Object> searchValue){

        paging.setStart(Integer.parseInt(searchValue.get("start").toString()));
        paging.setLength(Integer.parseInt(searchValue.get("length").toString()));


        int page = paging.getStart() / paging.getLength(); //Calculate page number
        Map<String ,Object> map =  new HashMap<>();
        // paging 객체 Set

        Pageable pageable;
        pageable = PageRequest.of(
                page,
                paging.getLength(),
                Sort.by("openDate").descending()
        ) ;

        Map<String, Object> resultMap =  mannaService.tbMannaEventPushSearch(searchValue,pageable);
        List<TbMannaEventPush> list = (List<TbMannaEventPush>) resultMap.get("eventPushLogList");

        // 응답값 Set
        return DataTableModel.builder()
                .recordsTotal(Integer.parseInt(resultMap.get("totalElement").toString()))
                .data(list)
                .build();
    }*/


    @ResponseBody
    @PostMapping("/coupon/give")
    public ResponseEntity<?> couponGive(
            @RequestParam Map<String,Object> searchValue,
            @RequestParam(value = "cpnNo") String cpnNo,
            @RequestParam(value = "ordPathCd") String ordPathCd,
            @RequestParam(value = "extCustNo") BigDecimal[] extCustNo,
            @RequestParam(value = "cpnReason") String cpnReason,
            HttpSession session)
    {

        ResponseEntity<Map> tokenMap = restTemplateUtil.getCouponAddApi(Integer.parseInt(cpnNo),ordPathCd,extCustNo,cpnReason);
        Map<String, Object> codeMap2 = (Map) tokenMap.getBody();//아이디가 있으면 update*/

        return new ResponseEntity<>(codeMap2,HttpStatus.OK);
    }
    @ResponseBody
    @PostMapping("/send/message")
    public ResponseEntity<?> sendMessage(
            @RequestParam(value = "custList") BigDecimal[] custList,
            @RequestParam(value = "couponText") String couponText,
            @RequestParam(value = "pushTitle") String pushTitle,
            @RequestParam(value = "pushContents") String pushContents

    ) {
        Map<String,String> map = new HashMap<>();
        try {
            this.rabbitMqService.sendMessage(custList, couponText, pushTitle, pushContents, 5);
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
            return new ResponseEntity<>(map,HttpStatus.OK);
        } catch (Exception e){
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
            return new ResponseEntity<>(map,HttpStatus.OK);
        }
    }

    @ResponseBody
    @PostMapping("/send/message/type")
    public ResponseEntity<?> sendEventMessage(
           /* @RequestParam(value = "custList") BigDecimal[] custList,*/
            @RequestParam(value = "pushTitle") String pushTitle,
            @RequestParam(value = "pushContents") String pushContents,
            @RequestParam(value = "appCode") String appCode,
            @RequestParam(value = "type") Integer type
    ) {
        Map<String,String> map = new HashMap<>();
        try {

            List<Map<String,Object>> custNoList =  apiService.getAppCodeCustList(appCode);
            BigDecimal[] custList = new BigDecimal[custNoList.size()];
            for(int i = 0; i < custNoList.size(); i++){
                custList[i].add(new BigDecimal(custNoList.get(i).get("custNo").toString()));
            }
            this.rabbitMqService.sendMessage(custList, "", pushTitle, pushContents, type);
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
            return new ResponseEntity<>(map,HttpStatus.OK);
        } catch (Exception e){
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
            return new ResponseEntity<>(map,HttpStatus.OK);
        }
    }

    @ResponseBody
    @PostMapping("/manna/coupon/save")
    public ResponseEntity<?> mannaCouponSave(
            @RequestBody TbMannaCoupon tbMannaCoupon
    ) {
        log.info("cpnNo::{}", tbMannaCoupon.getCpnNo());

   /*     String dateFormat = tbMannaCoupon.getPeriodE().format(DateTimeFormatter.ofPattern("yyyy-MM-dd 23:59:59"));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd 23:59:59");
        LocalDateTime date = LocalDateTime.parse(dateFormat, formatter);*/

     /*   tbMannaCoupon.setPeriodE(dateFormat);*/

        TbMannaCoupon result =  mannaService.saveMannaCoupon(tbMannaCoupon);
        Map<String,Object> map = new HashMap<>();

        if(result.getCpnNo() != null) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    /**
     * 쿠폰 regist 상세 (사용X)
     */
    @ResponseBody
    @PostMapping("membership/couponregist/info")
    public ResponseEntity<?> membershipCouponInfo(@RequestParam("publishNo") String publishNo) {
        log.info("publishNo:: ''", publishNo);

        Map map = new HashMap();

        try {
            TbMannaCouponRegist mannaCouponRegist =  apiService.getMembershipCouponInfo(Long.parseLong(publishNo));
            map.put("mannaCouponRegist", mannaCouponRegist);
            map.put("resultCode", 200);
        } catch (Exception e) {
            map.put("resultCode", 400);
            e.printStackTrace();
        }
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @ResponseBody
    @PostMapping("/manna/couponpublish/save")
    public ResponseEntity<?> mannaCouponPublishSave(
           @RequestParam(value="publishCount") String publishCount,
           @RequestParam(value="cpnNo") Long cpnNo,
           HttpSession session
    ) {
        log.info("cpnNo::{}", cpnNo);

        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");

        int result =  mannaService.saveMannaCouponPublish(
                cpnNo,loginSession.getUserLoginId(),Integer.parseInt(publishCount));
        Map<String,Object> map = new HashMap<>();

        if(result == Integer.parseInt(publishCount)) {
            map.put("result","200");
            map.put("message", "등록 되었습니다.");
        } else {
            map.put("result","400");
            map.put("message", "등록에 실패하였습니다.");
        }
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

    @ResponseBody
    @PostMapping("/coupon/cust/concunosearch")
    public ResponseEntity<?> concunosearch(
            @RequestParam(value="conCuNoList") String[] resultList
    ) {
        List<Map<String,Object>> custList =  mannaService.getCustList(resultList);
        Map<String,Object> map = new HashMap<>();
        map.put("custList", custList);
        return new ResponseEntity<>(map,HttpStatus.OK);
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

    private void putSearchOption(HttpSession session, Map<String,Object> searchValue) {
        session.setAttribute("headNo", searchValue.get("headNo"));
        session.setAttribute("headNoText", searchValue.get("headNoText"));
        session.setAttribute("branchNo", searchValue.get("branchNo"));
        session.setAttribute("branchNoText", searchValue.get("branchNoText"));
        session.setAttribute("storeNo", searchValue.get("storeNo"));
        session.setAttribute("storeNoText", searchValue.get("storeNoText"));
    }

    private Map<String,Object> getSearchOption(HttpSession session) {
        Map<String,Object> searchValue = new HashMap<>();
        if (session == null) return searchValue;

        String headNo = (String) session.getAttribute("headNo");
        if (headNo != null) {
            String headNoText = (String) session.getAttribute("headNoText");
            String branchNo = (String) session.getAttribute("branchNo");
            String branchNoText = (String) session.getAttribute("branchNoText");
            String storeNo = (String) session.getAttribute("storeNo");
            String storeNoText = (String) session.getAttribute("storeNoText");

            searchValue.put("headNo", headNo);
            searchValue.put("headNoText", headNoText);
            searchValue.put("branchNo", branchNo);
            searchValue.put("branchNoText", branchNoText);
            searchValue.put("storeNo", storeNo);
            searchValue.put("storeNoText", storeNoText);
            searchValue.put("dataStatus", null);
        }

        return searchValue;
    }

    private Map<String,Object> permission(HttpSession session, String menuPath) {
        HashMap<String ,Object> map = new HashMap<>();
        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        int staffNo = loginSession.getUserStaffNo();
        Long nLong = new Long(staffNo);
        String company = loginSession.getCompany();
        String appCode = loginSession.getAppCode();

        Optional<TbSiteMenu> siteMenu = authService.getTbSiteMenu(menuPath);
        TbSiteAcl permission = null;

        if("jesicar".equals(company)) {
            map.put("platformType","1");
        } else if ("yangpa".equals(company)) {
            map.put("platformType","2");
        }

        /* 사이트 메뉴 정보가 없으면 */
        if(siteMenu.isPresent()) {
            /* 권한이 존재하지 않는경우 */
            if(!ObjectUtils.isEmpty(loginSession.getRoleType())){
                /* 권한이 마스터 :0 인경우*/
                if(loginSession.getRoleType() == 0){
                    map.put("downloadAble",1);
                    map.put("permission",2);
                }else {
                    permission = authService.getTbSiteAcl(nLong,siteMenu.get().getMenuNo());
                    map.put("downloadAble",permission.getDownloadAble());
                    if(!ObjectUtils.isEmpty(permission)){
                        map.put("permission",permission.getPermission());
                    } else {
                        map.put("permission",0);
                    }
                }
            }
        } else {
            map.put("downloadAble",0);
            map.put("permission",0);
        }

        if(!ObjectUtils.isEmpty(appCode)){
            map.put("appCode",appCode);
        } else {
            map.put("appCode","");
        }

        map.put("company",company);
        return map;
    }
}


