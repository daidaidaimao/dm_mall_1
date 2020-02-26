package utils;

import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.util.List;
@Data
@ApiModel("分页结果类")
public class PageResult {
    private Integer total;
    private List<?> rows;
}
