package dao;

import bean.Shop;
import net.sf.json.JSONArray;

import java.io.PrintWriter;
import java.sql.*;

public class ShopDao {
    private static String name="nancai";
    private static String username="sa";
    private static String password="jxr19981101";
    private static String url="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=" + name;

    public void add(Shop bean){
        String sql="insert into Shops (shopName,password,phoneNumber,location,category,locationDetail,picture,status) values(?,?,?,?,?,?,?,?)";
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn=DriverManager.getConnection(url,username,password);
            PreparedStatement preparedStatement=conn.prepareStatement(sql);
            preparedStatement.setString(1,bean.getShopName());
            preparedStatement.setString(2,bean.getPassword());
            preparedStatement.setString(3,bean.getPhoneNumber());
            preparedStatement.setString(4,bean.getLocation());
            preparedStatement.setString(5,bean.getCategory());
            preparedStatement.setString(6,bean.getLocationDetail());
            preparedStatement.setString(7,bean.getPicture());
            preparedStatement.setInt(8,bean.getStatus());
            preparedStatement.execute();
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void updateShopName(Shop bean){
        String sql="update Shops set ShopName= ? where customerId= ?";
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn=DriverManager.getConnection(url,username,password);
            PreparedStatement preparedStatement=conn.prepareStatement(sql);
            preparedStatement.setString(1,bean.getShopName());
            preparedStatement.setInt(2,bean.getShopId());
            preparedStatement.execute();
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void deleteShop(int id){
        String sql="delete from Shops where shopId = ?";
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn=DriverManager.getConnection(url,username,password);
            PreparedStatement preparedStatement=conn.prepareStatement(sql);
            preparedStatement.setInt(1,id);
            preparedStatement.execute();
            conn.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public Shop get(int id){
        Shop bean=new Shop();
        String sql="select * from Shops where shopId=?";
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn=DriverManager.getConnection(url,username,password);
            PreparedStatement preparedStatement=conn.prepareStatement(sql);
            preparedStatement.setInt(1,id);
            ResultSet resultSet=preparedStatement.executeQuery();
            if(resultSet.next()){
                bean.setShopId(resultSet.getInt("shopId"));
                bean.setShopName(resultSet.getString("shopName"));
                bean.setPassword(resultSet.getString("password"));
                bean.setLocation(resultSet.getString("location"));
                bean.setPhoneNumber(resultSet.getString("phoneNumber"));
                bean.setLocationDetail(resultSet.getString("locationDetail"));
                bean.setPicture(resultSet.getString("picture"));
            }
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return bean;
    }

    public Shop get(String shopName){
        Shop bean=null;
        String sql="select * from Shops where shopName=?";
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn=DriverManager.getConnection(url,username,password);
            PreparedStatement preparedStatement=conn.prepareStatement(sql);
            preparedStatement.setString(1,shopName);
            ResultSet resultSet=preparedStatement.executeQuery();
            if(resultSet.next()){
                bean=new Shop();
                bean.setShopId(resultSet.getInt("shopId"));
                bean.setShopName(resultSet.getString("shopName"));
                bean.setPassword(resultSet.getString("password"));
                bean.setLocation(resultSet.getString("location"));
                bean.setPhoneNumber(resultSet.getString("phoneNumber"));
            }
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return bean;
    }

    public boolean login(String shopName,String password2){
        String sql="select * from Shops where shopName=? and password=?";
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(url, username, password);
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1,shopName);
            preparedStatement.setString(2,password2);
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next()){
                conn.close();
                return true;
            }
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }

    public Shop[] getShopsByCategory(String category,int start){
        Shop[] bean=null;
        String sql="select top "+ start*10+1 + " * from Shops where category=? and status=? and shopId not in " +
                "(select top " +(start-1)*10 +" shopId from Shops where category=?)";
        int i=0;
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection connection = DriverManager.getConnection(url, username, password);
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,category);
            preparedStatement.setInt(2,1);
            preparedStatement.setString(3,category);
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next()){
                i++;
            }
            bean=new Shop[i];
            i=0;
            resultSet=preparedStatement.executeQuery();
            while(resultSet.next()){
                bean[i]=new Shop();
                bean[i].setShopId(resultSet.getInt("shopId"));
                bean[i].setShopName(resultSet.getString("shopName"));
                bean[i].setLocation(resultSet.getString("location"));
                bean[i].setPicture(resultSet.getString("picture"));
                i++;
            }
            connection.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return bean;
    }

    public Shop[] getShopsByStatus(int status,int start){
        Shop[] bean=null;
        String sql="select top "+ start*10+1 + " * from Shops where status=? and shopId not in " +
                "(select top " +(start-1)*10 +" shopId from Shops where status=?)";
        int i=0;
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection connection = DriverManager.getConnection(url, username, password);
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setInt(1,status);
            preparedStatement.setInt(2,status);
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next()){
                i++;
            }
            bean=new Shop[i];
            i=0;
            resultSet=preparedStatement.executeQuery();
            while(resultSet.next()){
                bean[i]=new Shop();
                bean[i].setShopId(resultSet.getInt("shopId"));
                bean[i].setShopName(resultSet.getString("shopName"));
                bean[i].setLocation(resultSet.getString("location"));
                bean[i].setPicture(resultSet.getString("picture"));
                i++;
            }
            connection.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return bean;
    }

    public void updateShopStatus(int shopId){
        String sql="update Shops set status= ? where shopId= ?";
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn=DriverManager.getConnection(url,username,password);
            PreparedStatement preparedStatement=conn.prepareStatement(sql);
            preparedStatement.setInt(1,1);
            preparedStatement.setInt(2,shopId);
            preparedStatement.execute();
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public Shop[] getAllShops(){
        String sql="select shopName,location,category from Shops where status=?";
        Shop[] bean=null;
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn=DriverManager.getConnection(url,username,password);
            PreparedStatement preparedStatement=conn.prepareStatement(sql);
            preparedStatement.setInt(1,1);
            ResultSet resultSet=preparedStatement.executeQuery();
            int i=0;
            while(resultSet.next()){
                i++;
            }
            bean=new Shop[i];
            i=0;
            resultSet=preparedStatement.executeQuery();
            while(resultSet.next()){
                bean[i]=new Shop();
                bean[i].setShopName(resultSet.getString("shopName"));
                bean[i].setLocation(resultSet.getString("location"));
                bean[i].setCategory(resultSet.getString("category"));
                i++;
            }
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return bean;
    }

    public static void main(String[] args) {
//        try{
//            String category= "3";
//            int start=1;
//            ShopDao dao=new ShopDao();
//            Shop[] bean=dao.getShopsByCategory(category,start);
//            int j;
//            for(j=0;j<bean.length;j++){
//                if(bean[j]==null){
//                    break;
//                }
//            }
////            System.out.println(j);
//            JSONArray jsonArray=JSONArray.fromObject(bean);
//            System.out.println(jsonArray.toString());
//        }catch(Exception e){
//            e.printStackTrace();
//        }
////        System.out.println(new ShopDao().get(20).getShopName());
//        System.out.println(new ShopDao().login("黄焖鸡","12345678"));
    }
}
