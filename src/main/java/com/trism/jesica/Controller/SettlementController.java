package com.trism.jesica.Controller;

import com.trism.jesica.Service.ApiService;
import com.trism.jesica.Service.SettlementService;
import com.trism.jesica.Util.DateUtil;
import com.trism.jesica.Util.Secure.CipherAESUtils;
import com.trism.jesica.config.KeyGeneratorConfig;
import com.trism.jesica.dto.TbBranchDTO;
import com.trism.jesica.dto.TbHeadDTO;
import com.trism.jesica.dto.TbServiceChargeDTO;
import com.trism.jesica.persistence.Entitiy.business.TbBranch;
import com.trism.jesica.persistence.Entitiy.business.TbHead;
import com.trism.jesica.persistence.Entitiy.business.TbStore;
import com.trism.jesica.persistence.Entitiy.business.TbUserWorker;
import com.trism.jesica.persistence.Entitiy.cash.TbCashWithdraw;
import com.trism.jesica.persistence.Entitiy.cust.TbBranchCashLog;
import com.trism.jesica.persistence.Entitiy.cust.TbHeadCashLog;
import com.trism.jesica.persistence.Entitiy.cust.TbStoreCashLog;
import com.trism.jesica.persistence.Entitiy.cust.TbWorkerCashLog;
import com.trism.jesica.persistence.Entitiy.order.TbOrderAll;
import com.trism.jesica.persistence.Entitiy.order.TbOrderDay;
import com.trism.jesica.persistence.Entitiy.paymenthistory.TbPayApproval;
import com.trism.jesica.persistence.Entitiy.paymenthistory.TbPayCancel;
import com.trism.jesica.persistence.Entitiy.paymenthistory.TbPayCardData;
import com.trism.jesica.persistence.Entitiy.service.TbServiceChargeGroup;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/settlement")
@RestController
@RequiredArgsConstructor
@Slf4j
public class SettlementController {

    private final SettlementService settlementService;
    private final ApiService apiService;

    @Autowired
    private final KeyGeneratorConfig keyGeneratorConfig;

    @GetMapping("/salpurstate/list")
    public ModelAndView listMerchandise() {

        return new ModelAndView("jesica/settlement/salpurstate/list");
    }

    @GetMapping("/feesettleratio/list")
    public ModelAndView listFeeSettlementRatio() {

        return new ModelAndView("jesica/settlement/feesettleratio/list");
    }

    @GetMapping("/paymenthistory/list")
    public ModelAndView paymenthistoryList(@RequestParam Map<String,Object> searchValue,
                                           Model model, HttpSession session) {
        log.info("@@searchValue {}",searchValue);
        if (!searchValue.isEmpty()){
            putSearchOption(session, searchValue);
        } else {
            searchValue = getSearchOption(session);
        }

        /*List<TbPayCert> tbPayCert = settlementService.getPaymenthistoryList();*/
        Object storeNo = searchValue.get("storeNo");
       /* if(storeNo == null){
            searchValue.put("storeNo",0);
        }*/
        List<TbPayApproval> tbPayApprovals = settlementService.getPaymenthistoryList(searchValue);
        model.addAttribute("searchValue", searchValue);

        model.addAttribute("paymentlist",tbPayApprovals);



        return new ModelAndView("jesica/settlement/paymenthistory/list");
    }

    @GetMapping("/paymenthistory/detail")
    public ModelAndView detailformPlatformNotice(@RequestParam("tid") String tid ,Model model) {
        log.info("tid :: {}",tid);
        try {
            TbPayCardData tbPayCardData = settlementService.getPayCardData(tid);
            TbPayApproval tbPayApproval = settlementService.getApproval(tid);
            List<TbPayCancel> tbPayCancel = settlementService.getCancel(tbPayApproval.getOrderNo());

            TbOrderDay tbOrderDay = settlementService.getOrderDay(tbPayApproval.getOrderNo());
            if(tbOrderDay != null) {

                model.addAttribute("tbOrder", tbOrderDay);
            } else {
                TbOrderAll tbOrderAll = settlementService.getOrderAll(tbPayApproval.getOrderNo());
                if(tbOrderAll != null) {
                    model.addAttribute("tbOrder", tbOrderAll);
                } else {
                    model.addAttribute("tbOrder", "");
                }
            }
            if(tbPayApproval != null) {
                model.addAttribute("tbPayApproval", tbPayApproval);
            } else {
                model.addAttribute("tbPayApproval", "");
            }
            if(tbPayCancel != null) {
                model.addAttribute("tbPayCancel", tbPayCancel);
            } else {
                model.addAttribute("tbPayCancel", "");
            }
            if(tbPayCardData != null) {
                model.addAttribute("tbPayCardData", tbPayCardData);
            } else {
                model.addAttribute("tbPayCardData", "");
            }

        } catch (Exception e){
            e.printStackTrace();
        }

        return new ModelAndView("jesica/settlement/paymenthistory/detail");
    }

