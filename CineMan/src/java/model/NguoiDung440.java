package model;

/**
 *
 * @author ADMIN
 */
public class NguoiDung440 {
    private String id, tenNguoiDung, email, soDienThoai, tenTaiKhoan, matKhau;

    public NguoiDung440(String id, String tenNguoiDung, String email, String soDienThoai, String tenTaiKhoan, String matKhau) {
        this.id = id;
        this.tenNguoiDung = tenNguoiDung;
        this.email = email;
        this.soDienThoai = soDienThoai;
        this.tenTaiKhoan = tenTaiKhoan;
        this.matKhau = matKhau;
    }

    public String getId() {
        return id;
    }

    public String getTenNguoiDung() {
        return tenNguoiDung;
    }

    public String getEmail() {
        return email;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public String getTenTaiKhoan() {
        return tenTaiKhoan;
    }

    public String getMatKhau() {
        return matKhau;
    }
    
    
}
