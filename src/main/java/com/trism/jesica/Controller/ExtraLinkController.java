package com.trism.jesica.Controller;

import com.trism.jesica.Service.ApiService;
import com.trism.jesica.Service.ExtraLinkService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
  /*  @GetMapping("/rentcar/list")
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

            List<TbStore> tbStoreList = apiService.getStoreList();
            List<TbStoreRentalCarDTO> resultList = null;
            if(!tbStoreList.isEmpty()){
                resultList =  extraLinkService.getCarList(tbStoreList.get(0).getStoreNo());
            } else {
                resultList = null;
            }

            model.addAttribute("tbStoreList", tbStoreList);
            model.addAttribute("carList", resultList);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/extralink/rentcar/insert");
    }


*/
}