    @GetMapping("/servicechargegrp/list")
    public ModelAndView listjesicaShopGroup(@RequestParam Map<String,Object> searchValue,
                                           Model model, HttpSession session) {

        log.info("@@searchValue {}",searchValue);
        if (!searchValue.isEmpty()){
            putSearchOption(session, searchValue);
        } else {
            searchValue = getSearchOption(session);
        }
        List<HashMap<String,Object>> resultList = new ArrayList<>();
        List<TbServiceChargeGroup> tbServiceChargeGroupList = null;

        if (searchValue.containsKey("branchNo")) {
            tbServiceChargeGroupList = settlementService.searchServiceChargeGroup(searchValue);
            for(TbServiceChargeGroup tbServiceChargeGroup : tbServiceChargeGroupList) {
                HashMap map = new HashMap();
                Long chargeNo = tbServiceChargeGroup.getChargeNo();
                List<TbServiceChargeDTO> tbServiceCharge =  settlementService.tbServiceChargefindById(chargeNo);

                map.put("tbServiceChargeGroup",tbServiceChargeGroup);
                if(tbServiceCharge != null) {
                    map.put("tbServiceCharge",tbServiceCharge);
                }
                resultList.add(map);
            }
           // tbServiceChargeGroupList = settlementService.searchServiceChargeGroup(searchValue);
        }



        model.addAttribute("tbServiceChargeGroup", resultList);
        model.addAttribute("searchValue",searchValue);
        return new ModelAndView("jesica/settlement/servicechargegrp/list");
    }

    @GetMapping("/servicechargegrp/detail")
    public ModelAndView detailjesicaShopGroup(@RequestParam Long chargeNo, Model model) {
        TbServiceChargeGroup tbServiceChargeGroup = settlementService.tbServiceChargeGroupfindById(chargeNo);
        List<TbServiceChargeDTO> tbServiceCharge =  settlementService.tbServiceChargefindById(chargeNo);

        List<TbHeadDTO> tbHeadDTO = settlementService.getHeadAll();
        List<TbBranchDTO> tbBranchDTO = settlementService.getBranchAll();
        model.addAttribute("tbServiceCharge",tbServiceCharge);
        model.addAttribute("tbServiceChargeGroup",tbServiceChargeGroup);
        model.addAttribute("tbHead",tbHeadDTO);
        model.addAttribute("tbBranch",tbBranchDTO);
        return new ModelAndView("jesica/settlement/servicechargegrp/detail");
    }

