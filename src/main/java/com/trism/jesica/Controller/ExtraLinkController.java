package com.trism.jesica.Controller;

import com.trism.jesica.Service.ApiService;
import com.trism.jesica.Service.ExtraLinkService;
import com.trism.jesica.persistence.Entitiy.car.TbStoreRentalCar;
import com.trism.jesica.persistence.Entitiy.car.TbRentalInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@RequestMapping("/extralink")
@RestController
@RequiredArgsConstructor
@Slf4j
public class ExtraLinkController {

    private final ApiService apiService;
    private final ExtraLinkService extraLinkService;

    /**
     * 렌터카 API리스트
     */
    @GetMapping("/rentcar/list")
    public ModelAndView getRentalInfo(@RequestParam Map<String,Object> searchValue,
                                           Model model ) {

        log.info("@@searchValue {}",searchValue);
        try {
            List<TbRentalInfo> resultList =  extraLinkService.getRentalInfo(searchValue);
            model.addAttribute("tbRentalInfo", resultList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("searchValue", searchValue);

        return new ModelAndView("jesica/extralink/rentcar/list");
    }

    @GetMapping("/rentcar/insert")
    public ModelAndView insertformPlatformNotice( Model model) {
        try {
            List<TbStoreRentalCar> resultList =  extraLinkService.getCarList();
            model.addAttribute("carList", resultList);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/extralink/rentcar/insert");
    }
}
