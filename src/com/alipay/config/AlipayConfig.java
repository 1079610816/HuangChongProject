package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016092200567019";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key ="MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCNpi3f+IwkcgSH6xxaBu41Eu6ecoaUfmbslB2b25oUHGgFeNvho3rfTwYLnp92KNRaCS8UwzV3rJ/SJkqG+K8zjfUqnURwGhDZIdD4OTDEo7+Ip/gdJO+mIY5mKr66hTBafCc/cGDlWtrgYc1DMDpqRZW3tEaRf++0LhJElOymYw5NbjE2ggXKFZNdXAZoGl+zLyqMAsKJdghOvveil3kbFnus8JzMavjzbB2Daxf3WozS/Trnp/4SrznVxgJ/qcEBeCQCAdGsC7tnfGZ1v/j8RX93059ZJrBT+WAX+4McniIBLC0HNSdOrw8bQMKshHwpumMgGkFSWFC1lsHj43zxAgMBAAECggEAEDx0FbAPoD3RdyLj5Q3WUA8TeuX1tx+l/IgdvLe3OYboBXiM+5gZhW8xajOMY6bacFeNJfwaLNWEnDn3YPEwY+BpsbDFH3RdagYOReWISYHbenaGYhDRx2EhSWSs6ARMPpLsjMD82k1HuWB8fq8Qgw3m01++lv7rIuQFBAdt+MRFzzfj6EKyubY+eTJ8URwAWao44h3ujPD+tJy6SbDtIwfUqa5oMHYMtgftMAvDClcJspU0paIdeFPMc7FcbNrtSDmyMF57xbDPYkS1cw2QJeh17FaVs1Gd1GIMmJl+0YkdDxPQKf/V2WadxEZmWYgUgI49HSX7kuIpOkzwGDRaYQKBgQDbcDBlp+wd7OT9Q+ldaFx/Sl2IZ5Ml1jStQ75YP3APOj65CSoCzymugRq7IbqOFYXeXBiRfLTz4/PSJhOcSharRPX5t7/3V9qC8n6FyUwtT8Yglu3D1d7mljVWL/XwdjyP40puNpF7fMWCelMVcgqKvAwsFb+dFOTKUny65TxJPwKBgQClQAMStVi8F8W1eJAwX7JgWkgkCgf9YthExNHEhNnA/DWOPkCtHKrlKV4Wl12Nw397sy6SJb5Q+7T4vjiHh+5X4M2Z/4iYe5FJQVM4eAEuhTfPlX+NM/feQbkZoO4lfpRT81JeGxFGFjC798FrzKjnC/xESK5Qg1JlhPhpgv/9zwKBgDJJzJ2PVRoqjvPHm3RvlTsKpNK8wckbBOlsK/P3Xcvvki4/fmQ0a531MlYOTb2ACzTBMFQvGx0FcXwIg9f+VqGbZS98P78EYCxAPGSWlCGSNZqEXCrUGYgIhmKhDSC1R/3FneoSEVcWagET3XR9tRLEM5nqxgXOovwG2VTPcfhrAoGAUpAw+N/yfcfC2HBsWj71+H4jHR6F72u7cmCEDhPyWCGrAG7KEbQJDoYkpFTsQTA0ObHEyvBgrkWUndMsm0qnIvEGyLKLpOPYKymgUs5iiMO2ptii6gHVDg74VH27frBHm8oulSYg80uS/ddDpICUwxuR5uwJa+CxAlf1ZYI2NLECgYEAtRYNzZsLveNB4b7/yGduGNYGQ5im3yEVYCQgDHGuwWsjMtOdN5XRongSazhYONC9/x2ltUzlUuwmtsCbBtJnjw9oCuY+U14CJYXA+QF0C/0OpkDYqRSkg5nbnpZeQvqYFypAcBkaIkw7m62mcforVRzzEeMZGDEPDdjUMQm1Zgc=";
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAy+7jzc37Gl9RAxCrMqKHBzAW6KgMe6l4+RpyfcHy1Pi0DRZk9aBU4yV/3pr29P+emsCjSxzrCl7VWdJ0IsLwzyP9mjjJQmdqt98adByvOkZ1+o3zyv6vHQj4lv50Uw5cG1LTzR4ya3VJlWBCOEFGra0kbkT8QZ1vVlbqV/OOjNX1+JOk87VCWYwYUnRtNmATu97/zSWMmw5IhM5FqVMq4oKgSe3Y/gf5TVpYwDCrk7UrtQ8Wy3O7NqOh95KRrpjM9KdmC88tbV+lH2YV9+uZl7mUa3gVQFVREEB/4UhwnXHjyk51juJf3nLKQ1QQcFXo33G7CRLMR0i1xn7mWTzX8wIDAQAB";
	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/HuangChongProject/bs.action?op=failed";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/HuangChongProject/bs.action?op=success";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

