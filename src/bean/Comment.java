package bean;

public class Comment {
    private int commentId;
    private int shopId;
    private int customerId;
    private String content;
    private double score;
    private String picture;
    private String date;
    private String customerName;
    private String shopName;

    public void setCommentId(int commentId){
        this.commentId=commentId;
    }
    public int getCommentId(){
        return this.commentId;
    }

    public void setShopsId(int shopsId){
        this.shopId=shopsId;
    }
    public int getShopsId(){
        return this.shopId;
    }

    public void setCustomerId(int customerId){
        this.customerId=customerId;
    }
    public int getCustomerId(){
        return this.customerId;
    }

    public void setContent(String content){
        this.content=content;
    }
    public String getContent(){
        return this.content;
    }

    public void setScore(double score){
        this.score=score;
    }
    public double getScore(){
        return this.score;
    }

    public void setPicture(String picture){
        this.picture=picture;
    }
    public String getPicture(){
        return this.picture;
    }

    public void setDate(String date){
        this.date=date;
    }
    public String getDate(){
        return this.date;
    }

    public void setCustomerName(String customerName){
        this.customerName=customerName;
    }
    public String getCustomerName(){
        return this.customerName;
    }

    public void setShopName(String shopName){this.shopName=shopName;}
    public String getShopName(){
        return this.shopName;
    }
}
