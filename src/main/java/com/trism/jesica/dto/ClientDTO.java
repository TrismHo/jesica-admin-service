package com.trism.jesica.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
@Builder
public class ClientDTO {

    private String clientId;

    private String code;

    private String deviceId;

}
