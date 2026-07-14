package com.trism.jesica.Controller;

import com.trism.jesica.Service.MobileFaqService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/mobile/faq")
public class MobileFaqController {

    private final MobileFaqService mobileFaqService;

    @GetMapping("/mobileFaq")
    public ModelAndView auth() {

        return new ModelAndView("jesica/system/faq/mobileFaq");
    }

    /**
     * 모바일 FAQ 카테고리 목록
     *
     * GET /api/mobile/faq/category/list
     */
    @GetMapping("/category/list")
    public ResponseEntity<Map<String, Object>>
    getMobileFaqCategoryList() {

        Map<String, Object> result =
                new LinkedHashMap<>();

        try {
            List<Map<String, Object>> categoryList =
                    mobileFaqService
                            .getMobileFaqCategoryList();

            result.put("result", true);
            result.put(
                    "categoryList",
                    categoryList
            );

            result.put(
                    "totalCount",
                    categoryList.size()
            );

            return ResponseEntity.ok(result);

        } catch (Exception e) {
            log.error(
                    "모바일 FAQ 카테고리 목록 조회 오류",
                    e
            );

            result.put("result", false);
            result.put(
                    "categoryList",
                    Collections.emptyList()
            );

            result.put("totalCount", 0);
            result.put(
                    "message",
                    "FAQ 카테고리를 불러오지 못했습니다."
            );

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(result);
        }
    }

    /**
     * 모바일 FAQ 목록
     *
     * GET /api/mobile/faq/list
     * GET /api/mobile/faq/list?faqCategoryNo=1
     * GET /api/mobile/faq/list?keyword=결제
     */
    @GetMapping("/list")
    public ResponseEntity<Map<String, Object>>
    getMobileFaqList(
            @RequestParam(required = false)
            Long faqCategoryNo,

            @RequestParam(required = false)
            String keyword
    ) {
        Map<String, Object> result =
                new LinkedHashMap<>();

        try {
            List<Map<String, Object>> faqList =
                    mobileFaqService
                            .getMobileFaqList(
                                    faqCategoryNo,
                                    keyword
                            );

            result.put("result", true);
            result.put("faqList", faqList);
            result.put(
                    "totalCount",
                    faqList.size()
            );

            return ResponseEntity.ok(result);

        } catch (Exception e) {
            log.error(
                    "모바일 FAQ 목록 조회 오류. "
                            + "faqCategoryNo={}, keyword={}",
                    faqCategoryNo,
                    keyword,
                    e
            );

            result.put("result", false);
            result.put(
                    "faqList",
                    Collections.emptyList()
            );

            result.put("totalCount", 0);
            result.put(
                    "message",
                    "FAQ 목록을 불러오지 못했습니다."
            );

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(result);
        }
    }

    /**
     * 모바일 FAQ 상세
     *
     * GET /api/mobile/faq/detail?faqNo=1
     */
    @GetMapping("/detail")
    public ResponseEntity<Map<String, Object>>
    getMobileFaqDetail(
            @RequestParam Long faqNo
    ) {
        Map<String, Object> result =
                new LinkedHashMap<>();

        try {
            Map<String, Object> faq =
                    mobileFaqService
                            .getMobileFaqDetail(faqNo);

            result.put("result", true);
            result.put("faq", faq);

            return ResponseEntity.ok(result);

        } catch (IllegalArgumentException e) {
            result.put("result", false);
            result.put(
                    "message",
                    e.getMessage()
            );

            return ResponseEntity
                    .status(HttpStatus.BAD_REQUEST)
                    .body(result);

        } catch (Exception e) {
            log.error(
                    "모바일 FAQ 상세 조회 오류. faqNo={}",
                    faqNo,
                    e
            );

            result.put("result", false);
            result.put(
                    "message",
                    "FAQ 상세정보를 불러오지 못했습니다."
            );

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(result);
        }
    }
}