    /**
     * 금일 주문내역
     */
    @GetMapping("/cashwithdraw/list")
    public ModelAndView cashwithdraw(@RequestParam Map<String,Object> searchValue,
                                     Model model, HttpSession session) {

        log.info("@@searchValue {}",searchValue);
        try {
            if (!searchValue.isEmpty()) {
                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
                searchValue.put("startDate","2020-01-01");
                searchValue.put("endDate", DateUtil.now_yyyy_mm_dd());
            }
            CipherAESUtils cipherAESUtils = new CipherAESUtils(keyGeneratorConfig.generateSecretKeySpec(),keyGeneratorConfig.generateIvParameterSpec());
            List<TbCashWithdraw> withdrawList = null;
            withdrawList = settlementService.tbCashWithdrawList(searchValue);
            int index = 0;

            for(TbCashWithdraw resultList : withdrawList) {
                if(!withdrawList.get(index).getAccountNo().isEmpty()){
                    withdrawList.get(index).setAccountNo(cipherAESUtils.decryptAES(resultList.getAccountNo()));
                }
                if(!withdrawList.get(index).getAccountName().isEmpty()){
                    withdrawList.get(index).setAccountName(cipherAESUtils.decryptAES(resultList.getAccountName()));
                }
                index++;
            }

            model.addAttribute("tbCashWithdraw", withdrawList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("searchValue", searchValue);

        return new ModelAndView("/jesica/settlement/cashwithdraw/list");
    }

    @GetMapping("/cashwithdraw/detail")
    public ModelAndView detailCashwithdraw(@RequestParam Long withdrawNo, Model model) {

        try {
            TbCashWithdraw tbCashWithdraw = settlementService.getTbCashWithdraw(withdrawNo);
            CipherAESUtils cipherAESUtils = new CipherAESUtils(keyGeneratorConfig.generateSecretKeySpec(),keyGeneratorConfig.generateIvParameterSpec());

            model.addAttribute("accountNo", cipherAESUtils.decryptAES(tbCashWithdraw.getAccountNo()));
            model.addAttribute("accountName", cipherAESUtils.decryptAES(tbCashWithdraw.getAccountName()));

            model.addAttribute("tbCashWithdraw",tbCashWithdraw);
        } catch (Exception e){
            e.printStackTrace();
        }

    /*    TbServiceChargeGroup tbServiceChargeGroup = settlementService.tbServiceChargeGroupfindById(chargeNo);
        List<TbServiceChargeDTO> tbServiceCharge =  settlementService.tbServiceChargefindById(chargeNo);

        List<TbHeadDTO> tbHeadDTO = settlementService.getHeadAll();
        List<TbBranchDTO> tbBranchDTO = settlementService.getBranchAll();
        model.addAttribute("tbServiceCharge",tbServiceCharge);
        model.addAttribute("tbServiceChargeGroup",tbServiceChargeGroup);
        model.addAttribute("tbHead",tbHeadDTO);
        model.addAttribute("tbBranch",tbBranchDTO);*/
        return new ModelAndView("jesica/settlement/cashwithdraw/detail");
    }

    /**
     * 금일 주문내역
     */
    @GetMapping("/cashlog/list")
    public ModelAndView cashLog(@RequestParam Map<String,Object> searchValue,
                                     Model model, HttpSession session) {

        log.info("@@searchValue {}",searchValue);
        try {
            if (!searchValue.isEmpty()) {
                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
                searchValue.put("startDate","2020-01-01");
                searchValue.put("endDate", DateUtil.now_yyyy_mm_dd());
            }
            List<TbHeadCashLog> tbHeadCashLog = null;
            List<TbBranchCashLog> tbBranchCashLog = null;
            List<TbStoreCashLog> tbStoreCashLog = null;
            List<TbWorkerCashLog> tbWorkerCashLog = null;
            if("1".equals(searchValue.get("groupType"))){
                tbHeadCashLog = settlementService.tbHeadCashLogList(searchValue);
                model.addAttribute("tbCustCashLog", tbHeadCashLog);
            } else if("2".equals(searchValue.get("groupType"))){
                tbBranchCashLog = settlementService.tbBranchCashLogList(searchValue);
                model.addAttribute("tbCustCashLog", tbBranchCashLog);
            } else if("3".equals(searchValue.get("groupType"))){
                tbStoreCashLog = settlementService.tbStoreCashLogList(searchValue);
                model.addAttribute("tbCustCashLog", tbStoreCashLog);
            } else if("4".equals(searchValue.get("groupType"))){
                tbWorkerCashLog = settlementService.tbWorkerCashLogList(searchValue);
                model.addAttribute("tbCustCashLog", tbWorkerCashLog);
            }


            int index = 0;



        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("searchValue", searchValue);

        return new ModelAndView("/jesica/settlement/cashlog/list");
    }

    @GetMapping("/transsettle/list")
    public ModelAndView listTransferSettlement() {

        return new ModelAndView("jesica/settlement/transfersettlement/list");
    }
    @GetMapping("/cashlog/search/{groupType}")
    public ModelAndView cashLogSearch(@PathVariable Integer groupType, Model model) {
        if(groupType == 1){
            List<TbHead> tbHead = settlementService.tbHeadList();
            model.addAttribute("tbHead", tbHead);
        } else if(groupType == 2){
            List<TbBranch> tbBranch = settlementService.tbBranchList();
            model.addAttribute("tbBranch", tbBranch);
        } else if(groupType == 3){
            List<TbStore> tbStore = settlementService.tbStoreList();
            model.addAttribute("tbStore", tbStore);
        } else if(groupType == 4){
            List<TbUserWorker> tbUserWorker = settlementService.tbWorkerList();
            model.addAttribute("tbUserWorker", tbUserWorker);
        }

        model.addAttribute("groupType",groupType);
        return new ModelAndView("jesica/settlement/cashlog/search");
    }

    @GetMapping("/transsettle/insert")
    public ModelAndView insertFormTransferSettlement() {

        return new ModelAndView("jesica/settlement/transfersettlement/insert");
    }

    @GetMapping("/transsettle/detail")
    public ModelAndView detailFormTransferSettlement() {

        return new ModelAndView("jesica/settlement/transfersettlement/detail");
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
