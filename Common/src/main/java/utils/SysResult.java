package utils;

import lombok.Data;

@Data
public class SysResult {
    private Integer status;
    private String message;
    private Object data;

    public SysResult(Integer status, String message, Object data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }

    public SysResult() {
    }

    public static SysResult build(Integer status,String message,Object data){
        return  new SysResult(status,message,data);
    }

    public static SysResult ok(){
        return new SysResult(200,"ok","");
    }
}
