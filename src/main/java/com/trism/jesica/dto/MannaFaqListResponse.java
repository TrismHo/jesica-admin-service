package com.trism.jesica.dto;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaFaq;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MannaFaqListResponse {
    private List<TbMannaFaq> faqList;
    private int totalCount;
    private Map<String, Long> categoryCount;
}
