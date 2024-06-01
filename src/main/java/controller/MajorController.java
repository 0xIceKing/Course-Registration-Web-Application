package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.KhoaDAO;
import database.NganhDAO;
import model.Khoa;
import model.Nganh;

/**
 * Servlet implementation class MajorController
 */
@WebServlet("/MajorManagement")
public class MajorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MajorController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/major/MajorManage.jsp";
		String title = "Quản lý ngành học";
		request.setAttribute("title", title);
		
		NganhDAO nganhDAO = new NganhDAO();
		ArrayList<Nganh> dsNganh = nganhDAO.selectAll();
		KhoaDAO khoaDAO = new KhoaDAO();
		ArrayList<Khoa> dsKhoa = khoaDAO.selectAll();
		
		HttpSession session = request.getSession();
		session.setAttribute("dsNganh", dsNganh);
		session.setAttribute("dsKhoa", dsKhoa);
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
