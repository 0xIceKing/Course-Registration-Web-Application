package controller;

import java.io.IOException;

import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.NoiDungThongBao;
import model.LoaiThongBao;
import database.ThongBaoDAO;
import database.LoaiThongBaoDAO;

import util.Email;
/**
 * Servlet implementation class announceManage
 */
@WebServlet("/announceManage")
public class AnnounceManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnnounceManagement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
//			String hanhDong = request.getParameter("hanhDong");
//			if (hanhDong.equals("luuThongBao")) {
//				luuThongBao(request, response);
//			} else if (hanhDong.equals("dang-xuat")) {
//			
//			} else if (hanhDong.equals("dang-ky")) {
//				
//			} else if (hanhDong.equals("doi-mat-khau")) {
//				
//			}else if (hanhDong.equals("thay-doi-thong-tin")) {
//				
//			}
		String tieuDe=request.getParameter("tieuDe");
		String noiDung=request.getParameter("noiDung");
		Date now= new Date();
		String loaiThongBao=request.getParameter("loaiThongBao");
		
		LoaiThongBao ltb=(new LoaiThongBaoDAO()).selectByID(loaiThongBao);		
		NoiDungThongBao ndtb=new NoiDungThongBao(tieuDe,noiDung,now,ltb);
		ThongBaoDAO tbd=new ThongBaoDAO();
		//tbd.insert(ndtb);
		String maSinhVien=request.getParameter("maSinhVien")+"@student.ptithcm.edu.vn";
		Email email=new Email();
		//email.sendEmail(maSinhVien, tieuDe, noiDung);
		
		String url="/announceManage.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
	}
	
	private void luuThongBao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
