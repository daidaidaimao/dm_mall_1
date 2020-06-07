package pojo;

public class Const {
    public enum OrderStatusEnum {
        CANCELED(0, "已取消"),
        NO_PAY(10, "未支付"),
        PAID(20, "已付款"),
        SHIPPED(40, "已发货"),
        ORDER_SUCCESS(50, "订单完成"),
        OEDER_CLOSE(60, "订单关闭");

        private final int code;
        private final String value;

        OrderStatusEnum(int code, String value) {
            this.code = code;
            this.value = value;
        }

        public enum PayPlatformEnum {
            ALIPAY(1, "支付宝");

            PayPlatformEnum(int code, String value) {
                this.code = code;
                this.value = value;
            }

            private String value;
            private int code;

            public String getValue() {
                return value;
            }

            public int getCode() {
                return code;
            }
        }

    }}
