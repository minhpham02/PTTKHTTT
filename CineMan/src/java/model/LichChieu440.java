package model;

import java.sql.Time;
import java.util.Date;


/**
 *
 * @author ADMIN
 */
public class LichChieu440 {
    private String id;
    private Date ngayChieu;
    private Time gioChieu;
    private int giaVe;
    private String idPhim, idPhongChieu, idNhanVien;

    public LichChieu440(String id, Date ngayChieu, Time gioChieu,int giaVe, String idPhim, String idPhongChieu, String idNhanVien) {
        this.id = id;
        this.ngayChieu = ngayChieu;
        this.gioChieu = gioChieu;
        this.giaVe = giaVe;
        this.idPhim = idPhim;
        this.idPhongChieu = idPhongChieu;
        this.idNhanVien = idNhanVien;
    }

    public int getGiaVe() {
        return giaVe;
    }

    public String getId() {
        return id;
    }

    public Date getNgayChieu() {
        return ngayChieu;
    }

    public Time getGioChieu() {
        return gioChieu;
    }

    public String getIdPhim() {
        return idPhim;
    }

    public String getIdPhongChieu() {
        return idPhongChieu;
    }

    public String getIdNhanVien() {
        return idNhanVien;
    }

    @Override
    public String toString() {
        return "LichChieu440{" + "id=" + id + ", ngayChieu=" + ngayChieu + ", gioChieu=" + gioChieu + ", giaVe=" + giaVe + ", idPhim=" + idPhim + ", idPhongChieu=" + idPhongChieu + ", idNhanVien=" + idNhanVien + '}';
    }
}
