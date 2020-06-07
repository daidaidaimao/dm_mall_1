package cn.daimao.service;

import cn.daimao.mapper.TreeMapper;

import com.alibaba.druid.support.json.JSONUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Category;
import pojo.OrderDaily;
import pojo.Product;
import utils.PageResult;
import utils.SysResult;
import utils.TreeUtil;

import java.util.*;

@Service
public class TreeService {
    @Autowired
    private TreeMapper mapper;
    public List<Category> showParticipants() {
        List<Category> data = mapper.showAll();
        return TreeUtil.getTreeList(9999,data);
    }
    public PageResult queryByCate(Integer productCategory,Integer page,Integer num) {
        String clist = null;
        try {
            clist = mapper.queryChild(productCategory);
            List<Integer> ppp = new ArrayList<>();
            for (String a : clist.split(",")){
                ppp.add(Integer.parseInt(a));
            }
            PageResult result = new PageResult();
            List<Product> plist = new ArrayList<>();
            Integer total = 0;
            for (Integer i : ppp){
                total = mapper.total(i)+total;
                List<Product> p = mapper.queryByCate(i);
                plist.addAll(p);
            }
            List<Product> ppage =new ArrayList<>();
            int currIdx  =(page>1 ? (page-1)*num :0);
            for (int i = 0 ;i<num && i<plist.size() - currIdx;i++){
                Product c = plist.get(currIdx+i);
                ppage.add(c);
            }
            result.setTotal(total);
            result.setRows(ppage);
            return result;

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.toString());
            return null;
        }

//        Integer total =mapper.total(productCategory);

//        List<Product> plist = mapper.queryByCate(productCategory,start,num);

//        return mapper.queryByCate(productCategory);
    }

//        List<Category> list = new ArrayList<>();
//        List<Category> data = mapper.queryNode(productCategory);
//        Category category = mapper.queryNode(productCategory);
//        Category cc = new Category();
//        cc.setId(998);
//        cc.setChildList(ctree);
//        getChild(cc,new HashMap<>());
//        System.out.println(cc);
//        List<Category> tree = TreeUtil.initchild(ctree);
//        System.out.println(ctree);
//        tree = TreeUtil.initGrandchild(ctree);
//        System.out.println("----------------------------------");
//        System.out.println(tree);

//        for(Category c:data){
//            if (c.getChildList()==null){
//                list.add(c);
//            }else{
//                List<Category> child = c.getChildList();
//                for (Category ch:child){
//                    if (ch.getChildList()==null){
//                        list.add(ch);
//                    }else{
//                        List<Category>
//                    }
//                }
//            }
//        }
    //        List<Category> list =new ArrayList<>();
    //        Category result = new Category();
//        result.setId(0);
//        result.setName("商品分类");
//        result.setChildList(tree);
//        list.add(result);

    public SysResult addNode(Integer parentId, String name) {
        List<Category> list =  mapper.showAll();
        List<Integer> ilist = new ArrayList<>();

        for(Category c : list){
            Integer number = c.getId();
            ilist.add(number);
        }
        Integer id = Collections.max(ilist) + 1;
        try {
            mapper.addNode(id,parentId,name);
            return SysResult.build(200,"插入成功",null);
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(201,e.toString(),null);
        }
    }

    public SysResult deleteNode(Integer id) {
        try {
            mapper.deleteNode(id);
            return SysResult.build(200,"删除成功",null);
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(201,e.toString(),null);
        }

    }

    /*
    * 这个应该用不到了
    * */
    public SysResult allNode() {
        try {
//            List<Category> clist = new ArrayList<>();
            List<Category> list = mapper.showAll();
            List<Category> tree = TreeUtil.initGrandchild(list);
//            System.out.println(tree);
//            for(Category c : tree){
//                clist = c.getChildList();
//            }
//            以后处理，现在就把分类全整出来算了 唉
            return SysResult.build(200,"",tree);
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(201,e.toString(),null);
        }
    }

    public SysResult queryParent(Integer id){
        try {
            List<Category> list = mapper.queryParent(id);
            return SysResult.build(200,"",list);
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(201,e.toString(),null);
        }
    }

    public SysResult getCateDate() {
        List<Integer> plist = mapper.getFirst();
        Map<String,Integer> map = new HashMap<>();
        for(Integer i : plist){
//            String c = mapper.queryChild(i);
//            String name = mapper.getCateName(i);
////            map.put(name,0);
//            int sum = 0;
//            for(String s : c.split(",")){
//                int a = Integer.parseInt(s);
//                if(null!=mapper.getSale(a)){
//                    sum += mapper.getSale(a);
//                }
//            }
//            map.put(name,sum);
//            map = getChildSale(i);
            map.putAll(getChildSale(i));
        }
//        JSONUtils.toJSONString(map);
        return SysResult.build(200,"",map);
    }
    public Map<String,Integer> getChildSale(Integer id){
        Map<String,Integer> map = new HashMap<>();
        String c = mapper.queryChild(id);
        String name = mapper.getCateName(id);
//            map.put(name,0);
        int sum = 0;
        for(String s : c.split(",")){
            int a = Integer.parseInt(s);
            if(null!=mapper.getSale(a)){
                sum += mapper.getSale(a);
            }
        }
        map.put(name,sum);
        return map;
    }

    public SysResult getOne(String name) {
        Category category = mapper.getId(name);
        Map<String, Integer> map = new HashMap<>();
//        String s = mapper.queryChild(id);
        List<Category> list = mapper.queryParent(category.getId());
        for(Category c : list){
            map.putAll(getChildSale(c.getId()));
        }

        return SysResult.build(200,"",map);
    }

    public SysResult getorderE() {
        List<OrderDaily> list = mapper.echartsOrder();
//        for(OrderDaily o : list){
//            String date = o.getDate();
//        }
        return SysResult.build(200,"",list);
    }
}
