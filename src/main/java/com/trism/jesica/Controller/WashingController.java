package com.trism.jesica.Controller;

import com.trism.jesica.Service.MannaService;
import com.trism.jesica.dto.MannaOrderDetailDto;
import com.trism.jesica.dto.TbMannaOrderGoodsDTO;
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

@RequestMapping("/washing")
@RestController
@RequiredArgsConstructor
@Slf4j
public class WashingController {
    private final MannaService mannaService;
    private String ordPathCd = "1063";

    /**
     * 주문내역
     */
    /*@GetMapping("/order/list")
    public ModelAndView orderList(@RequestParam Map<String,Object> searchValue,
                                        Model model, HttpSession session) {

        log.info("@@searchValue {}",searchValue);
        try {
            if (!searchValue.isEmpty()) {
                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
                searchValue.put("startDate", DateUtil.now_yyyy_mm_dd());
                searchValue.put("keywordType", "ordCuTel");
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

        return new ModelAndView("/jesica/washing/order/list");

    }*/

    /**
     * 주문내역 상세
     */
    @GetMapping("/order/detail")
    public ModelAndView orderDetail(@RequestParam Long ordNo,Model model) {
        log.info("@@ordNo {}",ordNo);
        List<TbMannaOrderGoodsDTO> tbMannaOrderGoodsDTO;
        try {
            //;
            MannaOrderDetailDto detail = mannaService.getCallAllDetail(ordNo);

            model.addAttribute("callDetail", detail.getOrder());
            model.addAttribute("logisticsDetail", detail.getLogistics());
            tbMannaOrderGoodsDTO = mannaService.getOrderGoods(ordNo);
            model.addAttribute("goodsInfo",tbMannaOrderGoodsDTO);
            model.addAttribute("goodsInfoDetail",mannaService.getOrderGoodOpt(ordNo));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("/jesica/store/order/detail");
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
