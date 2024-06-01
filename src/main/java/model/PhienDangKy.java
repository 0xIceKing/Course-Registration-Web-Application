package model;

import java.time.LocalDate;
import java.util.Objects;

public class PhienDangKy {
	private SinhVien sinhVien;
	private KhoaHoc khoaHoc;
	private short hocKy;
	private LopTinChi lopTinhChi;
	private LocalDate thoiGianBatDau;
	private LocalDate thoiGianKetThuc;
	public PhienDangKy() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PhienDangKy(SinhVien sinhVien, KhoaHoc khoaHoc, short hocKy, LopTinChi lopTinhChi, LocalDate thoiGianBatDau,
			LocalDate thoiGianKetThuc) {
		super();
		this.sinhVien = sinhVien;
		this.khoaHoc = khoaHoc;
		this.hocKy = hocKy;
		this.lopTinhChi = lopTinhChi;
		this.thoiGianBatDau = thoiGianBatDau;
		this.thoiGianKetThuc = thoiGianKetThuc;
	}
	public SinhVien getSinhVien() {
		return sinhVien;
	}
	public void setSinhVien(SinhVien sinhVien) {
		this.sinhVien = sinhVien;
	}
	public KhoaHoc getNamHoc() {
		return khoaHoc;
	}
	public void setNamHoc(KhoaHoc khoaHoc) {
		this.khoaHoc = khoaHoc;
	}
	public short getHocKy() {
		return hocKy;
	}
	public void setHocKy(short hocKy) {
		this.hocKy = hocKy;
	}
	public LopTinChi getLopTinhChi() {
		return lopTinhChi;
	}
	public void setLopTinhChi(LopTinChi lopTinhChi) {
		this.lopTinhChi = lopTinhChi;
	}
	public LocalDate getThoiGianBatDau() {
		return thoiGianBatDau;
	}
	public void setThoiGianBatDau(LocalDate thoiGianBatDau) {
		this.thoiGianBatDau = thoiGianBatDau;
	}
	public LocalDate getThoiGianKetThuc() {
		return thoiGianKetThuc;
	}
	public void setThoiGianKetThuc(LocalDate thoiGianKetThuc) {
		this.thoiGianKetThuc = thoiGianKetThuc;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PhienDangKy other = (PhienDangKy) obj;
		return hocKy == other.hocKy && Objects.equals(lopTinhChi, other.lopTinhChi)
				&& Objects.equals(khoaHoc, other.khoaHoc) && Objects.equals(sinhVien, other.sinhVien)
				&& Objects.equals(thoiGianBatDau, other.thoiGianBatDau)
				&& Objects.equals(thoiGianKetThuc, other.thoiGianKetThuc);
	}
	@Override
	public String toString() {
		return "PhienDangKy [sinhVien=" + sinhVien + ", khoaHoc=" + khoaHoc + ", hocKy=" + hocKy + ", lopTinhChi="
				+ lopTinhChi + ", thoiGianBatDau=" + thoiGianBatDau + ", thoiGianKetThuc=" + thoiGianKetThuc + "]";
	}
	
	
}
