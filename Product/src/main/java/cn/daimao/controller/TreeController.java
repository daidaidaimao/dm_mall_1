package cn.daimao.controller;

import cn.daimao.service.TreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
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

    @RequestMapping("/tree")
    public List<Category> showParticipants(){
        return service.showParticipants();
    }

    @RequestMapping("/cate")
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
    @RequestMapping("/addNode")
    public SysResult addNode(Integer parentId, String name){
        return service.addNode(parentId,name);
    }

    @RequestMapping("/deleteNode")
    public SysResult deleteNode(Integer id){
        return service.deleteNode(id);
    }

    @RequestMapping("/init")
    public SysResult allNode(){
        return service.allNode();
    }

    @RequestMapping("/parent")
    public SysResult queryParent(Integer id){
        return service.queryParent(id);
    }
}
