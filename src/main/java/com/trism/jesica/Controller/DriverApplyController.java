package com.trism.jesica.Controller;

import com.trism.jesica.Service.ApiService;
import com.trism.jesica.Service.WorkGroupService;
import com.trism.jesica.Service.WorkerApplyService;
import com.trism.jesica.Util.Secure.CipherAESUtils;
import com.trism.jesica.config.KeyGeneratorConfig;
import com.trism.jesica.persistence.Entitiy.business.TbUserWorker;
import com.trism.jesica.persistence.Entitiy.system.TbSystemCode;
import com.trism.jesica.persistence.Entitiy.worker.TbWorkerApply;
import com.trism.jesica.persistence.Entitiy.worker.TbWorkerCharge;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.*;

/*import com.trism.manna.dto.TbHeadDTO;*/

@RequestMapping("/driver")
@RestController
@RequiredArgsConstructor
@Slf4j
public class DriverApplyController {

    private final LocaleResolver localeResolver;

    private final MessageSource messageSource;

    private final WorkerApplyService workerApplyService;

    private final WorkGroupService workGroupService;

    private final ApiService apiService;


    @Autowired
    private final KeyGeneratorConfig keyGeneratorConfig;

    /**
     * 기사가입신청내역 리스트
     */
    @GetMapping("/apply/list")
    public ModelAndView listAffiliated(Locale locale, HttpServletRequest request,HttpSession session,
                                       @RequestParam Map<String,Object> searchValue,
                                       Model model) {
        log.info("@@searchValue {}",searchValue);
        try {
            if (!searchValue.isEmpty()) {

                    putSearchOption(session, searchValue);


             /*   if(searchValue.get("endDate") == null && searchValue.get("startDate") == null) {
                    Calendar c1 = new GregorianCalendar();
                    c1.add(Calendar.DATE, -1); // 오늘날짜로부터 -1
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 포맷
                    String yesterday = sdf.format(c1.getTime()); // String으로 저장

                    searchValue.put("endDate",yesterday);
                    searchValue.put("startDate",yesterday);
                }*/
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
                model.addAttribute("workList", tbWorkerApplyListNew);
            } else {
                searchValue = getSearchOption(session);
                model.addAttribute("workList", null);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("searchValue",searchValue);


        return new ModelAndView("jesica/driver/apply/list");
    }

    /**
     * 기사가입신청내역 추가
     */
    @GetMapping("/apply/insert")
    public ModelAndView insertAffiliated(Model model) {
        try {

            //브랜드 리스트 조회

        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/driver/apply/insert");
    }


    /**
     * 기사가입신청내역 상세
     */
    @GetMapping("/apply/detail")
    public ModelAndView detailAffiliated(@RequestParam Long headNo, Model model) {
        log.info("@@headNo {}",headNo);

        try {
            //본사 정보상세

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("MethodArgumentTypeMismatchException");
        }

        return new ModelAndView("jesica/driver/apply/detail");
    }


    /**
     * 배송원목록
     */
    @GetMapping("/deliveryman/list")
    public ModelAndView listDeliveryMan(@RequestParam Map<String,Object> searchValue,
                                        HttpSession session, Model model) {

        try {
            if (!searchValue.isEmpty()) {

                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
            }

            if (!searchValue.isEmpty()){
                model.addAttribute("tbUserWork", workGroupService.tbUserWorkSerch(searchValue));
            } else {
                model.addAttribute("tbUserWork", null);
            }

      /*      List<TbDelivery> resultList = null;
            model.addAttribute("tbUserWork", workGroupService.tbUserWorkSerch(searchValue));*/
        /*    resultList =  workGroupService.getTbDeliveryList(searchValue);
            model.addAttribute("tbDelivery", resultList);
*/
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("searchValue",searchValue);

        return new ModelAndView("/jesica/driver/deliveryman/list");
    }

    /**
     * 배송원등록
     */
    @GetMapping("/deliveryman/insert")
    public ModelAndView insertDeliveryMan(Model model){

        return new ModelAndView("/jesica/driver/deliveryman/insert");
    }

    /**
     * 배송원상세
     */
    @GetMapping("/deliveryman/detail")
    public ModelAndView detailDeliveryMan(@RequestParam("userNo") Long userNo , Model model) {

        List<TbSystemCode> systemCodeList = apiService.systemCodeList("BL");
        model.addAttribute("systemCodeList",systemCodeList);

        try {
            TbUserWorker tbUserWorker = workGroupService.getTbUserWorker(userNo);
            TbWorkerCharge tbWorkerCharge = workGroupService.getTbWorkerCharge(userNo);


            //은행명 조회
            if(workGroupService.getSystemCode("BT",tbUserWorker.getBankTypeCode()) != null){
                model.addAttribute("bankName",workGroupService.getSystemCode("BT",tbUserWorker.getBankTypeCode()).getCodeName());
            } else {
                model.addAttribute("bankName",null);
            }
            //가상계좌 은행명 조회
            if(workGroupService.getSystemCode("CBT",tbUserWorker.getCybankTypeCode()) != null){
                model.addAttribute("cBankName",workGroupService.getSystemCode("CBT",tbUserWorker.getCybankTypeCode()).getCodeName());
            } else {
                model.addAttribute("cBankName",null);
            }

            String url = "";
            if (tbUserWorker.getProfileFile() != null) {
                url = URLEncoder.encode(tbUserWorker.getProfileFile(), "UTF-8");
            }
            String url2 = "";
            if (tbUserWorker.getProfileFile() != null) {
                url2 = URLEncoder.encode(tbUserWorker.getLicenseFile(), "UTF-8");
            }

            CipherAESUtils cipherAESUtils = new CipherAESUtils(keyGeneratorConfig.generateSecretKeySpec(),keyGeneratorConfig.generateIvParameterSpec());

            model.addAttribute("bankAccount", cipherAESUtils.decryptAES(tbUserWorker.getBankAccount()));
            model.addAttribute("bankOwner", cipherAESUtils.decryptAES(tbUserWorker.getBankOwner()));
            model.addAttribute("tbUserWorker", tbUserWorker);
            model.addAttribute("tbWorkerCharge", tbWorkerCharge);
            model.addAttribute("imgFile", url);
            model.addAttribute("imgFile2", url2);
        } catch (Exception e){
            e.printStackTrace();
        }
        return new ModelAndView("/jesica/driver/deliveryman/detail");
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

}
