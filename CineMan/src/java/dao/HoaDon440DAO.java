package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.HoaDon440;

/**
 *
 * @author ADMIN
 */
public class HoaDon440DAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public String ktMaKHTT(String maKHTT){
        
        String query = "SELECT DISTINCT * FROM cinemanagement.tblkhachhang440 WHERE maKHTT = ?";
        try{
            DAO d = new DAO();
            ps = d.getConnection().prepareStatement(query);
            ps.setString(1, maKHTT);
            rs = ps.executeQuery();
            while(rs.next()){
                return rs.getString(2);
            }
        }catch(Exception  e){
        }
        return null;
    }
    
    public void luuHoaDon(HoaDon440 hd){
        String query = "INSERT INTO `cinemanagement`.`tblhoadon440` VALUES (?, ?, ?, ?, ?, ?)";
        try{
            DAO d = new DAO();
            ps = d.getConnection().prepareStatement(query);
            ps.setString(1, hd.getId());
            ps.setInt(2, hd.getSoVe());
            ps.setInt(3, hd.getTongTien());
            ps.setDate(4, (Date) hd.getNgayBan());
            ps.setString(5, hd.getMaKHTT());
            ps.setString(6, "BH01");
            ps.executeUpdate();    
        }catch(Exception  e){
            e.printStackTrace();
        }
    }
}
