package model;

/**
 *
 * @author ADMIN
 */
public class VeXemPhim440 {
    private String id, tenPhim, ngayChieu, gioChieu, tblPhongChieu440id, maGhe;

    public VeXemPhim440(String id, String tenPhim, String ngayChieu, String gioChieu, String tblPhongChieu440id, String maGhe) {
        this.id = id;
        this.tenPhim = tenPhim;
        this.ngayChieu = ngayChieu;
        this.gioChieu = gioChieu;
        this.tblPhongChieu440id = tblPhongChieu440id;
        this.maGhe = maGhe;
    }

    public String getTenPhim() {
        return tenPhim;
    }

    public String getId() {
        return id;
    }

    public String getNgayChieu() {
        return ngayChieu;
    }

    public String getGioChieu() {
        return gioChieu;
    }

    public String getTblPhongChieu440id() {
        return tblPhongChieu440id;
    }
    
    public String getMaGhe() {
        return maGhe;
    }

    @Override
    public String toString() {
        return "VeXemPhim440{" + "id=" + id + ", tenPhim=" + tenPhim + ", ngayChieu=" + ngayChieu + ", gioChieu=" + gioChieu + ", tblPhongChieu440id=" + tblPhongChieu440id + ", maGhe=" + maGhe + '}';
    }
}
