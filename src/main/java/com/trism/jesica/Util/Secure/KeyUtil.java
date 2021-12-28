package com.trism.jesica.Util.Secure;

import org.bouncycastle.jce.ECNamedCurveTable;
import org.bouncycastle.jce.spec.ECNamedCurveParameterSpec;

import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.security.*;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

public class KeyUtil {

	/**
	 * Bouncy castle
	 */
	public static final String PROVIDER = "BC";

	public static SecretKey generateAESKey(int keyLength) throws NoSuchAlgorithmException, NoSuchProviderException {
		return generateKey("AES", keyLength);
	}

	public static SecretKey generateKey(String algorithm, int keyLength)
			throws NoSuchAlgorithmException {

		KeyGenerator keyGen = KeyGenerator.getInstance(algorithm);
		SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
		keyGen.init(keyLength, random);
		return keyGen.generateKey();
	}

	public static SecretKeySpec generateSecretKey(String algorithm, String password) throws NoSuchAlgorithmException, InvalidKeySpecException {
		//암호키를 생성하는 팩토리 객체 생성
		SecretKeyFactory factory = SecretKeyFactory.getInstance(algorithm);
		//다이제스트를 이용하여, SHA-512로 단방향 해시 생성 (salt 생성용)
		MessageDigest digest = MessageDigest.getInstance("SHA-512");
		byte[] keyDecode = Base64.getDecoder().decode(password);
		byte[] saltBytes = digest.digest(keyDecode);
		PBEKeySpec pbeKeySpec = new PBEKeySpec(password.toCharArray(), saltBytes, 65536, 256);

		SecretKey secretKey = factory.generateSecret(pbeKeySpec);

		// 256bit = 32byte
		byte[] key = new byte[32];
		System.arraycopy(secretKey.getEncoded(), 0, key, 0, 32);
		//AES 알고리즘을 적용하여 암호화키 생성
		return new SecretKeySpec(key, "AES");
	}

	/**
	 * 16자리 초기화벡터 입력하여 ivSpec을 생성한다.
	 * @param  iv                           절대 유출되서는 안되는 키 값이며, 이것으로 키스펙을 생성
	 * @throws UnsupportedEncodingException 지원되지 않는 인코딩 사용시 발생
	 * @throws NoSuchAlgorithmException     잘못된 알고리즘을 입력하여 키를 생성할 경우 발생
	 * @throws InvalidKeySpecException      잘못된 키 스펙이 생성될 경우 발생
	 * @
	 */
	public static IvParameterSpec generateVector(String algorithm, String iv)
			throws NoSuchAlgorithmException, InvalidKeySpecException {

		SecretKeyFactory factory = SecretKeyFactory.getInstance(algorithm);

		MessageDigest digest = MessageDigest.getInstance("SHA-512");

		byte[] vectorBytes = Base64.getDecoder().decode(iv);
		byte[] saltBytes = digest.digest(vectorBytes);

		// 128bit
		PBEKeySpec pbeKeySpec = new PBEKeySpec(iv.toCharArray(), saltBytes, 65536, 128);
		Key secretIV = factory.generateSecret(pbeKeySpec);

		// 128bit = 16byte
		byte[] ivBytes = new byte[16];
		System.arraycopy(secretIV.getEncoded(), 0, ivBytes, 0, 16);

		return new IvParameterSpec(ivBytes);
	}



	public static KeyPair generateRSAKeyPair(String provider, int keyLength) throws NoSuchAlgorithmException, NoSuchProviderException {
		return generateKeyPair("RSA", keyLength, provider);
	}

	public static KeyPair generateKeyPair(String algorithm, int keyLength, String provider)
			throws NoSuchAlgorithmException, NoSuchProviderException {

		KeyPairGenerator keyGen = KeyPairGenerator.getInstance(algorithm, provider);
//		keyGen.initialize(keyLength, new SecureRandom());
		KeyPair keyPair = keyGen.generateKeyPair();

		return keyPair;
	}

	public static KeyPair generateECKeyPair(String provider) throws NoSuchProviderException, NoSuchAlgorithmException, InvalidAlgorithmParameterException {
		String ecSpec = "prime256v1";
		ECNamedCurveParameterSpec cspec = ECNamedCurveTable.getParameterSpec(ecSpec);
		KeyPairGenerator g = KeyPairGenerator.getInstance("ECDSA", provider);
		g.initialize(cspec);
		return g.generateKeyPair();
	}

	public static PublicKey generatePublicKey(String algorithm, String publicKey, String provider) throws NoSuchProviderException, NoSuchAlgorithmException, InvalidKeySpecException {
		KeyFactory kf = KeyFactory.getInstance(algorithm, provider);
		X509EncodedKeySpec pubKeySpecX509EncodedKeySpec = new X509EncodedKeySpec(Base64.getDecoder().decode(publicKey));
		return kf.generatePublic(pubKeySpecX509EncodedKeySpec);
	}

	public static PrivateKey generatePrivateKey(String algorithm, String privateKey, String provider) throws NoSuchAlgorithmException, InvalidKeySpecException, NoSuchProviderException {
		KeyFactory kf = KeyFactory.getInstance(algorithm, provider);
		PKCS8EncodedKeySpec privKeySpecPKCS8 = new PKCS8EncodedKeySpec(Base64.getDecoder().decode(privateKey));
		return kf.generatePrivate(privKeySpecPKCS8);
	}

}
