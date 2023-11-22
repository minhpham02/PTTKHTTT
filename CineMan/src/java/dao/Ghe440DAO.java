package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Ghe440;
import model.LichChieu440;

/**
 *
 * @author ADMIN
 */
public class Ghe440DAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public String getIdLichChieu(String ngayChieu, String gioChieu){
        String query = "SELECT * FROM cinemanagement.tblLichChieu440 WHERE ngayChieu = ? AND gioChieu = ?";
    try{
        DAO d = new DAO();
        ps = d.getConnection().prepareStatement(query);
        ps.setString(1, ngayChieu);
        ps.setString(2, gioChieu);
        rs = ps.executeQuery();
        while(rs.next()){
            return rs.getString(1);
        }
    }catch(Exception  e){
    }
        return null;
    }
        
    public List<Ghe440> getGhe(String idLichChieu){
    List<Ghe440> list = new ArrayList<>();
    String query = "SELECT * FROM cinemanagement.tblghe440 WHERE tblLichChieu440id = ?";
    try{
        DAO d = new DAO();
        ps = d.getConnection().prepareStatement(query);
        ps.setString(1, idLichChieu);
        rs = ps.executeQuery();
        while(rs.next()){
            list.add(new Ghe440(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
        }
    }catch(Exception  e){
    }
    return list;
    }
}
