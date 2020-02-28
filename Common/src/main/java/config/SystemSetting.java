package config;

public class SystemSetting {
    private SystemSetting(){}

    public static final Integer ORDERTIME = 300;
    public static final String ORDERCANCEL = "订单已经取消";

    public static final String ORDERUNPAID="系统检测到您存在一个未支付的订单，当前无法下单";
    public static final String CREATEORDER="订单生成成功，点击前往付款";
}
