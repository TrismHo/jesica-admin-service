package com.trism.jesica.Util;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

public class AES {
	private static final String ALGORITHM = "AES";
	private static final String BLOCK_PADDING = ALGORITHM + "/CBC/PKCS5Padding";
	private static final String SPACE_REGEX = "\\s";
	private static final String REPLACE_PLUS = "+";

	public static String encrypt(SecretKeySpec keySpec, IvParameterSpec ivSpec, byte[] plain)
			throws NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException, InvalidKeyException {

		Cipher cipher = Cipher.getInstance(BLOCK_PADDING);

		cipher.init(Cipher.ENCRYPT_MODE, keySpec, ivSpec);
		return java.util.Base64.getEncoder().encodeToString(cipher.doFinal(plain));
	}

	public static byte[] decrypt(SecretKeySpec keySpec, IvParameterSpec ivSpec, String base64Cipher)
			throws NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException, InvalidKeyException {
		Cipher cipher = Cipher.getInstance(BLOCK_PADDING);
		cipher.init(Cipher.DECRYPT_MODE, keySpec, ivSpec);

		String replaceBase64Cipher = base64Cipher.replaceAll(SPACE_REGEX, REPLACE_PLUS);

		return cipher.doFinal(java.util.Base64.getDecoder().decode(replaceBase64Cipher));
	}
}
