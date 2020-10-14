package bean;

public class Shop {
    private int shopId;
    private String shopName;
    private String password;
    private String location;
    private String picture;
    private String category;
    private String phoneNumber;
    private String locationDetail;
    private int status;

    public void setShopId(int shopId){
        this.shopId=shopId;
    }
    public int getShopId(){
        return shopId;
    }

    public void setShopName(String shopName){
        this.shopName=shopName;
    }
    public String getShopName(){
        return shopName;
    }

    public void setPassword(String password){
        this.password=password;
    }
    public String getPassword(){
        return password;
    }

    public void setLocation(String location){
        this.location=location;
    }
    public String getLocation(){
        return location;
    }

    public void setPicture(String picture){
        this.picture=picture;
    }
    public String getPicture(){
        return picture;
    }

    public void setPhoneNumber(String phoneNumber){
        this.phoneNumber=phoneNumber;
    }
    public String getPhoneNumber(){
        return phoneNumber;
    }

    public void setCategory(String category){
        this.category=category;
    }
    public String getCategory(){
        return category;
    }

    public void setLocationDetail(String locationDetail){
        this.locationDetail=locationDetail;
    }
    public String getLocationDetail(){
        return locationDetail;
    }

    public void setStatus(int status){
        this.status=status;
    }
    public int getStatus(){
        return this.status;
    }
}
