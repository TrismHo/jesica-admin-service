package com.trism.jesica.Util.Secure;

import com.trism.jesica.Util.AES;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;

import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

@RequiredArgsConstructor
public class CipherAESUtils {

    private final SecretKeySpec secretKeySpec;
    private final IvParameterSpec ivParameterSpec;

    public String encryptAES(String plain) {
        if (StringUtils.isBlank(plain)) {
            return null;
        }

        String result = null;
        try {
            result = AES.encrypt(secretKeySpec, ivParameterSpec, plain.getBytes());
        } catch (Exception e) {
            throw new RuntimeException("Encrypt Exception! ",e);
        }
        return result;
    }

    public String decryptAES(String cipher) {
        if (StringUtils.isBlank(cipher)) {
            return null;
        }

        String result = null;
        try {
            byte[] plain = AES.decrypt(secretKeySpec, ivParameterSpec, cipher);
            result = new String(plain);
        } catch (Exception e) {
            throw new RuntimeException("Decrypt Exception! ",e);
        }
        return result;
    }

}
