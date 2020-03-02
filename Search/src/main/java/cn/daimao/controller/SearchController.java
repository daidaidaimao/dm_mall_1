package cn.daimao.controller;

import cn.daimao.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pojo.Product;
import pojo.Student;

import java.util.List;

@RestController
public class SearchController {
    @Autowired
    private SearchService service;

    @RequestMapping("/search/createIndex")
    public String createIndex(){
        service.createIndex();
        return "success";
    }

    @RequestMapping("/search/query")
    public List<Product> queryStudent(String query){
        return service.query(query);
    }

    @RequestMapping("/search/wuhu")
    public List<Student> nmsl(String query){
        return service.nmsl(query);
    }

}
