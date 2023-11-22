package model;

import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class HoaDon440 {
    private String id;
    private int soVe, tongTien;
    private Date ngayBan;
    private String maKHTT;

    public HoaDon440(String id, int soVe, int tongTien, Date ngayBan, String maKHTT) {
        this.id = id;
        this.soVe = soVe;
        this.tongTien = tongTien;
        this.ngayBan = ngayBan;
        this.maKHTT = maKHTT;
    }

    public String getId() {
        return id;
    }

    public int getSoVe() {
        return soVe;
    }

    public int getTongTien() {
        return tongTien;
    }

    public Date getNgayBan() {
        return ngayBan;
    }

    public String getMaKHTT() {
        return maKHTT;
    }

    @Override
    public String toString() {
        return "HoaDon440{" + "id=" + id + ", soVe=" + soVe + ", tongTien=" + tongTien + ", ngayBan=" + ngayBan + ", maKHTT=" + maKHTT + '}';
    }  
}
