package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.VeXemPhim440;

/**
 *
 * @author ADMIN
 */
public class VeXemPhim440DAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public void luuGhe(String maGhe, String idLichChieu){
        String query = "UPDATE cinemanagement.tblGhe440 SET trangThai = '1'  WHERE maGhe = ? AND tblLichChieu440id = ?";
        try{
            DAO d = new DAO();
            ps = d.getConnection().prepareStatement(query);
            ps.setString(1, maGhe);
            ps.setString(2, idLichChieu);
            
            ps.executeUpdate();
            
        }catch(Exception  e){
            e.printStackTrace();
        }
    }
    
    public void luuVe(VeXemPhim440 veXP){
        String query = "INSERT INTO `cinemanagement`.`tblvexemphim440` VALUES (?, ?, ?, ?, ?, ?)";
        try{
            DAO d = new DAO();
            ps = d.getConnection().prepareStatement(query);
            ps.setString(1,veXP.getId());
            ps.setString(2, veXP.getTenPhim());
            ps.setString(3, veXP.getNgayChieu());
            ps.setString(4, veXP.getGioChieu());
            ps.setString(5, veXP.getTblPhongChieu440id());
            ps.setString(6, veXP.getMaGhe());
            
            ps.executeUpdate();    
        }catch(Exception  e){
            e.printStackTrace();
        }
    }
}
