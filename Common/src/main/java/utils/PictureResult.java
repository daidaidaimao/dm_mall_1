package utils;

import io.swagger.annotations.ApiModel;
import lombok.Data;

@Data
@ApiModel("上传图片结果类")
public class PictureResult {
    private Integer error = 0;
    private String url;
}
