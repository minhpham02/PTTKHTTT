package model;

/**
 *
 * @author ADMIN
 */
public class Phim440 {
    private String id, tenPhim, daoDien;
    private int thoiLuong;
    private String quocGia;

    public Phim440(String id, String tenPhim, String daoDien, int thoiLuong, String quocGia) {
        this.id = id;
        this.tenPhim = tenPhim;
        this.daoDien = daoDien;
        this.thoiLuong = thoiLuong;
        this.quocGia = quocGia;
    }
    
    public String getId() {
        return id;
    }

    public String getTenPhim() {
        return tenPhim;
    }

    public String getDaoDien() {
        return daoDien;
    }

    public int getThoiLuong() {
        return thoiLuong;
    }

    public String getQuocGia() {
        return quocGia;
    }

    @Override
    public String toString() {
        return "Phim440{" + "id=" + id + ", tenPhim=" + tenPhim + ", daoDien=" + daoDien + ", thoiLuong=" + thoiLuong + ", quocGia=" + quocGia + '}';
    } 
}
