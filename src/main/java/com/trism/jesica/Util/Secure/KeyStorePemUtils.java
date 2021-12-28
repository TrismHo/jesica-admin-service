package com.trism.jesica.Util.Secure;

import org.bouncycastle.util.io.pem.PemObject;
import org.bouncycastle.util.io.pem.PemReader;
import org.bouncycastle.util.io.pem.PemWriter;
import org.springframework.core.io.Resource;

import java.io.*;
import java.security.Key;

public class KeyStorePemUtils {

    public static PemObject loadKeystore(Key key, String description) {
        return new PemObject(description, key.getEncoded());
    }

    public static PemObject loadKeystore(Resource resource) throws IOException {
        try (PemReader pemReader = new PemReader(new InputStreamReader(resource.getInputStream()))) {
            return pemReader.readPemObject();
        } catch (Exception e) {
            throw new RuntimeException("Load KeyStore Error :", e);
        }
    }

    public static PemObject loadKeystore(String filePath, String fileName) throws IOException {
        File file = new File(filePath, fileName);
        try (PemReader pemReader = new PemReader(new InputStreamReader(new FileInputStream(file)))) {
            return pemReader.readPemObject();
        } catch (Exception e) {
            throw new RuntimeException("Load KeyStore Error :", e);
        }
    }

    public static void saveKeystore(String filePath, String fileName, PemObject pemObject) {
        File file = new File(filePath, fileName);
        try (PemWriter pemWriter = new PemWriter(new OutputStreamWriter(new FileOutputStream(file)))) {
            pemWriter.writeObject(pemObject);
        } catch (Exception e) {
            throw new RuntimeException("Save KeyStore Error :", e);
        }
    }
}
