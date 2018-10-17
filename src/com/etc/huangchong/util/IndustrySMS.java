package com.etc.huangchong.util;

import java.net.URLEncoder;



/**
 * 验证码通知短信接口
 * 
 * @ClassName: IndustrySMS
 * @Description: 验证码通知短信接口
 *
 */
public class IndustrySMS
{
	private static String operation = "/industrySMS/sendSMS";
//	private static int  number=(int)((Math.random()*9+1)*100000);
	private static String accountSid = Config.ACCOUNT_SID;
//	private static String to = "18359009725";
//	private static String smsContent = "【黄虫短租】尊敬的用户，您好，您的验证码："+number+"，如非本人操作，请忽略此短信。";
	
	/**
	 * 验证码通知短信
	 */
	public static String execute(String to,int number)
	{
		String tmpSmsContent = null;
		String smsContent = "【黄虫短租】尊敬的用户，您好，您的验证码："+number+"，如非本人操作，请忽略此短信。";
	    try{
	      tmpSmsContent = URLEncoder.encode(smsContent, "UTF-8");
	    }catch(Exception e){
	      
	    }
	    String url = Config.BASE_URL + operation;
	    String body = "accountSid=" + accountSid + "&to=" + to + "&smsContent=" + tmpSmsContent
	        + HttpUtil.createCommonParam();

	    // 提交请求
	    String result = HttpUtil.post(url, body);
	    return result;
//	    System.out.println("result:" + System.lineSeparator() + result);
	}
}
