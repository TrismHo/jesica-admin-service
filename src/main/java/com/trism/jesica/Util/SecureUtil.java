package com.trism.jesica.Util;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaCouponPublish;
import org.apache.commons.lang3.RandomStringUtils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.util.Base64;
import java.util.List;

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

	public static List createCouponCode(
										Long cpnNo,
										List tbMannaCouponPublishList,
									    int publishCount,
	                                    String LoginId) {
		//쿠폰코드 앞 4자리 : 알파벳으로 구성된 4글자로 일괄발급시 공통으로 사용
		String cpnCodePrefix = RandomStringUtils.randomAlphabetic(4).toUpperCase();
		LocalDateTime time = LocalDateTime.now();
		int successCount = 0;
		for (int i = 0; i < publishCount; i++) {
			TbMannaCouponPublish tbMannaCouponPublish = new TbMannaCouponPublish();
			//쿠폰코드 중간 4자리 : 알파벳+숫자로 구성
			String cpnCodeMid = RandomStringUtils.randomAlphanumeric(4).toUpperCase();

			//쿠폰코드 마지막 4자리 : 숫자로 구성
			String cpnCodeTail = RandomStringUtils.randomNumeric(4);

			//생성된 쿠폰코드 12자리
			String cpnCode = cpnCodePrefix + cpnCodeMid + cpnCodeTail;

			System.out.println("쿠폰코드: " + cpnCode);
			tbMannaCouponPublish.setCpnCode(cpnCode);
			tbMannaCouponPublish.setCpnStatus(1);
			tbMannaCouponPublish.setInsertUserId(LoginId);
			tbMannaCouponPublish.setCpnNo(cpnNo);
			tbMannaCouponPublish.setInsertDate(time);

			tbMannaCouponPublish.setRegistMax(Long.parseLong("1"));
			tbMannaCouponPublish.setTotalRegistMax(Long.parseLong("100"));

			tbMannaCouponPublishList.add(tbMannaCouponPublish);
			successCount++;
		}
		return tbMannaCouponPublishList;
	}
}
