package com.trism.jesica.Util.Secure;

import org.bouncycastle.asn1.x509.X509Name;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.x509.X509V3CertificateGenerator;

import java.io.*;
import java.math.BigInteger;
import java.security.*;
import java.security.cert.Certificate;
import java.security.cert.CertificateEncodingException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Calendar;
import java.util.Random;

@SuppressWarnings("deprecation")
public class KeyStoreUtil {

	String provider;
	String keyStoreType;
	String keyStoreFile;
	String password;

	KeyStore keystore = null;

	public KeyStoreUtil(String provider, String keyStoreType, String keyStoreFile, String password) throws Exception {

		this.provider = provider;
		this.keyStoreType = keyStoreType;
		this.keyStoreFile = keyStoreFile;
		this.password = password;

		try {
			keystore = loadKeyStore(this.keyStoreFile, this.password);
		} catch (Exception e) {
			throw e;
		}
	}

	private boolean saveKeyStore() {
		try {
			FileOutputStream fos = new FileOutputStream(new File(keyStoreFile));
			keystore.store(fos, password.toCharArray());

			fos.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	private KeyStore loadKeyStore(String filename, String password) throws KeyStoreException, NoSuchAlgorithmException,
			CertificateException, IOException, NoSuchProviderException {

		File file = new File(filename);
		KeyStore keyStore = KeyStore.getInstance(keyStoreType, provider);

		if (file.exists()) {
			keyStore.load(new FileInputStream(file), password.toCharArray());
		} else {
			keyStore.load(null, null);
			keyStore.store(new FileOutputStream(file), password.toCharArray());
		}
		return keyStore;
	}

	public Key getAESKey(String alias) throws KeyStoreException, NoSuchAlgorithmException, CertificateException,
			IOException, UnrecoverableKeyException, NoSuchProviderException {

		Key key = keystore.getKey(alias, null);

		return key;
	}

	public boolean deleteKey(String alias) throws KeyStoreException, NoSuchProviderException, NoSuchAlgorithmException,
			CertificateException, IOException {
		boolean success = false;

		if (!keystore.isKeyEntry(alias)) {
			return success;
		}

		keystore.deleteEntry(alias);

		success = saveKeyStore();

		return success;
	}

	public boolean addKeyStore(String alias, Key key)
			throws KeyStoreException, NoSuchProviderException, NoSuchAlgorithmException, CertificateException
			, InvalidKeyException, IllegalStateException, SignatureException {

		boolean success = false;

		Certificate[] chain = null;
		if (key instanceof PrivateKey) {
			chain = genCertificate(KeyUtil.generateRSAKeyPair(provider, 1024), "");
		}

		if (provider.equals(BouncyCastleProvider.PROVIDER_NAME)) {
			keystore.setKeyEntry(alias, key, null, null);
		} else if (provider.equals("nCipherKM")) {
			keystore.setKeyEntry(alias, key, password.toCharArray(), chain);
		} else {
			throw new NoSuchProviderException();
		}

		success = saveKeyStore();

		return success;
	}

	private Certificate[] genCertificate(KeyPair keyPair, String userName) throws CertificateEncodingException,
			InvalidKeyException, IllegalStateException, NoSuchAlgorithmException, SignatureException {

		Certificate trustCert = createCertificate("CN=CA", "CN=CA", keyPair.getPublic(), keyPair.getPrivate());
		Certificate[] outChain = {
				createCertificate("CN=" + userName, "CN=CA", keyPair.getPublic(), keyPair.getPrivate()), trustCert };

		return outChain;
	}

	private X509Certificate createCertificate(String dn, String issuer, PublicKey publicKey, PrivateKey privateKey)
			throws CertificateEncodingException, InvalidKeyException, IllegalStateException, NoSuchAlgorithmException,
			SignatureException {

		X509V3CertificateGenerator certGenerator = new X509V3CertificateGenerator();

		certGenerator.setSerialNumber(BigInteger.valueOf(Math.abs(new Random().nextLong())));
		certGenerator.setIssuerDN(new X509Name(dn));
		certGenerator.setSubjectDN(new X509Name(dn));
		certGenerator.setIssuerDN(new X509Name(issuer)); // Set issuer!
		certGenerator.setNotBefore(Calendar.getInstance().getTime());
		certGenerator.setNotAfter(Calendar.getInstance().getTime());
		certGenerator.setPublicKey(publicKey);
		certGenerator.setSignatureAlgorithm("SHA1withRSA");
		X509Certificate certificate = (X509Certificate) certGenerator.generate(privateKey, new SecureRandom());

		return certificate;
	}
}
