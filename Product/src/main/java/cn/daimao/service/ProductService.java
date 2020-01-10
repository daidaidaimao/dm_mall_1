package cn.daimao.service;

import cn.daimao.mapper.ProductMapper;
import config.ProductMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import pojo.Category;
import pojo.Product;
import utils.PageResult;
import utils.UploadUtil;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class ProductService {

//    private List<String> nameList = new ArrayList<>();
    @Autowired
    private ProductMapper mapper;

    public List<Product> queryAll() {
        return mapper.queryAll();
    }

    public void add(Product product) {
        product.setProductId(UUID.randomUUID().toString());
        product.setCategoryName("");
        product.setSale(0);
        mapper.add(product);
    }

    @Value("${disk.path}")
    private String diskPath;
    @Value("${url.path}")
    private String urlPath;

    public String upload(MultipartFile pic) {
        String filename = pic.getOriginalFilename();

        String extName =filename.substring(filename.lastIndexOf("."));
        if (!extName.matches(".(jpg|png|gif)")){
            return ProductMessage.UpLoadFormatError;
        }
        String dir = "/"+ UploadUtil.getUploadPath(filename,"upload")+"/";
        //3 根据公用路径 nginx 访问的静态文件 位置 C:/img 生成文件夹
        String diskDir = diskPath+dir;
        File _dir=new File(diskDir);
        if(!_dir.exists()){
            _dir.mkdirs();
        }
        String name =UUID.randomUUID().toString()+extName;
        try {
            pic.transferTo(new File(diskDir+name));
            return urlPath+dir+name;
        } catch (IOException e) {
            e.printStackTrace();
            return e.toString();
        }
    }

    public void delete(String productId) {
        mapper.delete(productId);
    }

    public void update(Product p) {
        mapper.update(p);
    }

    public Product queryOne(String productId) {
        return mapper.queryOne(productId);
    }

    public PageResult fenye(Integer page, Integer num) {
        PageResult result = new PageResult();
        Integer total =mapper.total();
        result.setTotal(total);
        Integer start = (page-1)*num;
        List<Product> plist = mapper.fenye(start,num);
        String name ="";
        for (Product p : plist){
            Integer id = p.getProductCategory();
            String pid = mapper.queryParent(id);
//            System.out.println(pid);
            for(String s : pid.split(",")){
//                System.out.println(s);
                Category c = null;
                try {
                    c = mapper.queryNode(Integer.parseInt(s));
                    if (c!=null&&!c.getName().equals("商品分类"))
                        name = c.getName()+"/"+name;
                } catch (NumberFormatException e) {
                    e.printStackTrace();
//                    name = e.toString();
                }
            }
            p.setCategoryName(name);
            name = "";
        }
        result.setRows(plist);
        return result;
    }
//            String name = initCateName(id);
//            String name = initCateName(c);
//            String name = c.getName();
//            if(c.getParentId()!=null){
//                Category parent = mapper.queryNode(c.getParentId());
//                name = name +"/"+parent.getName();
//                if (parent.getParentId()!=9999){
//                    Category grand = mapper.queryNode(parent.getParentId());
//                    name = name +"/"+ grand.getName();
//                }
//            }
//    public String initCateName(Category c){
//        if (c.getParentId() == 0 ){
//            String name  = "";
////            Category c = mapper.queryNode(id);
////            Category parent = mapper.queryNode(c.getParentId());
//            name = c.getName()+"/";
//            nameList.add(name);
//            return nameList.toString();
//        }else{
//            return initCateName(mapper.queryNode(c.getParentId()));
//        }
//
//
//    }
}
