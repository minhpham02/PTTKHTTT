package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author ADMIN
 */
public class DAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    String url, user, password;
    
    public Connection getConnection() throws Exception{
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");  
            url = "jdbc:mysql://localhost:3306/cinemanagement";
            user = "root";
            password = "Nkok!minh36";
        
    
        }catch (Exception e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(url, user, password);
    }    
}



  

      
