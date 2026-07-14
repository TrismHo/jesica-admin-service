package com.trism.jesica.dto;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

@Data
public class MannaDeliveryStatusDto {
    private Long ordNo;
    private Long logisticsNo;

    private String courierCode;
    private String courierName;
    private String trackingNum;

    private String currentStatusCode;
    private String currentStatusName;

    private String senderName;
    private String receiverName;
    private String productName;

    private LocalDateTime putDate;
    private LocalDateTime modDate;
    private LocalDateTime endDate;

    private List<MannaDeliveryHistoryDto> historyList;

    @Data
    public static class MannaDeliveryHistoryDto {
        private LocalDateTime transDate;
        private String statusCode;
        private String statusText;
        private String location;
        private String description;
    }
}
