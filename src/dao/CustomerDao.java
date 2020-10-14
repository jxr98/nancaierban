package dao;

import bean.Customer;
import java.sql.*;

public class CustomerDao {
    String name="nancai";
    String username="sa";
    String password="jxr19981101";
    String url="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=" + name;

    public void add(Customer bean) {
        String sql="insert into Customers (customerName,status,password,gender,phoneNumber) values(?,?,?,?,?)";
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn=DriverManager.getConnection(url,username,password);
            PreparedStatement preparedStatement=conn.prepareStatement(sql);
            preparedStatement.setString(1,bean.getCustomerName());
            preparedStatement.setString(2,"student");
            preparedStatement.setString(3,bean.getPassword());
            preparedStatement.setString(4,bean.getGender());
            preparedStatement.setString(5,bean.getPhoneNumber());
            preparedStatement.execute();
            preparedStatement=conn.prepareStatement("select * from Customers where customerName='" +bean.getCustomerName() +"'");
            ResultSet resultSet=preparedStatement.executeQuery();
            if(resultSet.next()) {
                int id = resultSet.getInt("customerId");
                bean.setCustomerId(id);
            }
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }

    }

    public void updateCustomerName(Customer bean){
        String sql="update Customers set customerName = ? where customerId = ? ";
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn=DriverManager.getConnection(url,username,password);
            PreparedStatement preparedStatement=conn.prepareStatement(sql);
            preparedStatement.setString(1,bean.getCustomerName());
            preparedStatement.setInt(2,bean.getCustomerId());
            preparedStatement.execute();
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void deleteCustomer(int id){
        String sql="delete from Customers where customerId = ?";
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

    public Customer get(int id){
        Customer bean=null;
        String sql="select * from Customers where customerId=?";
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn=DriverManager.getConnection(url,username,password);
            PreparedStatement preparedStatement=conn.prepareStatement(sql);
            preparedStatement.setInt(1,id);
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next()){
                bean=new Customer();
                bean.setCustomerId(resultSet.getInt("customerId"));
                bean.setCustomerName(resultSet.getString("customerName"));
                bean.setGender(resultSet.getString("gender"));
                bean.setPassword(resultSet.getString("password"));
                bean.setPhoneNumber(resultSet.getString("phoneNumber"));
            }
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return bean;
    }

    public Customer get(String customerName){
        Customer bean=null;
        String sql="select * from Customers where customerName= ?";
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn=DriverManager.getConnection(url,username,password);
            PreparedStatement preparedStatement=conn.prepareStatement(sql);
            preparedStatement.setString(1,customerName);
            ResultSet resultSet=preparedStatement.executeQuery();
            if(resultSet.next()){
                bean=new Customer();
                bean.setCustomerId(resultSet.getInt("customerId"));
                bean.setCustomerName(resultSet.getString("customerName"));
                bean.setGender(resultSet.getString("gender"));
                bean.setPassword(resultSet.getString("password"));
                bean.setPhoneNumber(resultSet.getString("phoneNumber"));
            }
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return bean;
    }


    public boolean login(String customerName,String password2){
        String sql="select * from Customers where customerName= ? and password= ?";
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(url, username, password);
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1,customerName);
            preparedStatement.setString(2,password2);
            ResultSet resultSet=preparedStatement.executeQuery();
            if(resultSet.next()){
                return true;
            }
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        System.out.println(new CustomerDao().login("jiang","123456789"));
    }
}

