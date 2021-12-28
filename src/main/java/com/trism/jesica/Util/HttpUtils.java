package com.trism.jesica.Util;

import org.apache.commons.lang3.StringUtils;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.web.client.RestTemplate;

import java.net.InetAddress;
import java.net.InetSocketAddress;

public class HttpUtils {
    public static String getRemoteIP(ServerHttpRequest request) {
        InetSocketAddress socketAddress = request.getRemoteAddress();
        if (socketAddress == null) {
            return "";
        }
        return socketAddress.getHostString();
    }

    public static String getServerIP() {
        String ip = null;
        try {
            ip = InetAddress.getLocalHost().getHostAddress();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return ip;
    }

    public static String getAuthorization(HttpHeaders httpHeaders) {
        String bearerAuthorization = httpHeaders.getFirst(HttpHeaders.AUTHORIZATION);
        if (StringUtils.isBlank(bearerAuthorization)) {
            return null;
        }

        String authorization = bearerAuthorization;

        if (bearerAuthorization.startsWith("Bearer ")) {
            authorization = bearerAuthorization.substring(7);
        }

        return authorization;
    }

    public static String getAuthorization(String bearerAuthorization) {
        if (StringUtils.isBlank(bearerAuthorization)) {
            return null;
        }

        String authorization = bearerAuthorization;

        if (bearerAuthorization.startsWith("Bearer ")) {
            authorization = bearerAuthorization.substring(7);
        }

        return authorization;
    }

    /**
     * init getURL
     * @param api apiName
     * @return String
     */
    public static String getAPIUrl(String url, String api) {
        return String.format("%s/%s",url, api);
    }


    /**
     * default rest http send
     * @Param restTemplate restTemplate
     * @Param method method GET | POST | UPDATE | DELETE
     * @param url url
     * @param entity http entity
     * @param <P> request
     * @param <V> response
     * @return V
     */
    public static <P, V> ResponseEntity<V> getExchange(RestTemplate restTemplate, HttpMethod method, String url, HttpEntity<P> entity) {
        return restTemplate.exchange(url, method, entity, new ParameterizedTypeReference<V>(){});
    }

    public static  <T> HttpEntity<T> createHttpEntity(T po, HttpHeaders httpHeaders) {
        return new HttpEntity<>(po, httpHeaders);
    }

    public static  <T> HttpEntity<T> createHttpEntity(HttpHeaders httpHeaders) {
        return new HttpEntity<>(httpHeaders);
    }
}
