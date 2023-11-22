package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.NguoiDung440;

/**
 *
 * @author ADMIN
 */
public class NguoiDung440DAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public void luuDK(NguoiDung440 nguoiDung440){
        String query = "INSERT INTO `cinemanagement`.`tblnguoidung440` VALUES (?, ?, ?, ?, ?, ?)";
        try{
            DAO d = new DAO();
            ps = d.getConnection().prepareStatement(query);
            ps.setString(1, nguoiDung440.getId());
            ps.setString(2, nguoiDung440.getTenNguoiDung());
            ps.setString(3, nguoiDung440.getEmail());
            ps.setString(4, nguoiDung440.getSoDienThoai());
            ps.setString(5, nguoiDung440.getTenTaiKhoan());
            ps.setString(6, nguoiDung440.getMatKhau());
            
            ps.executeUpdate();    
        }catch(Exception  e){
            e.printStackTrace();
        }
    }
}
