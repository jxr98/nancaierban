package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ManagerDao {
    String name="nancai";
    String username="sa";
    String password="jxr19981101";
    String url="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=" + name;

    public boolean login(String managerName,String password){
        String sql="select * from Managers where managerName= ? and password= ?";
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(url, username, password);
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1,managerName);
            preparedStatement.setString(2,password);
            ResultSet resultSet=preparedStatement.executeQuery();
            if(resultSet.next()){
                conn.close();
                return true;
            }
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
