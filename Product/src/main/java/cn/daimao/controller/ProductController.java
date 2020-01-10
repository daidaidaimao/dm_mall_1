package cn.daimao.controller;

import cn.daimao.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import pojo.Product;
import utils.PageResult;
import utils.SysResult;

import java.util.List;

@RestController
@RequestMapping("product")
public class ProductController {

    @Autowired
    private ProductService service;

    @RequestMapping("/getdata")
    public List<Product> queryAll(){
        return service.queryAll();
    }

    @RequestMapping("/add")
    public SysResult add(Product product){
        try {
            service.add(product);
            return SysResult.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(201,"",null);
        }
    }

    @RequestMapping("/picupload")
    public String upload(MultipartFile pic){
//        System.out.println(pic.getOriginalFilename());
        if(!pic.isEmpty()) {

            return service.upload(pic);
        }
        else{
            System.out.println("失败");
            return "fail";
        }
    }
    @RequestMapping("/delete")
    public String delete(String productId){
        try {
            service.delete(productId);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "fall";
        }

    }
    @RequestMapping("/update")
    public SysResult update(Product p){
        try {
            service.update(p);
            return SysResult.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(201,e.toString(),null);
        }
    }
    @RequestMapping("/queryOne")
    public Product queryOne(String productId){
        return service.queryOne(productId);
    }
    
    @RequestMapping("/page")
    public PageResult fenye(Integer page, Integer num){
        return service.fenye(page,num);
    }
}
