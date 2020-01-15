package pojo;
import lombok.Data;
import java.util.Date;

@Data
public class Approval {
    private Integer approvalId;
    private Integer status;
    private Date createTime;
    private Date finshTime;
    private String message;
}
