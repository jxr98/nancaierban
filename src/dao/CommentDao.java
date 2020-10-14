package dao;

import bean.Comment;
import java.sql.*;

public class CommentDao {
    String name="nancai";
    String username="sa";
    String password="jxr19981101";
    String url="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=" + name;

    public void add(Comment bean){
        String sql="insert into Comment (shopId,customerId,content,date,picture,score,customerName,shopName) values(?,?,?,?,?,?,?,?)";
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn=DriverManager.getConnection(url,username,password);
            PreparedStatement preparedStatement=conn.prepareStatement(sql);
            preparedStatement.setInt(1,bean.getShopsId());
            preparedStatement.setInt(2,bean.getCustomerId());
            preparedStatement.setString(3,bean.getContent());
            preparedStatement.setString(4,bean.getDate());
            preparedStatement.setString(5,bean.getPicture());
            preparedStatement.setDouble(6,bean.getScore());
            preparedStatement.setString(7,bean.getCustomerName());
            preparedStatement.setString(8,bean.getShopName());
            preparedStatement.execute();
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void deleteComment(int id){
        String sql="delete from Comment where commentId=?";
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection connection=DriverManager.getConnection(url,username,password);
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setInt(1,id);
            preparedStatement.execute();
            connection.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public Comment[] getCommentsByShopId(int shopId,int start){
        String sql="select top " + start*10+1 + " * from Comment where shopId=? and commentId not in(select top "
                + (start-1)*10 +" commentId from Comment where shopId=?)";
        int i=0;
        Comment[] bean=null;
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection connection=DriverManager.getConnection(url,username,password);
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setInt(1,shopId);
            preparedStatement.setInt(2,shopId);
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next()){
                i++;
            }
            bean=new Comment[i];
            i=0;
            resultSet=preparedStatement.executeQuery();
            while(resultSet.next()){
                bean[i]=new Comment();
                bean[i].setCommentId(resultSet.getInt("commentId"));
                bean[i].setShopsId(shopId);
                bean[i].setCustomerId(resultSet.getInt("customerId"));
                bean[i].setContent(resultSet.getString("content"));
                bean[i].setPicture(resultSet.getString("picture"));
                bean[i].setDate(resultSet.getString("date"));
                bean[i].setCustomerName(resultSet.getString("customerName"));
                i++;
            }
            connection.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return bean;

    }

    public double getAverageScore(int shopId){
        String sql="select avg(score) from Comment where shopId=?";
        double avg=0.0;
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection connection=DriverManager.getConnection(url,username,password);
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setInt(1,shopId);
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next()){
                avg=resultSet.getDouble(1);
                System.out.println(avg);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return avg;
    }

    public Comment[] getCommentsByCustomerId(int customerId,int start){
        String sql="select top " + start*10+1 + " * from Comment where customerId=? and commentId not in(select top "
                + (start-1)*10 +" commentId from Comment where customerId=?)";
        int i=0;
        Comment[] bean=null;
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection connection=DriverManager.getConnection(url,username,password);
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setInt(1,customerId);
            preparedStatement.setInt(2,customerId);
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next()){
                i++;
            }
            bean=new Comment[i];
            i=0;
            resultSet=preparedStatement.executeQuery();
            while(resultSet.next()){
                bean[i]=new Comment();
                bean[i].setCommentId(resultSet.getInt("commentId"));
                bean[i].setShopName(resultSet.getString("shopName"));
                bean[i].setCustomerId(resultSet.getInt("customerId"));
                bean[i].setContent(resultSet.getString("content"));
                bean[i].setPicture(resultSet.getString("picture"));
                bean[i].setDate(resultSet.getString("date"));
                bean[i].setCustomerName(resultSet.getString("customerName"));
                i++;
            }
            connection.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return bean;

    }

    public static void main(String[] args) {
//        Comment[] bean=new CommentDao().getCommentsByShopId(0,1);
//        System.out.println(bean[0].getCustomerId());
//        System.out.println(new CommentDao().getCommentsByShopId(34,2)[0].getCustomerId());
    }
}
