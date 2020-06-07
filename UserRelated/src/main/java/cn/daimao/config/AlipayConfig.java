package cn.daimao.config;

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
    public static String app_id = "2016102200734918";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCIWBUaqDa+73cDSSrUa1/jGprwZsCvuOjUnKoJr+AYM8ivsDBZIpmYQ0INyWSlIBoMWzaHje63wQmOzeX54SVFHdg2mcnh2tOAm1X7MEr4H9/BW5omCKvJ33HmGK42sH9u1T7RkuL7mWjM1YTFbLRRHi0vpEYb9/23+sbRIbGVdgjziVzzXX+Clg5YZlCxoFdSLPhFB7Zv8h5rLYxHy70KEK6OcqwagfFso0+UhC+ykU+tEJ12z5NLVey5XiBM9uBdeZGJgfFpDjWdHtpmXpzCSQS7lhs0mZCW2PPe327mdHE3XVAWa9lXojL4/sFOGK2JL4VW1tO7CYY0VqogxwofAgMBAAECggEAcEpS/0Rg6jngg8VDz/Sq4SitSKbntRGOOGTaqeW+o1AqzX9HInIbm8pw4VfnWxOoQFry+wtK+u2yCHnNGVJzVoww4S8hlLCbloTYeGsao2Xk66OcvgxQJ4+uh7n16TbNjSN1fDcEWADNzj1f/xT7IP/AaUdbMne470hLbDvavONd8qTnb2aeQIc6mSNwFnVV05q+QPVJ5oaB61At2ceum0zxmEibzCc8pfN6FSiVvLZgadQDOvVR/XCWR5YAe6DWq4K/Gu5wDIaCL94bd2g27/wVi2Y++JvkXUu3m0S9Z4aKvtSJORtWWD2udJQCENJIAyXhkswkJ+h/klFDD2h+0QKBgQDzm3gaa7Sm9slljxdzS7aisrxp9IYu0kNSQzsjgfj1BsTls7fJuxV6RUmlz7j2+s9vks/13MjIH6NUej44I+QrqjfOJrcNrlpTS4iLYv+ji2/WORV47a+bdnfitCI2e3sdqBiAhE3kz0eMzYphWoY7qxzeNskzcj0cAggyDK/lpwKBgQCPR7WxP2G2hQKRIubnQSEiiTFOBn/WUjTeY4SJ0lx1GgfznGSD16gvSHltK4Ipb0U+og9N3Y3JjynscAhPeQwEU+Xuq+XIOG9uPQBb72tBjXWC13V9sNCY4B8ZF6u/u4rd6zgBMDXtuUlvBbtYVcmBnxi+fFaAZbowsHSHgkG2yQKBgQCWPrjgcrVElMi53nr0HSpTRjF2l916WywyPEzpJWxKkxY1JZag0MX6V2mI3oiRqzbs9XtVhApBg2HU5GAjd99uHtm0R6R2x6Xl4Zwhe7l3QLSFR0e7Ab1hALwIEllXiOjx7Y7PFMqF6GGUseA7Ev3fJzXyx49oL3kJISe01qZV2QKBgHufEovwtL0G/BT/eRw0HIOwvUKl5uyjFwx97t//CVjb8dplqG/8xRauwF3J+U8Iu0T0DKJRM0Gh7Tkb3H+9X/nn7W5FEEf1MWd66HFqHC99/tK6VZvxz7jnPs2ml8Ag7wrUJQkZcJ5AjLRmzKLFucvF2lKX8wZrPv89b/1vDIXJAoGBAII7L2Y356CWkkMfbMHyWn2Y350RF5ekdKw0pwHB/VIQNR79n3+c29XvhbQqAwF7mKGI2hgvDQr349ZY7fm7T/x6j8PXs9HXK6+UeGDuHJCcfuUs6ONzsbamS1JppaU6FOs1H4KqLFlYz0bh0Word/cAfvDJqs/anUMVvpyVhK/9";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAh39tlnZRmVhw9q5Xv2E2s//qdxhADXpBJmXnTBUEpgiSR6ODLFSUlGs8179yctIvH+Dlm+Ql6SZqJs9ubvUQLTb3rJ4afgD+ntFWgZJX3MmDDCw2/V6/yWlTw5H7rnziyDWni1qSJIqZ+z6H3akQK1sh9dg8lS0LsDJdMnW6eY1XcFKNWHnRsK1G2cbyyYTg5kmKt6l9HB9FF/CRsU0Azol1iflEFIXYR3sqTOpQDIyYDd6CAoZKuewaBjYDX4d7kiLk2nbg6dMcuagJlHA2vOWs4V3W9lUHo7AE/SxR7+4vrL2ySmFJUTYsNMVl4NTFxo3vBFJeJ+A8xzodnEtUowIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8080/#/aliPay";

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


