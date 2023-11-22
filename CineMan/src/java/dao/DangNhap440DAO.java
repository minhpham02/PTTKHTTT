package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.NguoiDung440;

/**
 *
 * @author ADMIN
 */
public class DangNhap440DAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public NguoiDung440 dangNhap440(String tenTaiKhoan, String matKhau){
        String query = "SELECT * FROM cinemanagement.tblnguoidung440\n" +
                    "where tenTaiKhoan = ? and matKhau = ?\n";
        try{
            DAO d = new DAO();
            ps = d.getConnection().prepareStatement(query);
            ps.setString(1, tenTaiKhoan);
            ps.setString(2, matKhau);
            rs = ps.executeQuery();
            while(rs.next()){
                return new NguoiDung440(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
            }
        }catch(Exception  e){
            e.printStackTrace();
        }
        return null;
    }
}
