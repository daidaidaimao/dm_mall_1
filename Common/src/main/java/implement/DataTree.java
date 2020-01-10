package implement;

import java.util.List;

public interface DataTree<T> {
    public Integer getId();
    public Integer getParentId();
    public void setChildList(List<T> childList);
    public List<T> getChildList();
}
