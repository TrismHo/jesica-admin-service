package com.trism.jesica.Util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class SecureUtil {


	private static final String SHA_256 = "SHA-256";

	public static String encodePassword(String msg) {
		try {
			return encodeSha256(msg);

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
	}

	private static String encodeSha256(String msg) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance(SHA_256);
		byte[] hashValue = md.digest(msg.getBytes());
		
		return Base64.getEncoder().encodeToString(hashValue);
	}

}
