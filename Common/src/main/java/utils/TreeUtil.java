package utils;

import implement.DataTree;
import pojo.Category;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TreeUtil {
    public static <T extends DataTree<T>> List<T> getTreeList(Integer topId,List<T> entityList){
//        resultList 存储顶层数据
        List<T> resultList =new ArrayList<T>();
        Map<Object,T> treeMap = new HashMap<Object, T>();
        T itemTree;
        for (T t : entityList) {
            itemTree = t;
            treeMap.put(itemTree.getId(), itemTree);
            if (topId.equals(itemTree.getParentId()) || itemTree.getParentId() == null) {
                resultList.add(itemTree);
            }
        }
        for (T t: entityList){
            itemTree = t ;
            T data = treeMap.get(itemTree.getParentId());
            if (data!=null){    //判断有没有父节点
                if (data.getChildList()==null){
                    data.setChildList(new ArrayList<T>());
                }
                data.getChildList().add(itemTree);
                treeMap.put(itemTree.getParentId(),data);
            }
        }
        return resultList;
    }


    public static <T extends DataTree<T>> List<T> initchild(List<T> entityList) {
        List<T> result = new ArrayList<T>();
        if (entityList.size()!=0){

        }
        return result;
    }

//        List<T> result = new ArrayList<T>();
//        for (T t : entityList){
//            if (t.getChildList()==null){
//                result.add(t);
//                TreeUtil.initchild(t.getChildList());
//            }
//        }
//
//        for (T t:entityList){
//            if (t.getChildList()==null){
//                result.add(t);
//            }else{
//                List<T> c = t.getChildList();
//                for (T tt:c){
//                    if (tt.getChildList()==null){
//                        result.add(tt);
//                    }else{
//                        List<T> ch = tt.getChildList();
//                        for (T ttt:ch){
//                            if (ttt.getChildList()==null){
//                                result.add(ttt);
//                            }else{
//                                List<T> chi = ttt.getChildList();
//                                for (T tttt:chi){
//                                    if (tttt.getChildList()==null){
//                                        result.add(tttt);
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//        return result;
//    }
//    public static <T extends DataTree<T>> List<T> initGrandchild(Category c){
//        String name = c.getName();
//        if (c.getParentId()!=null){
//            name = name +"/"+parent.getName();
//        }
//    }





    public static <T extends DataTree<T>> List<T> initGrandchild(List<T> entityList){
        List<T> result = new ArrayList<T>();
        List<Integer> pid = new ArrayList<Integer>();
        for (T t:entityList){
            pid.add(t.getParentId());
        }
        for (T t :entityList){
            if (!pid.contains(t.getId())){
                result.add(t);
            }
        }
        return result;
    }
}
