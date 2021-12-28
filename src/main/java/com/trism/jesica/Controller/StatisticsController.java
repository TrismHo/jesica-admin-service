package com.trism.jesica.Controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/statistics")
@RestController
@RequiredArgsConstructor
@Slf4j
public class StatisticsController {

    @GetMapping("/bycallcnt/list")
    public ModelAndView listByCallCount() {

        return new ModelAndView("jesica/statistics/bycallcnt/list");
    }

    @GetMapping("/byfranchise/list")
    public ModelAndView listByMerchant() {

        return new ModelAndView("jesica/statistics/byfranchise/list");
    }

    @GetMapping("/bydeliver/list")
    public ModelAndView listByDeliver() {

        return new ModelAndView("jesica/statistics/bydeliver/list");
    }

    @GetMapping("/byregion/list")
    public ModelAndView listByRegion() {

        return new ModelAndView("jesica/statistics/byregion/list");
    }

    @GetMapping("/platform/list")
    public ModelAndView listByPlatformRevenue() {

        return new ModelAndView("jesica/statistics/platform/list");
    }

    @GetMapping("/performance/list")
    public ModelAndView listByPerformance() {

        return new ModelAndView("jesica/statistics/performance/list");
    }
}
