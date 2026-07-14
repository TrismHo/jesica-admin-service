package com.trism.jesica;


/*import com.trism.manna.Service.LangService;
import com.trism.manna.Util.PropertiesGenerateUtil;
import com.trism.manna.persistence.Entitiy.TblSiteLang;*/

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.MessageSource;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

import javax.crypto.*;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.Security;

@Slf4j
@EnableCaching
@EnableJpaAuditing
//SpringBootServletInitializer 톰캣구동을 위해
@SpringBootApplication
@EnableRedisHttpSession
@EnableScheduling
public class JesicaApplication extends SpringBootServletInitializer implements CommandLineRunner
 {
     @Override
     protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
         return builder.sources(JesicaApplication.class);
     }

/*
    @Autowired
    LangService langService;
*/

    @Autowired
    MessageSource messageSource;


    public static void main(String[] args) {
        String providerName = "BC";
        KeyGenerator keyGenerator = null;
        if(Security.getProvider(providerName) == null)
            System.out.println(providerName + " provider not installed");
        else
            System.out.println(providerName + " is installed");
        // Blowfish는 블록 암호화 방식
        System.out.println("Attepting to get a Blowfish key...");
        try {
            keyGenerator = KeyGenerator.getInstance("Blowfish");
        } catch (NoSuchAlgorithmException e) {
        }
        keyGenerator.init(128);
        SecretKey key = keyGenerator.generateKey();
        System.out.println("OK");

        //암호화 한다
        System.out.println("Attempting to get a Cipher and encrypt...");
        Cipher cipher = null;
        byte[] ciphertext = null;
        try {
            cipher = Cipher.getInstance("Blowfish/ECB/PKCS5Padding");
        } catch (NoSuchAlgorithmException e) {}
        catch (NoSuchPaddingException e) {}
        try {
            cipher.init(Cipher.ENCRYPT_MODE, key);
        } catch (InvalidKeyException e) {}
        try {
            ciphertext = cipher.doFinal("This is a test".getBytes("UTF8"));
        } catch (IllegalBlockSizeException e) {}
        catch (BadPaddingException e) {}
        catch (UnsupportedEncodingException e) {}
        System.out.println("OK");
        System.out.println("Test completed successfully : " + ciphertext);


        SpringApplication.run(JesicaApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {

       /* List<TblSiteLang> tblSiteLang = langService.tblSiteLang();

        PropertiesGenerateUtil propertiesGenerateUtil = new PropertiesGenerateUtil();

        String[] language = {"ko","la","en"};
        for(int i = 0 ; i < language.length ; i++) {
            String result = propertiesGenerateUtil.generate(tblSiteLang, language[i]);
            if ("success".equals(result)) {
                log.info("언어팩 생성 성공"+language[i]);
            } else {
                log.info("언어팩 생성 실패"+language[i]);
            }
        }*/

    }
}
