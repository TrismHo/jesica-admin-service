package com.trism.jesica.config;

import com.trism.jesica.Util.Secure.KeyStorePemUtils;
import com.trism.jesica.Util.Secure.token.AuthTokenProvider;
import com.trism.jesica.Util.Secure.KeyUtil;
import lombok.extern.slf4j.Slf4j;
import org.bouncycastle.util.io.pem.PemObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Base64;


@Slf4j
@Configuration
public class KeyGeneratorConfig {

    @Autowired
    private ResourceLoader resourceLoader;

    @Value("${security.cert-key-path}")
    private String certKeyPath;

    @Value("${security.iv}")
    private String iv;//Encoded iv


    private static final String ALGORITHM = "PBKDF2WithHmacSHA1";

//    @Bean(name = "privateKey")
//    public PrivateKey generatePrivateKey() throws NoSuchAlgorithmException, InvalidKeySpecException, NoSuchProviderException {
//        return KeyUtil.generatePrivateKey("ECDSA", privateKey, KeyUtil.PROVIDER);
//    }
//
//    @Bean(name = "publicKey")
//    public PublicKey generatePublicKey() throws NoSuchAlgorithmException, InvalidKeySpecException, NoSuchProviderException {
//        return KeyUtil.generatePublicKey("ECDSA", publicKey, KeyUtil.PROVIDER);
//    }

    @Value("${security.jwt.cert-key-path}")
    private String jwtCertKeyPath;

    @Bean
    public AuthTokenProvider authTokenProvider() {
        log.debug("@@ init authTokenProvider...");


        PemObject pemObjectByJWT = null;
        try {
            Resource jwtResource = resourceLoader.getResource("classpath:" + jwtCertKeyPath);
            pemObjectByJWT = KeyStorePemUtils.loadKeystore(jwtResource);
        } catch (IOException e) {
            log.error("JWT PEM load Exception :", e);
        }


        assert pemObjectByJWT != null;

        return new AuthTokenProvider(pemObjectByJWT.getContent());
    }


    @Bean(name = "secretKeySpec")
    public SecretKeySpec generateSecretKeySpec() throws NoSuchAlgorithmException, InvalidKeySpecException {
        log.debug("@@ init generateSecretKeySpec..");

        PemObject pemObjectByAESPwd = null;
        try {
            Resource aesPwdResource = resourceLoader.getResource("classpath:" + certKeyPath);;
            pemObjectByAESPwd = KeyStorePemUtils.loadKeystore(aesPwdResource);
        } catch (Exception e) {
            log.error("AES Password PEM load Exception :", e);
        }

        assert pemObjectByAESPwd != null;

        return KeyUtil.generateSecretKey(ALGORITHM, Base64.getEncoder().encodeToString(pemObjectByAESPwd.getContent()));
    }

    @Bean(name = "ivParameterSpec")
    public IvParameterSpec generateIvParameterSpec() throws NoSuchAlgorithmException, InvalidKeySpecException, UnsupportedEncodingException {
        return KeyUtil.generateVector(ALGORITHM, iv);
    }
}
