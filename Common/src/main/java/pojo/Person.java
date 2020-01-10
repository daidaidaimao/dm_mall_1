package pojo;

import javafx.scene.input.DataFormat;
import lombok.Data;

import java.util.Date;


@Data
public class Person {
    private String username;
    private String avatarUrl;
    private String gender;
    private String name;
    private String email;
    private String phone;
    private Date createTime;

}
