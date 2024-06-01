package model;

import java.time.LocalDate;
import java.util.Objects;

public class Lop {
	private String maLop;
	private Nganh nganh;
	private KhoaHoc khoaHoc;
	private LocalDate thoiGianKetThuc;
	public Lop() {
		
	}
	public Lop(String maLop, Nganh nganh, KhoaHoc khoaHoc, LocalDate thoiGianKetThuc) {
		super();
		this.maLop = maLop;
		this.nganh = nganh;
		this.khoaHoc = khoaHoc;
		this.thoiGianKetThuc = thoiGianKetThuc;
	}
	public String getMaLop() {
		return maLop;
	}
	public void setMaLop(String maLop) {
		this.maLop = maLop;
	}
	public Nganh getNganh() {
		return nganh;
	}
	public void setNganh(Nganh nganh) {
		this.nganh = nganh;
	}
	public KhoaHoc getKhoaHoc() {
		return khoaHoc;
	}
	public void setKhoaHoc(KhoaHoc khoaHoc) {
		this.khoaHoc = khoaHoc;
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
		Lop other = (Lop) obj;
		return Objects.equals(khoaHoc, other.khoaHoc) && Objects.equals(maLop, other.maLop)
				&& Objects.equals(nganh, other.nganh) && Objects.equals(thoiGianKetThuc, other.thoiGianKetThuc);
	}
	@Override
	public String toString() {
		return "Lop [maLop=" + maLop + ", nganh=" + nganh + ", khoaHoc=" + khoaHoc + ", thoiGianKetThuc="
				+ thoiGianKetThuc + "]";
	}
	
	
	
	
	
}
