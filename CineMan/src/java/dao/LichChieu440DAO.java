package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.LichChieu440;

/**
 *
 * @author ADMIN
 */
public class LichChieu440DAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<LichChieu440> getLichChieu(String idPhim){
        List<LichChieu440> list = new ArrayList<>();
        String query = "SELECT * FROM cinemanagement.tbllichchieu440 WHERE tblPhim440id = ?";
        try{
            DAO d = new DAO();
            ps = d.getConnection().prepareStatement(query);
            ps.setString(1, idPhim);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new LichChieu440(rs.getString(1), rs.getDate(2), rs.getTime(3),rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        }catch(Exception  e){
        }
        return list;
    }

}
