package com.trism.jesica.Controller;

import com.trism.jesica.Service.ApiService;
import com.trism.jesica.Service.BoardService;
import com.trism.jesica.persistence.Entitiy.board.TbNoticeCompany;
import com.trism.jesica.persistence.Entitiy.board.TbNoticePlatform;
import com.trism.jesica.persistence.Entitiy.board.TbNoticeWorker;
import com.trism.jesica.persistence.Entitiy.event.TbEvent;
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

@RequestMapping("/board")
@RestController
@RequiredArgsConstructor
@Slf4j
public class BoardController {

    private final ApiService apiService;
    private final BoardService boardService;

    /**
     * 블록배달리스트
     */
    @GetMapping("/platform/list")
    public ModelAndView listPlatformNotice(@RequestParam Map<String,Object> searchValue,
                                           Model model, HttpSession session) {

        log.info("@@searchValue {}",searchValue);
        try {
            if (!searchValue.isEmpty()) {
                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
            }

            List<TbNoticePlatform> resultList =  boardService.tbNoticePlatFormSearch(searchValue);
            model.addAttribute("tbNoticePlatformList", resultList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("searchValue", searchValue);

        return new ModelAndView("/jesica/board/platform/list");
    }

    @GetMapping("/platform/insert")
    public ModelAndView insertformPlatformNotice() {

        return new ModelAndView("jesica/board/platform/insert");
    }

    @GetMapping("/platform/detail")
    public ModelAndView detailformPlatformNotice(@RequestParam("noticeNo") Long noticeNo , Model model) {
        log.info("noticeNo :: {}",noticeNo);
        try {
            TbNoticePlatform tbNoticePlatform = boardService.getTbNoticePlatFormDetail(noticeNo);

            model.addAttribute("tbNoticePlatform", tbNoticePlatform);
        } catch (Exception e){
            e.printStackTrace();
        }

        return new ModelAndView("jesica/board/platform/detail");
    }


    @GetMapping("/company/list")
    public ModelAndView listCompanyNotice(@RequestParam Map<String,Object> searchValue,
                                          Model model, HttpSession session) {
        log.info("@@searchValue {}",searchValue);
        try {
            if (!searchValue.isEmpty()) {
                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
            }

            List<TbNoticeCompany> resultList =  boardService.tbNoticeCompanySearch(searchValue);
            model.addAttribute("tbNoticeCompanyList", resultList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("searchValue", searchValue);
        return new ModelAndView("jesica/board/company/list");
    }

    @GetMapping("/company/insert")
    public ModelAndView insertCompanyNotice() {

        return new ModelAndView("jesica/board/company/insert");
    }

    @GetMapping("/company/detail")
    public ModelAndView detailCompanyNotice(@RequestParam("noticeNo") Long noticeNo , Model model) {
        log.info("noticeNo :: {}",noticeNo);
        try {
            TbNoticeCompany tbNoticeCompany = boardService.getTbNoticeCompanyDetail(noticeNo);

            model.addAttribute("tbNoticeCompany", tbNoticeCompany);
        } catch (Exception e){
            e.printStackTrace();
        }

        return new ModelAndView("jesica/board/company/detail");
    }


    @GetMapping("/worker/list")
    public ModelAndView listDeliverNotice(@RequestParam Map<String,Object> searchValue,
                                          Model model, HttpSession session) {
        log.info("@@searchValue {}",searchValue);
        try {
            if (!searchValue.isEmpty()) {
                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
            }

            List<TbNoticeWorker> resultList =  boardService.tbNoticeWorkerSearch(searchValue);
            model.addAttribute("tbNoticeWorkerList", resultList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("searchValue", searchValue);
        return new ModelAndView("jesica/board/worker/list");
    }

    @GetMapping("/worker/insert")
    public ModelAndView insertDeliverNotice() {

        return new ModelAndView("jesica/board/worker/insert");
    }

    @GetMapping("/worker/detail")
    public ModelAndView detailDeliverNotice(@RequestParam("noticeNo") Long noticeNo , Model model) {
        log.info("noticeNo :: {}",noticeNo);
        try {
            TbNoticeWorker tbNoticeWorker = boardService.getTbNoticeWorkerDetail(noticeNo);

            model.addAttribute("tbNoticeWorker", tbNoticeWorker);
        } catch (Exception e){
            e.printStackTrace();
        }
        return new ModelAndView("jesica/board/worker/detail");
    }



    @GetMapping("/event/list")
    public ModelAndView listEvent(@RequestParam Map<String,Object> searchValue,
                                          Model model, HttpSession session) {
        log.info("@@searchValue {}",searchValue);
        try {
            if (!searchValue.isEmpty()) {
                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
            }

            List<TbEvent> resultList =  boardService.tbEventSearch(searchValue);
            model.addAttribute("tbEventList", resultList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("searchValue", searchValue);
        return new ModelAndView("jesica/board/event/list");
    }

    @GetMapping("/event/insert")
    public ModelAndView insertEvent() {

        return new ModelAndView("jesica/board/event/insert");
    }

    @GetMapping("/event/detail")
    public ModelAndView detailEvent(@RequestParam("eventNo") Long eventNo , Model model) {
        log.info("eventNo :: {}",eventNo);
      /*  try {

            model.addAttribute("tbEvent", tbEvent);
            if(tbEvent.getImgFileSmall() != null){
                model.addAttribute("imgFileSmall", URLEncoder.encode(tbEvent.getImgFileSmall(),"UTF-8"));
            } else {
                model.addAttribute("imgFileSmall", null);
            }
        } catch (Exception e){
            e.printStackTrace();
        }*/

        TbEvent tbEvent = boardService.getTbEventDetail(eventNo);
        model.addAttribute("tbEvent", tbEvent);
        return new ModelAndView("jesica/board/event/detail");
    }

    @GetMapping("/platforminquiry/list")
    public ModelAndView listPlatformInquiry() {

        return new ModelAndView("jesica/board/platforminquiry/list");
    }

    @GetMapping("/platforminquiry/detail")
    public ModelAndView detailPlatformInquiry() {

        return new ModelAndView("jesica/board/platforminquiry/detail");
    }

    @GetMapping("/bursimcust/list")
    public ModelAndView listBursimCustomerNotice() {

        return new ModelAndView("jesica/board/bursimcust/list");
    }

    @GetMapping("/bursimcust/insert")
    public ModelAndView insertBursimCustomerNotice() {

        return new ModelAndView("jesica/board/bursimcust/insert");
    }

    @GetMapping("/bursimcust/detail")
    public ModelAndView detailBursimCustomerNotice() {

        return new ModelAndView("jesica/board/bursimcust/detail");
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
