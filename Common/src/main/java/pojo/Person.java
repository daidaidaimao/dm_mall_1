package pojo;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


@Data
@ApiModel("用户详细信息实体类")
public class Person {
    @ApiModelProperty("用户ID 不多说了")
    private String userId;
    @ApiModelProperty("用户头像地址，还没写呢 这个功能")
    private String avatarUrl;
    @ApiModelProperty("用户性别")
    private String gender;
    @ApiModelProperty("应该就是。。名字 当时写的时候没太在意 写头像的时候再看吧")
    private String name;
    @ApiModelProperty("用户邮箱，之后应该会改成邮箱或者手机号登陆")
    private String email;
    @ApiModelProperty("用户手机号")
    private String phone;
    @DateTimeFormat(pattern="yyyy-mm-dd hh:mm:ss")
    @ApiModelProperty("注册时间，讲道理的话，每张表都需要的，但是我懒")
    private Date createTime;

}
