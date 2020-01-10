package config;

public class LoginMessage {
    private LoginMessage(){}

    public static final String LoginSuccess = "登陆成功";
    public static final String PassworddError = "密码错误";
    public static final String UserNotExist = "用户不存在";
    public static final String RegisterSuccess = "注册成功";
    public static final String RegisterFail = "注册失败";
    public static final String UserExist = "用户已经存在";
    public static final String LoginOutSuccess = "用户退出成功";
    public static final String LoginOutFail = "用户退出失败 原因：";
    public static final String TimeOut = "登陆时间超时,请重登";
    public static final String NotTimeOut = "尚未超时,续租成功";
    public static final String DetailSuccess = "查看用户个人中心成功";
    public static final String DetailFail = "查看用户个人中心失败，原因;";
    public static final Integer LoginTime = 200;
    public static final String AddDetailSuccess = "完善个人信息成功";
    public static final String AddDetailFail = "完善个人信息失败，原因：";

}
