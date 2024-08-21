package com.trism.jesica.Service;

import com.trism.jesica.persistence.mysql.Repository.cust.TbCustDeviceRepository;
import com.trism.jesicar.message.PushMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Map;

@Slf4j
@RequiredArgsConstructor
@Service
public class RabbitMqService {
    private final TbCustDeviceRepository tbCustDeviceRepository;

    @Value("${rabbitmq.queue.name}")
    private String queueName;

    @Value("${rabbitmq.exchange.name}")
    private String exchangeName;

    @Value("${rabbitmq.routing.key}")
    private String routingKey;

    private final RabbitTemplate rabbitTemplate;

    /**
     * 1. Queue 로 메세지를 발행
     * 2. Producer 역할 -> Direct Exchange 전략
     **/
    public void sendMessage(BigDecimal[] custList, String couponText, String pushTitle, String pushContents) {
      /*  PushMessage.Data data = PushMessage.Data.builder().type("5").build();
        PushMessage pushMessage = PushMessage.builder().appcode("om")
                .os("a")
                .timestamp(System.currentTimeMillis())
                .title("test")
                .contents("contents")
                .receiver("flOQjlvXS8-QLFyHCwLYHy:APA91bG6NvJeJ_nSYylp6Q571RGGm2xV6P4MaQTrUQzPjfhXe-Xk8YDvPFb6ic8lRajGoEmUXXpZ_CdtOpqsZl53xLkapt-W-cWgki8MH-V_ZWlkqWWjthCqXoGfGO44pws1NYJ95xWz")
                .data(data)
                .build();
        log.info(pushMessage.toString());*/
        //사용자 조회
        for(int i = 0 ; i < custList.length ; i++){

            PushMessage.Data data = PushMessage.Data.builder().type("5").build();
            Map<String,Object> deviceInfo =  tbCustDeviceRepository.getDeviceInfo(custList[i]);

            if(deviceInfo.get("extCustNo") != null){
                pushTitle.replace("{name}",deviceInfo.get("custName").toString());
                pushTitle.replace("{coupon}",couponText);
                String os = "";
                if(Integer.parseInt(deviceInfo.get("deviceType").toString()) == 1){
                    os = "a";
                } else if(Integer.parseInt(deviceInfo.get("deviceType").toString()) == 2){
                    os = "i";
                }
                PushMessage pushMessage = PushMessage.builder().appcode("om")

                .os(os)
                .timestamp(System.currentTimeMillis())
                .title(deviceInfo.get("custName").toString() + "님에게 "+couponText+"이 도착했습니다.")
                .contents(pushContents)
                .receiver(deviceInfo.get("pushKey").toString())
                .data(data)
                 .build();

                log.info(pushMessage.toString());
                this.rabbitTemplate.convertAndSend(exchangeName,routingKey,pushMessage);
              /*  try {
                    Thread.sleep(10); //0.01초 대기
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }*/
            }
        }
    }

    /**
     * 1. Queue 에서 메세지를 구독
     **/
    /*@RabbitListener(queues = "${rabbitmq.queue.name}")
    public void receiveMessage(PushMessage pushMessage) {
        log.info("Received Message : {}",pushMessage.toString());
    }*/
}
