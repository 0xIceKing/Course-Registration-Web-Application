package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import com.mysql.cj.protocol.Resultset;

import model.KhoaHoc;
import model.Lop;
import model.Nganh;

public class LopDAO implements DAOInterface<Lop> {

	private ArrayList<Lop> data = new ArrayList<>();

	@Override
	public ArrayList<Lop> selectAll() {
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM Lop";
			PreparedStatement st = con.prepareStatement(sql);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4:
			while (rs.next()) {
				String maLop = rs.getString("MaLop");
				String maNganh = rs.getString("MaNganh");
				String maKhoaHoc = rs.getString("MaKhoaHoc");
				Date thoiGianKetThucDate = rs.getDate("ThoiGianKetThuc");
				LocalDate thoiGianKetThuc = thoiGianKetThucDate.toLocalDate();
				Nganh nganh = new Nganh();
				NganhDAO nganhDAO = new NganhDAO();
				nganh = nganhDAO.selectByID(maNganh);
				KhoaHoc khoaHoc = new KhoaHoc();
				KhoaHocDAO khoaHocDAO = new KhoaHocDAO();
				khoaHoc = khoaHocDAO.selectByID(maKhoaHoc);
				Lop Lop = new Lop(maLop,nganh,khoaHoc,thoiGianKetThuc);
				data.add(Lop);
			}

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public Lop selectByID(String t) {
		Lop result = null;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM Lop WHERE MaLop = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4:
			while (rs.next()) {
				String maLop = rs.getString("MaLop");
				String maNganh = rs.getString("MaNganh");
				String maKhoaHoc = rs.getString("MaKhoaHoc");
				Date thoiGianKetThucDate = rs.getDate("ThoiGianKetThuc");
				LocalDate thoiGianKetThuc = thoiGianKetThucDate.toLocalDate();
				Nganh nganh = new Nganh();
				NganhDAO nganhDAO = new NganhDAO();
				nganh = nganhDAO.selectByID(maNganh);
				KhoaHoc khoaHoc = new KhoaHoc();
				KhoaHocDAO khoaHocDAO = new KhoaHocDAO();
				khoaHoc = khoaHocDAO.selectByID(maKhoaHoc);
				result = new Lop(maLop,nganh,khoaHoc,thoiGianKetThuc);
				break;
			}

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insert(Lop t) {
		int ketQua = 0;
		if (this.selectByID(t.getMaLop()) == null) {
			try {
				// Bước 1: tạo kết nối đến CSDL
				Connection con = JDBCUtil.getConnection();

				// Bước 2: tạo ra đối tượng statement
				String sql = "INSERT INTO Lop (MaLop, MaNganh, MaKhoaHoc, ThoiGianKetThuc) " + " VALUES (?,?,?,?)";

				PreparedStatement st = con.prepareStatement(sql);
				st.setString(1, t.getMaLop());
				st.setString(2, t.getNganh().getMaNganh());
				st.setString(3, t.getKhoaHoc().getMaNamHoc());
				st.setDate(4, java.sql.Date.valueOf(t.getThoiGianKetThuc()));
				
				// Bước 3: thực thi câu lệnh SQL
				ketQua = st.executeUpdate();

				// Bước 4:
				System.out.println("Bạn đã thực thi: " + sql);
				System.out.println("Có " + ketQua + " dòng bị thay đổi!");

				// Bước 5:
				JDBCUtil.closeConnection(con);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ketQua;
	}

	@Override
	public int insertAll(ArrayList<Lop> arr) {
		int dem = 0;
		for (Lop Lop : arr) {
			dem += insert(Lop);
		}
		return dem;
	}

	@Override
	public int delete(Lop t) {
		int ketQua = 0;
		if (this.selectByID(t.getMaLop()) != null) {
			try {
				// Bước 1: tạo kết nối đến CSDL
				Connection con = JDBCUtil.getConnection();

				// Bước 2: tạo ra đối tượng statement
				String sql = "DELETE from Lop " + " WHERE MaLop=?";

				PreparedStatement st = con.prepareStatement(sql);
				st.setString(1, t.getMaLop());

				// Bước 3: thực thi câu lệnh SQL
				System.out.println(sql);
				ketQua = st.executeUpdate();

				// Bước 4:
				System.out.println("Bạn đã thực thi: " + sql);
				System.out.println("Có " + ketQua + " dòng bị thay đổi!");

				// Bước 5:
				JDBCUtil.closeConnection(con);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ketQua;
	}

	@Override
	public int deleteMany(ArrayList<Lop> arr) {
		int dem = 0;
		for (Lop Lop : arr) {
			dem += delete(Lop);
		}
		return dem;
	}

	@Override
	public void deleteAll() {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "DELETE FROM Lop";

			PreparedStatement st = con.prepareStatement(sql);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dòng bị thay đổi!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public int update(Lop t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			
			String sql = "UPDATE Lop SET  (MaLop, MaNganh, MaKhoaHoc, ThoiGianKetThuc) " + " VALUES (?,?,?,?)";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaLop());
			st.setString(2, t.getNganh().getMaNganh());
			st.setString(3, t.getKhoaHoc().getMaNamHoc());
			st.setDate(4, java.sql.Date.valueOf(t.getThoiGianKetThuc()));
			
			// Bước 3: thực thi câu lệnh SQL

			System.out.println(sql);
			ketQua = st.executeUpdate();
			
			// Bước 4:
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ ketQua+" dòng bị thay đổi!");
			
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ketQua;
	}

	public static void main(String[] args) {
		LopDAO LopDAO = new LopDAO();
		ArrayList<Lop> kq = LopDAO.selectAll();
		for (Lop Lop : kq) {
			System.out.println(Lop.toString());
		}

//		Lop idSelect = LopDAO.selectByID("CNTTII");
//		System.out.println(idSelect);
	}
	
}
