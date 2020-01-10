package cn.daimao.mapper;

import org.springframework.stereotype.Component;
import pojo.Student;

import java.util.List;

@Component
public interface SearchMapper {
    List<Student> queryAll();
}
