package pojo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel(description = "商品实体")
public class Product {
    @ApiModelProperty("商品ID")
    private String productId;
    @ApiModelProperty("商品名称")
    private String productName;
    @ApiModelProperty("商品价格")
    private Double productPrice;
    @ApiModelProperty("商品分类编号")
    private Integer productCategory;
    @ApiModelProperty("商品图片地址")
    private String productImgurl;
    @ApiModelProperty("商品数量")
    private Integer productNum;
    @ApiModelProperty("商品简单描述")
    private String productDescription;
    @ApiModelProperty("商品销量")
    private Integer sale;
    @ApiModelProperty("商品所属详细分类名字")
    private String categoryName;
    @ApiModelProperty("商品详细描述")
    private String quill;
    @ApiModelProperty("商品状态，0下架，1上架")
    private Integer productStatus;
}
