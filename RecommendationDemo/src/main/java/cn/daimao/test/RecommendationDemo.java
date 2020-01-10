package cn.daimao.test;

public class RecommendationDemo {
    Person A = new Person("a",25,1);
    Person B = new Person("b",25,1);
    Person C = new Person("c",25,1);

    Product p = new Product("1");
    Product c = new Product("2");

    public void Recommend(Person[] plist,Product[] products){
        
    }
}

class Person{
    private String id;
    private Integer age;
//    1  男   0 女
    private Integer sex;

    public Person(String id, Integer age, Integer sex) {
        this.id = id;
        this.age = age;
        this.sex = sex;
    }

    public String Order(Product p){
        return this.id+"下单了"+p.getId();
    }


}

class Product{
    private String id ;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Product(String id) {
        this.id = id;
    }
}
