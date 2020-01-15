package config;

public class ProductMessage {
    private ProductMessage(){}

    public static final String UpLoadFormatError = "图片格式错误，请上传.jpg,.png图片";
    public static final String UploadError = "图片上传失败，请刷新重试";
    public static final String DeleteSuccess = "商品删除成功";
    public static final String DeleteFail = "商品删除失败，原因：";
    public static final String EditSuccess = "商品修改成功";
    public static final String EditFail = "商品修改失败，原因：";

    public static final Integer UnderReview = 0;
    public static final Integer ReviewSuccess = 1 ;
    public static final Integer ReviewFail = 2 ;

    public static final Integer OnShelves = 1;      //上架中
    public static final Integer NotOnShelves = 0;   //下架中

    public static final String StatusChangeSuccess = "商品状态修改成功";

}
