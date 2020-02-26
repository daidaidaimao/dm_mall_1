package pojo;

import implement.DataTree;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;
@Data
@ApiModel("商品分类实体")
public class Category implements DataTree<Category> {
    @ApiModelProperty("商品分类ID")
    private Integer id;
    @ApiModelProperty("商品分类父id")
    private Integer parentId;
    @ApiModelProperty("商品分类名称")
    private String name;
    @ApiModelProperty("商品分类子节点")
    private List<Category> childList;


}
