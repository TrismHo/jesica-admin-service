
package com.trism.jesica.config;

import lombok.RequiredArgsConstructor;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.rabbit.annotation.RabbitListenerConfigurer;
import org.springframework.amqp.rabbit.listener.RabbitListenerEndpointRegistrar;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.converter.MappingJackson2MessageConverter;
import org.springframework.messaging.handler.annotation.support.DefaultMessageHandlerMethodFactory;

@RequiredArgsConstructor
@Configuration
public class RabbitMqConfig implements RabbitListenerConfigurer {
/*
    private final RabbitMqProperties rabbitMqProperties;

    @Value("${rabbitmq.queue.name}")
    private String queueName;

    @Value("${rabbitmq.exchange.name}")
    private String exchangeName;

    @Value("${rabbitmq.routing.key}")
    private String routingKey;

    // org.springframework.amqp.core.Queue
    @Bean
    public Queue queue() {
        return new Queue(queueName);
    }

    *//**
     * 지정된 Exchange 이름으로 Direct Exchange Bean 을 생성
     *//*
    @Bean
    public DirectExchange directExchange() {
        return new DirectExchange(exchangeName);
    }

    *//**
     * 주어진 Queue 와 Exchange 을 Binding 하고 Routing Key 을 이용하여 Binding Bean 생성
     * Exchange 에 Queue 을 등록한다고 이해하자
     **//*
    @Bean
    public Binding binding(Queue queue, DirectExchange exchange) {
        return BindingBuilder.bind(queue).to(exchange).with(routingKey);
    }

    *//**
     * RabbitMQ 연동을 위한 ConnectionFactory 빈을 생성하여 반환
     **//*
    @Bean
    public CachingConnectionFactory connectionFactory() {
        CachingConnectionFactory connectionFactory = new CachingConnectionFactory();
        connectionFactory.setHost(rabbitMqProperties.getHost());
        connectionFactory.setPort(rabbitMqProperties.getPort());
        connectionFactory.setUsername(rabbitMqProperties.getUsername());
        connectionFactory.setPassword(rabbitMqProperties.getPassword());
        return connectionFactory;
    }

    *//**
     * RabbitTemplate
     * ConnectionFactory 로 연결 후 실제 작업을 위한 Template
     *//*
    @Bean
    public RabbitTemplate rabbitTemplate(ConnectionFactory connectionFactory) {
        RabbitTemplate rabbitTemplate = new RabbitTemplate(connectionFactory);
        rabbitTemplate.setMessageConverter(jackson2JsonMessageConverter());
        return rabbitTemplate;
    }

    *//**
     * 직렬화(메세지를 JSON 으로 변환하는 Message Converter)
     *//*
    @Bean
    public MessageConverter jackson2JsonMessageConverter() {
        return new Jackson2JsonMessageConverter();
    }*/
    @Bean
    public DirectExchange messageExchange(@Value("${rabbitmq.exchange.name}") final String exchangeName) {
        return new DirectExchange(exchangeName);
    }

    @Bean
    public MappingJackson2MessageConverter consumerJackson2MessageConverter() {
        return new MappingJackson2MessageConverter();
    }

    @Bean
    public DefaultMessageHandlerMethodFactory messageHandlerMethodFactory() {
        DefaultMessageHandlerMethodFactory factory = new DefaultMessageHandlerMethodFactory();
        factory.setMessageConverter(consumerJackson2MessageConverter());

        return factory;
    }

    public void configureRabbitListeners(RabbitListenerEndpointRegistrar registrar) {
        registrar.setMessageHandlerMethodFactory(messageHandlerMethodFactory());
    }
}
