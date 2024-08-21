package com.trism.jesica.Controller;

import com.trism.jesica.Service.SafeService;
import com.trism.jesica.config.KeyGeneratorConfig;
import com.trism.jesica.persistence.mysql.Entitiy.car.TbStoreRentalCar;
import com.trism.jesica.persistence.mysql.Entitiy.common.LoginSession;
import com.trism.jesica.persistence.mysql.Entitiy.safe.TbSafenMapping;
import com.trism.jesica.persistence.mysql.Entitiy.safe.TbSafenMappingLog;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/*import com.trism.jesica.dto.TbHeadDTO;*/

@RequestMapping("/safe")
@RestController
@RequiredArgsConstructor
@Slf4j
public class SafeNumberController {



    private final SafeService safeService;

    @Autowired
    private final KeyGeneratorConfig keyGeneratorConfig;

    /**
     * 안심번호리스트
     */
    @GetMapping("/number/list")
    public ModelAndView listSafeNumber(Locale locale, HttpServletRequest request,
                                       @RequestParam Map<String,Object> searchValue,
                                       LoginSession session,
                                       Model model) {
        log.info("@@searchValue {}",searchValue);

        if (!searchValue.isEmpty()){

            model.addAttribute("tbSafenMapping", safeService.tbSafenMapping(searchValue));
        } else {
            model.addAttribute("tbSafenMapping", null);
        }

        model.addAttribute("searchValue",searchValue);



        return new ModelAndView("/jesica/safe/number/list");
    }

    /**
     * 안심번호등록
     */
    @GetMapping("/number/detail")
    public ModelAndView insertSafeNumber(@RequestParam String safenNum, Model model) {
        try {

            //브랜드 리스트 조회
            TbSafenMapping tbSafenMapping = safeService.getTbSafenMappingDetail(safenNum);
            List<TbSafenMappingLog> tbSafenMappingLog = safeService.getTbSafenMappingDetailList(safenNum);
            if(tbSafenMapping.getRentalCarNo() != null){
                TbStoreRentalCar tbStoreRentalCar = safeService.getTbStoreRentalCarDetail(tbSafenMapping.getRentalCarNo());
                model.addAttribute("tbStoreRentalCar", tbStoreRentalCar);
            }else {
                model.addAttribute("tbStoreRentalCar", null);
            }
            model.addAttribute("tbSafenMappingLog", tbSafenMappingLog);
            model.addAttribute("tbSafenMapping", tbSafenMapping);


        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("/jesica/safe/number/detail");
    }




}
