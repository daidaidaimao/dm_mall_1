package pojo;

import implement.DataTree;
import lombok.Data;

import java.util.List;
@Data
public class Category implements DataTree<Category> {
    private Integer id;
    private Integer parentId;
    private String name;
    private List<Category> childList;

//    public String initChild(){
//        if (this.id==4||this.id==14) {
//            return this.name+"/手机/数码产品";
//        }else if(this.id==8||this.id==6||this.id==7){
//            return this.name+"/电脑/数码产品";
//        }else if(this.id==10||this.id==11){
//            return this.name+"/书法作品";
//        }else{
//            return this.name;
//        }
//    }
//    static private Category test(Category c,int i ){
//        if (c.childList==null){
//            return c;
//        }else{
//            return test(c.childList.get(i),i-1);
//        }
//    }
//    static List<Category> initGrandchild(Category category){
//        List<Category> result=new ArrayList<Category>();
////        for (Category c: category.childList){
////            result.add(test(c).getName());
////        }
////        if (category.childList==null)
////        result.addAll(category.childList);
//        return result;
//    }
//
//    public Category(Integer id, Integer parentId, String name, List<Category> childList) {
//        this.id = id;
//        this.parentId = parentId;
//        this.name = name;
//        this.childList = childList;
//    }

//    public static void main(String[] args) {
//
//        List<Category> blist = new ArrayList<Category>(),clist = new ArrayList<Category>();
//        Category c = new Category(3,2,"c",null);
//        Category d = new Category(4,2,"c",null);
//        clist.add(c);
//        clist.add(d);
//        Category b =new Category(2,1,"b",clist);
//        blist.add(b);
//        Category a =new Category(1,2,"a",blist);
//
//        System.out.println(Category.initGrandchild(a));
//        for (int i=0;i<a.childList.size();i++){
//
//        }
//    }
}
