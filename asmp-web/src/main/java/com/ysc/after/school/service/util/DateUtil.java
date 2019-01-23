package com.ysc.after.school.service.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	/**
	 * 공지사항 날짜 포맷
	 * @param date
	 * @return
	 */
	public static String convertNoticeDate(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return dateFormat.format(date);
	}
}
