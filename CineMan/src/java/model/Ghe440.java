package model;

/**
 *
 * @author ADMIN
 */
public class Ghe440 {
    private String maGhe;
    private String trangThai;
    private String idLichChieu, idPhongChieu;

    public Ghe440(String maGhe, String trangThai, String idLichChieu, String idPhongChieu) {
        this.maGhe = maGhe;
        this.trangThai = trangThai;
        this.idLichChieu = idLichChieu;
        this.idPhongChieu = idPhongChieu;
    }

    public String getMaGhe() {
        return maGhe;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public String getIdLichChieu() {
        return idLichChieu;
    }

    public String getIdPhongChieu() {
        return idPhongChieu;
    }

    @Override
    public String toString() {
        return "Ghe440{" + "maGhe=" + maGhe + ", trangThai=" + trangThai + ", idLichChieu=" + idLichChieu + ", idPhongChieu=" + idPhongChieu + '}';
    }
}
