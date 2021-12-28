package com.trism.jesica.Util;

public class StringUtil {

	public static String checkNull(String src) {
		if (src == null) {
			return new String("");
		}
		return src;
	}
}
