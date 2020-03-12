package pojo;

import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.util.Date;

@Data
@ApiModel("商品评论实体")
public class ProductComment {
    private String commentId;
    private String productId;
    private String userId;
    private String commentContent;
    private Date createTime;
    private String userName;
    private String orderId;
    private Integer score;
}
