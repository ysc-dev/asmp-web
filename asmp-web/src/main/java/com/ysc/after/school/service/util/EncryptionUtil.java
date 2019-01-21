package com.ysc.after.school.service.util;

import java.security.MessageDigest;

/**
 * 암호화 유틸
 * 
 * @author hgko
 *
 */
public class EncryptionUtil {

	/**
	 * SHA-256 암호화
	 * @param password
	 * @return
	 */
	public static String sha256(String password) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(password.getBytes());
			
			byte byteData[] = md.digest();
			
//			StringBuffer sb = new StringBuffer();
//			for (int i = 0; i < byteData.length; i++) {
//				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
//			}
			
			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				String hex = Integer.toHexString(0xff & byteData[i]);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}
			
			return hexString.toString();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

}
