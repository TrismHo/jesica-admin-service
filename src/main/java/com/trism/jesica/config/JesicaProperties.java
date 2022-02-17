package com.trism.jesica.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "file")
public class JesicaProperties {
    private BaseImgPath baseImgPath;
    private StoreImgPath storeImgPath;
    private MessageFile messageFile;
    private DeliveryPath deliveryPath;
    private ImgPath imgPath;
    private SystemImgPath systemImgPath;
    private ProfilePath profilePath;
    private LicensePath licensePath;
    private CareerPath careerPath;
    private ServicePath servicePath;
    private ApiServer apiServer;

    private BoardPath boardPath;
    private EventPath eventPath;
    private PlatFormPath platFormPath;
    private ImgHttp imgHttp;



    @Data
    public static class BaseImgPath {
        private String path;
    }
    @Data
    public static class StoreImgPath {
        private String path;
        private String thumbPath;
    }
    @Data
    public static class MessageFile {
         private String path;
     }
    @Data
    public static class DeliveryPath {
         private String path;
     }
    @Data
    public static class SystemImgPath {
        private String path;
        private String thumbPath;
     }

    @Data
    public static class ServicePath {
        private String path;
    }
    @Data
    public static class ImgPath {
        private String path;
    }
    @Data
    public static class ProfilePath {
        private String path;
        private String thumbPath;
    }
    @Data
    public static class LicensePath {
        private String path;
    }
    @Data
    public static class CareerPath {
        private String path;
    }
    @Data
    public static class ApiServer {
        private String server;
    }
    @Data
    public static class BoardPath {
        private String path;
    }
    @Data
    public static class EventPath {
        private String path;
    }
    @Data
    public static class ImgHttp {
        private String path;
    }
    @Data
    public static class PlatFormPath {
        private String path;
    }
}
