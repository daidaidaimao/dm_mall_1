package cn.daimao.controller;

import cn.daimao.service.ProductService;
import config.ProductMessage;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import pojo.Approval;
import pojo.Product;
import utils.PageResult;
import utils.SysResult;

import java.util.List;

@RestController
@RequestMapping("product")
public class ProductController {

    @Autowired
    private ProductService service;

    @RequestMapping(value = "/getdata",method = RequestMethod.GET)
    @ApiOperation("select * from product 不多描述")
    public List<Product> queryAll(){
        return service.queryAll();
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ApiOperation("添加商品")
    public SysResult add(Product product){
        try {
            service.add(product);
            return SysResult.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(201,"",null);
        }
    }

    @RequestMapping(value = "/picupload",method = RequestMethod.POST)
    @ApiOperation("这是个用语图片上传的API，本地地址和网络地址可在application.properties中修改")
    public String upload(MultipartFile pic){
//        System.out.println(pic.getOriginalFilename());
        if(!pic.isEmpty()) {
            return service.upload(pic);
        }else
            return ProductMessage.UploadError;
    }
    @RequestMapping(value = "/delete",method = RequestMethod.DELETE)
    @ApiOperation("言简意赅，删除")
    public SysResult delete(String productId){
        try {
            service.delete(productId);
            return SysResult.build(200,ProductMessage.DeleteSuccess,null);
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(201,ProductMessage.DeleteFail+e.toString(),null);
        }
    }
    @RequestMapping(value = "/update",method = RequestMethod.PUT)
    @ApiOperation("商品编辑更新")
    public SysResult update(Product p){
        try {
            service.update(p);
            return SysResult.build(200,ProductMessage.EditSuccess,null);
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(201,ProductMessage.EditFail+e.toString(),null);
        }
    }
    @RequestMapping(value = "/queryOne",method = RequestMethod.GET)
    @ApiOperation("查询单个商品详细信息")
    public Product queryOne(String productId){
        return service.queryOne(productId);
    }
    
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    @ApiOperation("这是显示商品所属分类的全部信息的复杂分页，写了我好一会")
    public PageResult fenye(Integer page, Integer num){
        return service.fenye(page,num);
    }

    @RequestMapping(value = "/pageFront",method = RequestMethod.GET)
    @ApiOperation("一个简单的全部商品展示分页")
    public PageResult front(Integer page,Integer num){
        return service.front(page,num);
    }

//    @RequestMapping("/addApproval")
//    public SysResult addApproval(@RequestBody Approval approval){
//        return service.addApproval(approval);
//    }
//
//    @RequestMapping("test")
//    public SysResult test(Object o){
//        return SysResult.build(200,"nimade",o);
//    }

    @RequestMapping(value = "/editStatus",method = RequestMethod.POST)
    @ApiOperation("商品上架下架状态修改")
    public SysResult changgeStatus(Product product){
        return service.changeStatus(product);
    }

    @RequestMapping(value = "/queryCategoryName",method = RequestMethod.GET)
    @ApiOperation("查询当前分类节点的name 拼接父节点")
    public String queryCategoryName(Integer categoryId){
        return service.queryCategoryName(categoryId);
    }
}
