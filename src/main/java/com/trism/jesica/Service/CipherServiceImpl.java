package com.trism.jesica.Service;

import com.trism.jesica.Util.AES;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

@RequiredArgsConstructor
@Service
public class CipherServiceImpl implements CipherService {

    private final SecretKeySpec secretKeySpec;
    private final IvParameterSpec ivParameterSpec;

    public String encryptAES(String plain) {
        String result = null;
        try {
            result = AES.encrypt(secretKeySpec, ivParameterSpec, plain.getBytes());
        } catch (Exception e) {
        }
        return result;
    }

    public String decryptAES(String cipher) {
        String result = null;
        try {
            byte[] plain = AES.decrypt(secretKeySpec, ivParameterSpec, cipher);
            result = new String(plain);
        } catch (Exception e) {
        }
        return result;
    }
}
