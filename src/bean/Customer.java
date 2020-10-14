package bean;

public class Customer {
    private int customerId;
    private String customerName;
    private String password;
    private String gender;
    private String status;
    private String phoneNumber;

    public void setCustomerId(int id){
        this.customerId=id;
    }
    public int getCustomerId(){
        return customerId;
    }
    public void setCustomerName(String name){
        this.customerName=name;
    }
    public String getCustomerName(){
        return customerName;
    }
    public void setPassword(String password){
        this.password=password;
    }
    public String getPassword(){
        return password;
    }
    public void setGender(String gender){
        this.gender=gender;
    }
    public String getGender(){
        return gender;
    }
    public void setStatus(String status){
        this.status=status;
    }
    public String getStatus(){
        return status;
    }
    public void setPhoneNumber(String phoneNumber){
        this.phoneNumber=phoneNumber;
    }
    public String getPhoneNumber(){
        return phoneNumber;
    }

}
