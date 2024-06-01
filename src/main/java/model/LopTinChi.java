package model;

import java.time.LocalDate;
import java.util.Objects;

public class LopTinChi {
	private String maLopTinChi;
	private MonHoc monHoc;
	private KhoaHoc khoaHoc;
	private short hocKy;
	private short soTinChi;
	private GiangVien giangVien;
	private String tietBatDau;
	private String tietKetThuc;
	private String thu;
	private String phong;
	private short soLuongSinhVien;
	private Khoa khoa;
	public LopTinChi() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LopTinChi(String maLopTinChi, MonHoc monHoc, KhoaHoc khoaHoc, short hocKy, short soTinChi, GiangVien giangVien,
			String tietBatDau, String tietKetThuc, String thu, String phong, short soLuongSinhVien, Khoa khoa) {
		super();
		this.maLopTinChi = maLopTinChi;
		this.monHoc = monHoc;
		this.khoaHoc = khoaHoc;
		this.hocKy = hocKy;
		this.soTinChi = soTinChi;
		this.giangVien = giangVien;
		this.tietBatDau = tietBatDau;
		this.tietKetThuc = tietKetThuc;
		this.thu = thu;
		this.phong = phong;
		this.soLuongSinhVien = soLuongSinhVien;
		this.khoa = khoa;
	}
	public String getMaLopTinChi() {
		return maLopTinChi;
	}
	public void setMaLopTinChi(String maLopTinChi) {
		this.maLopTinChi = maLopTinChi;
	}
	public MonHoc getMonHoc() {
		return monHoc;
	}
	public void setMonHoc(MonHoc monHoc) {
		this.monHoc = monHoc;
	}
	public KhoaHoc getKhoaHoc() {
		return khoaHoc;
	}
	public void setKhoaHoc(KhoaHoc khoaHoc) {
		this.khoaHoc = khoaHoc;
	}
	public short getHocKy() {
		return hocKy;
	}
	public void setHocKy(short hocKy) {
		this.hocKy = hocKy;
	}
	public short getSoTinChi() {
		return soTinChi;
	}
	public void setSoTinChi(short soTinChi) {
		this.soTinChi = soTinChi;
	}
	public GiangVien getGiangVien() {
		return giangVien;
	}
	public void setGiangVien(GiangVien giangVien) {
		this.giangVien = giangVien;
	}
	public String getTietBatDau() {
		return tietBatDau;
	}
	public void setTietBatDau(String tietBatDau) {
		this.tietBatDau = tietBatDau;
	}
	public String getTietKetThuc() {
		return tietKetThuc;
	}
	public void setTietKetThuc(String tietKetThuc) {
		this.tietKetThuc = tietKetThuc;
	}
	public String getThu() {
		return thu;
	}
	public void setThu(String thu) {
		this.thu = thu;
	}
	public String getPhong() {
		return phong;
	}
	public void setPhong(String phong) {
		this.phong = phong;
	}
	public short getSoLuongSinhVien() {
		return soLuongSinhVien;
	}
	public void setSoLuongSinhVien(short soLuongSinhVien) {
		this.soLuongSinhVien = soLuongSinhVien;
	}
	public Khoa getKhoa() {
		return khoa;
	}
	public void setKhoa(Khoa khoa) {
		this.khoa = khoa;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		LopTinChi other = (LopTinChi) obj;
		return Objects.equals(giangVien, other.giangVien) && hocKy == other.hocKy && Objects.equals(khoa, other.khoa)
				&& Objects.equals(maLopTinChi, other.maLopTinChi) && Objects.equals(monHoc, other.monHoc)
				&& Objects.equals(khoaHoc, other.khoaHoc) && Objects.equals(phong, other.phong)
				&& soLuongSinhVien == other.soLuongSinhVien && soTinChi == other.soTinChi
				&& Objects.equals(thu, other.thu) && Objects.equals(tietBatDau, other.tietBatDau)
				&& Objects.equals(tietKetThuc, other.tietKetThuc);
	}
	@Override
	public String toString() {
		return "LopTinChi [maLopTinChi=" + maLopTinChi + ", monHoc=" + monHoc + ", khoaHoc=" + khoaHoc + ", hocKy="
				+ hocKy + ", soTinChi=" + soTinChi + ", giangVien=" + giangVien + ", tietBatDau=" + tietBatDau
				+ ", tietKetThuc=" + tietKetThuc + ", thu=" + thu + ", phong=" + phong + ", soLuongSinhVien="
				+ soLuongSinhVien + ", khoa=" + khoa + "]";
	}
	
	
}
