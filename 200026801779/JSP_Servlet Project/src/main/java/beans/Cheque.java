package beans;

public class Cheque {
    private String id;
    private String name;
    private Integer total;
    public Cheque(){

    }

    public Cheque(String id, String name, Integer total) {
        this.id = id;
        this.name = name;
        this.total = total;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }
}
