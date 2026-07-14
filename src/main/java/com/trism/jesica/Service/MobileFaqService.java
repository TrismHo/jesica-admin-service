package com.trism.jesica.Service;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaFaq;
import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaFaqCategory;
import com.trism.jesica.persistence.mysql.Repository.manna.TbMannaFaqCategoryRepository;
import com.trism.jesica.persistence.mysql.Repository.manna.TbMannaFaqRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class MobileFaqService {

    private final TbMannaFaqRepository tbMannaFaqRepository;

    private final TbMannaFaqCategoryRepository
            tbMannaFaqCategoryRepository;

    /**
     * 모바일 FAQ 카테고리 목록
     */
    @Transactional(readOnly = true)
    public List<Map<String, Object>>
    getMobileFaqCategoryList() {

        List<TbMannaFaqCategory> categoryList =
                tbMannaFaqCategoryRepository
                        .findByUseYnAndDataStatusOrderByFaqCategoryNoAsc(
                                "Y",
                                1
                        );

        List<Map<String, Object>> result =
                new ArrayList<>();

        for (TbMannaFaqCategory category : categoryList) {

            long faqCount =
                    tbMannaFaqRepository
                            .countByFaqCategoryNoAndUseYnAndDataStatus(
                                    category.getFaqCategoryNo(),
                                    "Y",
                                    1
                            );

            Map<String, Object> item =
                    new LinkedHashMap<>();

            item.put(
                    "faqCategoryNo",
                    category.getFaqCategoryNo()
            );

            item.put(
                    "faqCategoryName",
                    category.getFaqCategoryName()
            );


            item.put(
                    "faqCount",
                    faqCount
            );

            result.add(item);
        }

        return result;
    }

    /**
     * 모바일 FAQ 목록
     */
    @Transactional(readOnly = true)
    public List<Map<String, Object>> getMobileFaqList(
            Long faqCategoryNo,
            String keyword
    ) {
        String normalizedKeyword =
                normalizeKeyword(keyword);

        List<TbMannaFaq> faqList =
                tbMannaFaqRepository
                        .getMobileFaqList(
                                faqCategoryNo,
                                normalizedKeyword
                        );

        List<TbMannaFaqCategory> categoryList =
                tbMannaFaqCategoryRepository
                        .findByUseYnAndDataStatusOrderByFaqCategoryNoAsc(
                                "Y",
                                1
                        );

        Map<Long, String> categoryNameMap =
                new LinkedHashMap<>();

        for (TbMannaFaqCategory category : categoryList) {
            categoryNameMap.put(
                    category.getFaqCategoryNo(),
                    category.getFaqCategoryName()
            );
        }

        List<Map<String, Object>> result =
                new ArrayList<>();

        for (TbMannaFaq faq : faqList) {
            Map<String, Object> item =
                    new LinkedHashMap<>();

            item.put(
                    "faqNo",
                    faq.getFaqNo()
            );

            item.put(
                    "faqCategoryNo",
                    faq.getFaqCategoryNo()
            );

            item.put(
                    "faqCategoryName",
                    categoryNameMap.getOrDefault(
                            faq.getFaqCategoryNo(),
                            ""
                    )
            );

            item.put(
                    "faqQ",
                    faq.getFaqQ()
            );

            item.put(
                    "faqA",
                    faq.getFaqA()
            );

            item.put(
                    "displayOrder",
                    faq.getDisplayOrder()
            );

            result.add(item);
        }

        return result;
    }

    /**
     * 모바일 FAQ 상세
     */
    @Transactional(readOnly = true)
    public Map<String, Object> getMobileFaqDetail(
            Long faqNo
    ) {
        if (faqNo == null) {
            throw new IllegalArgumentException(
                    "FAQ 번호가 없습니다."
            );
        }

        TbMannaFaq faq =
                tbMannaFaqRepository
                        .findByFaqNoAndUseYnAndDataStatus(
                                faqNo,
                                "Y",
                                1
                        )
                        .orElseThrow(
                                () -> new IllegalArgumentException(
                                        "존재하지 않는 FAQ입니다."
                                )
                        );

        TbMannaFaqCategory category =
                tbMannaFaqCategoryRepository
                        .findById(
                                faq.getFaqCategoryNo()
                        )
                        .orElse(null);

        Map<String, Object> result =
                new LinkedHashMap<>();

        result.put(
                "faqNo",
                faq.getFaqNo()
        );

        result.put(
                "faqCategoryNo",
                faq.getFaqCategoryNo()
        );

        result.put(
                "faqCategoryName",
                category == null
                        ? ""
                        : category.getFaqCategoryName()
        );

        result.put(
                "faqQ",
                faq.getFaqQ()
        );

        result.put(
                "faqA",
                faq.getFaqA()
        );

        result.put(
                "displayOrder",
                faq.getDisplayOrder()
        );

        return result;
    }

    private String normalizeKeyword(String keyword) {
        if (keyword == null) {
            return "";
        }

        return keyword.trim();
    }
}
