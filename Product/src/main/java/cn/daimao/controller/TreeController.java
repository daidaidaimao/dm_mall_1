package cn.daimao.controller;

import cn.daimao.service.TreeService;
import io.swagger.annotations.ApiOperation;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import pojo.Category;
import utils.PageResult;
import utils.SysResult;

import java.util.List;

@RestController
@RequestMapping("product")
public class TreeController {
    @Autowired
    private TreeService service;

    @RequestMapping(value = "/tree",method = RequestMethod.GET)
    @ApiOperation("展示商品分类树状结构")
    public List<Category> showParticipants(){
        return service.showParticipants();
    }

    @RequestMapping(value = "/cate",method = RequestMethod.GET)
    @ApiOperation("根据用户点击的商品分类节点，分页显示商品")
    public PageResult queryByCate(Integer productCategory,Integer page,Integer num){
        try {
            return service.queryByCate(productCategory,page,num);
//            return SysResult.build(200,"查询成功",plist);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
//            return SysResult.build(201,e.toString(),null);
        }

    }
    @RequestMapping(value = "/addNode",method = RequestMethod.POST)
    @ApiOperation("后台添加商品分类添加节点")
    public SysResult addNode(Integer parentId, String name){
        return service.addNode(parentId,name);
    }

    @RequestMapping(value = "/deleteNode",method = RequestMethod.GET)
    @ApiOperation("后台删除商品分类节点")
    public SysResult deleteNode(Integer id){
        return service.deleteNode(id);
    }

    @RequestMapping("/init")
//    懒得删了
    public SysResult allNode(){
        return service.allNode();
    }

    @RequestMapping("/parent")
//    懒得删了*2
    public SysResult queryParent(Integer id){
        return service.queryParent(id);
    }

    @RequestMapping(value = "/getCateDate",method = RequestMethod.GET)
    @ApiOperation("获得饼状图数据")
    public SysResult getCateDate(){
        return service.getCateDate();
    }
    @RequestMapping(value = "/getOne",method = RequestMethod.GET)
    @ApiOperation("获得单个分类的总销量")
    public SysResult getOne(String name){
        return service.getOne(name);
    }

    @RequestMapping(value = "/getOrderE",method = RequestMethod.GET)
    @ApiOperation("每日成交量")
    public SysResult getOrderE(){
        return service.getorderE();
    }
}
