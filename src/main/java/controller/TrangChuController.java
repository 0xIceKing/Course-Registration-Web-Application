package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.LoaiThongBaoDAO;
import database.ThongBaoDAO;
import model.LoaiThongBao;
import model.NoiDungThongBao;

/**
 * Servlet implementation class TrangChuController
 */
@WebServlet("/trangChu")
public class TrangChuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrangChuController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hanhDong=request.getParameter("hanhDong");
		if(hanhDong.equals("a")) {
			duyet_theo_loai_va_theo_trang(request, response);
		}else {
		  String url = "/trangChu.jsp"; ThongBaoDAO thongBaoDAO = new ThongBaoDAO();
		  LoaiThongBaoDAO loaiThongBaoDAO = new LoaiThongBaoDAO();
		  ArrayList<NoiDungThongBao> dsNDTB = thongBaoDAO.selectAll();
		  ArrayList<LoaiThongBao> dsLTB = loaiThongBaoDAO.selectAll(); HttpSession
		  session = request.getSession(); 
		  session.setAttribute("dsNDTB", dsNDTB);
		  session.setAttribute("dsLTB",dsLTB);
		  RequestDispatcher rd =
		  getServletContext().getRequestDispatcher(url); rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void duyet_theo_loai_va_theo_trang(HttpServletRequest request, HttpServletResponse response) {
		try {
			String url="";
			String loai_thong_bao=request.getParameter("loaiThongBao");
			String trang = request.getParameter("trang");
			int trang_int=Integer.parseInt(trang);
			
			ThongBaoDAO tbd = new ThongBaoDAO();
			ArrayList<NoiDungThongBao> dsNDTB=tbd.selectByType(loai_thong_bao);	
			ArrayList<NoiDungThongBao> result=new ArrayList<NoiDungThongBao>();
			if(trang_int ==1) {
				for (int i = 0; i < Math.min(7, dsNDTB.size()); i++) {					
					result.add(dsNDTB.get(i));
				}
				}else {
				for (int i = (trang_int-1)*7; i < Math.min(trang_int * 7, dsNDTB.size()); i++) {
					result.add(dsNDTB.get(i));
				}
			}
			
			HttpSession s= request.getSession();
			s.setAttribute("result", result);
			s.setAttribute("trang", trang);
			s.setAttribute("loaiThongBao", loai_thong_bao);
			url="/thongbao.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
			
		}catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

}
