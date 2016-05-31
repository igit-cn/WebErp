package com.artwell.com.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import com.sun.org.apache.xml.internal.security.exceptions.Base64DecodingException;

public class SHAConverter{

	public  boolean verifyByPwd(String ldappw,String inputpw) throws Base64DecodingException {
		
		// MessageDigest 提供了消息摘要算法，如 MD5 或 SHA，的功能，这里LDAP使用的是SHA-1
		MessageDigest md;
		boolean flg = false;
		try {
			md = MessageDigest.getInstance("SHA-1");
		
		/**
		 * ldap中的密码
		 * 例: 
		 */
		// 取出加密字符
		if (ldappw.indexOf("{SSHA}") != -1 ) {
			ldappw = ldappw.substring(6);
		} 
		
		// 解码BASE64
		byte[] ldappwbyte = Base64.decode(ldappw);
		byte[] shacode;
		byte[] salt;
		
		// 前20位是SHA-1加密段，20位后是最初加密时的随机明文
		if (ldappwbyte.length <= 20) {
			shacode = ldappwbyte;
			salt = new byte[0];
		} else {
			shacode = new byte[20];
			salt = new byte[ldappwbyte.length - 20];
			System.arraycopy(ldappwbyte, 0, shacode, 0, 20);
			System.arraycopy(ldappwbyte, 20, salt, 0, salt.length);
		}
		
		// 把用户输入的密码添加到摘要计算信息
		md.update(inputpw.getBytes());
		// 把随机明文添加到摘要计算信息
		md.update(salt);
		
		// 按SSHA把当前用户密码进行计算
		byte[] inputpwbyte = md.digest();
		
		// 返回校验结果
		flg = MessageDigest.isEqual(shacode, inputpwbyte);
		
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return flg;
		 
	}
}
	

