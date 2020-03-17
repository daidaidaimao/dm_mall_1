package pojo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel("用户登录信息实体类")
public class User {
    @ApiModelProperty("用户ID，注册时随机UUID生成")
    private String userId;
    @ApiModelProperty("用户名，自己填写的，有一定的约束")
    private String username;
    @ApiModelProperty("密码，自己填写的，我不太想加个MD5加密 感觉没意思")
    private String password;
    @ApiModelProperty("状态，0被封，1可用")
    private Integer status;
    @ApiModelProperty("临时身份标识")
    private String identity;
}
