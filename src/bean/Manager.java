package bean;

public class Manager {
    private int managerId;
    private String managerName;
    private String password;

    public void setManagerId(int id){
        this.managerId=id;
    }
    public int getManagerId(){
        return this.managerId;
    }

    public void setManagerName(String name){
        this.managerName=name;
    }
    public String getManagerName(){
        return this.managerName;
    }

    public void setPassword(String password){
        this.password=password;
    }
    public String getPassword(){
        return this.password;
    }
}
