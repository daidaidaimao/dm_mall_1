package pojo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.util.Date;
@Data
public class OrderDaily {
    private Integer sum;
//    @DateTimeFormat(pattern="yyyy-mm-dd")
    private String date;
}
