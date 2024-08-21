
package com.trism.jesica.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
/*@ConfigurationPropertiesScan("spring.rabbitmq")
@ConstructorBinding
@AllArgsConstructor
@Getter*/

@Data
@Component
@ConfigurationProperties(prefix = "spring.rabbitmq")
public class RabbitMqProperties {
    private String host;
    private int port;
    private String username;
    private String password;
}

