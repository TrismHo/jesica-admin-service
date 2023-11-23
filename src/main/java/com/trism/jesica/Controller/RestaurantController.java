package com.trism.jesica.Controller;

import com.trism.jesica.Service.MannaService;
import com.trism.jesica.Util.DateUtil;
import com.trism.jesica.dto.TbMannaOrderGoodsDTO;
import com.trism.jesica.persistence.Entitiy.manna.TbMannaOrder;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/restaurant")
@RestController
@RequiredArgsConstructor
@Slf4j
public class RestaurantController {
    private final MannaService mannaService;
    private String ordPathCd = "1069";

    /**
     * 주문내역
     */
    @GetMapping("/order/list")
    public ModelAndView orderList(@RequestParam Map<String,Object> searchValue,
                                  Model model, HttpSession session) {

        log.info("@@searchValue {}",searchValue);
        try {
            if (!searchValue.isEmpty()) {
                putSearchOption(session, searchValue);
                if(!"".equals(searchValue.get("ordType").toString())){
                    if(Integer.parseInt(searchValue.get("ordType").toString()) != 1){
                        searchValue.put("dvryServiceType", "");
                    }
                } else {
                    searchValue.put("dvryServiceType", "");
                }

            } else {
                searchValue = getSearchOption(session);
                searchValue.put("startDate", DateUtil.now_yyyy_mm_dd_week() );
                searchValue.put("endDate", DateUtil.now_yyyy_mm_dd());
                searchValue.put("keywordType", "ordCuTel");
                searchValue.put("dvryServiceType", "");
                searchValue.put("ordStatus", "5");
            }

            searchValue.put("ordPathCd",ordPathCd);
            List<TbMannaOrder> resultList =  mannaService.tbCallAllList(searchValue);
            //List<TbSystemCode> tbSystemCode = driverApplyService.searchTbSystemCode("OP");
            //model.addAttribute("tbSystemCode", tbSystemCode);
            model.addAttribute("orderList", resultList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("searchValue", searchValue);

        return new ModelAndView("/jesica/restaurant/order/list");

    }

    /**
     * 주문내역 상세
     */
    @GetMapping("/order/detail")
    public ModelAndView orderDetail(@RequestParam Long ordNo,Model model) {
        log.info("@@ordNo {}",ordNo);
        List<TbMannaOrderGoodsDTO> tbMannaOrderGoodsDTO;
        try {
            //;
            TbMannaOrder tbCallAll = mannaService.getCallAllDetail(ordNo);
            tbMannaOrderGoodsDTO = mannaService.getOrderGoods(ordNo);
            model.addAttribute("callDetail",tbCallAll);
            model.addAttribute("goodsInfo",tbMannaOrderGoodsDTO);
            model.addAttribute("goodsInfoDetail",mannaService.getOrderGoodOpt(ordNo));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("/jesica/restaurant/order/detail");
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
