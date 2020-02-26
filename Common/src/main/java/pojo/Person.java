package pojo;


import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


@Data
public class Person {
    private String userId;
    private String avatarUrl;
    private String gender;
    private String name;
    private String email;
    private String phone;
    @DateTimeFormat(pattern="yyyy-mm-dd hh:mm:ss")
    private Date createTime;

}
