package com.etc.huangchong.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class WeekUtil {

	/**
	 * 基姆拉尔森计算公式根据日期判断周几
	 * @param date
	 * @return
	 */
	public static String CalculateWeekDay(String date) {

		// 2018-10-10
		int y = Integer.parseInt(date.substring(0, 4));
		int m = Integer.parseInt(date.substring(5, 7));
		int d = Integer.parseInt(date.substring(8));

		String weekDay = "";
		if (m == 1 || m == 2) {
			m += 12;
			y--;
		}
		int iWeek = (d + 2 * m + 3 * (m + 1) / 5 + y + y / 4 - y / 100 + y / 400) % 7;
		switch (iWeek) {
		case 0:
			weekDay = "周一";
			break;
		case 1:
			weekDay = "周二";
			break;
		case 2:
			weekDay = "周三";
			break;
		case 3:
			weekDay = "周四";
			break;
		case 4:
			weekDay = "周五";
			break;
		case 5:
			weekDay = "周六";
			break;
		case 6:
			weekDay = "周日";
			break;
		}
		return weekDay;
	}
/**
 * 
 * 计算两个日期之间相隔多少天
 * @param smdate
 * @param bdate
 * @return
 */
	public static int daysBetween(String smdate, String bdate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		long time1 = 0;
		long time2 = 0;

		try {
			cal.setTime(sdf.parse(smdate));
			time1 = cal.getTimeInMillis();
			cal.setTime(sdf.parse(bdate));
			time2 = cal.getTimeInMillis();
		} catch (Exception e) {
			e.printStackTrace();
		}
		long between_days = (time2 - time1) / (1000 * 3600 * 24);

		return Integer.parseInt(String.valueOf(between_days));
	}

	public static void main(String args[]) {
		System.out.println(CalculateWeekDay("2018-10-10"));
		System.out.println(daysBetween("2018-10-16","2018-10-28"));
	}

}
