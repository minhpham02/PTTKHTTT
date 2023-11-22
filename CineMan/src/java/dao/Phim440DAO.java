package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Phim440;

/**
 *
 * @author ADMIN
 */
public class Phim440DAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Phim440> getPhim(String tenPhim){
        List<Phim440> list = new ArrayList<>();
        String query = "SELECT * FROM cinemanagement.tblphim440 WHERE tenphim = ?";
        try{
            DAO d = new DAO();
            ps = d.getConnection().prepareStatement(query);
            ps.setString(1, tenPhim);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Phim440(rs.getString(1),
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getInt(4), 
                        rs.getString(5)));
            }
        }catch(Exception  e){
        }
        return list;
    }
}
