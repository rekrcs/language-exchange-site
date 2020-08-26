package com.project.byk.le.util;

import java.security.MessageDigest;
import java.util.Random;

public class Util {

	public static String getAuthCode() {
		Random rand = new Random();
		String getAuthCode = "";

		for (int i = 0; i < 6; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			getAuthCode += ran;
		}
		return getAuthCode;
	}

	public static String getTemporaryPwSHA256(String temporaryPw) {
		String temporaryPwSHA256 = "";
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(temporaryPw.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();

			for (int i = 0; i < hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if (hex.length() == 1)
					hexString.append('0');
				hexString.append(hex);
			}

			temporaryPwSHA256 = hexString.toString();
			return temporaryPwSHA256;
		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}
	}

}
