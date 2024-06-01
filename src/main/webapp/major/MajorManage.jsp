<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.MonHoc"%>
<%@page import="model.HocKy"%>
<%@page import="model.Nganh"%>
<%@page import="model.Khoa"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý ngành học</title>
<link rel="stylesheet" href="css/style005.css" />
<link rel="stylesheet" href="css/reset.css" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600&family=Poppins:wght@300;400;500;600&family=Sora:wght@600;700;800&display=swap"
	rel="stylesheet" />
<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
	rel="stylesheet" />
</head>
<body>
	<div class="adminArea">
		<!-- Include DashBoard -->
		<%@ include file="/layout/dashBoard.jsp"%>

		<div class="content">
			<!-- Include NavBar -->
			<jsp:include page="/layout/navbar.jsp" />
			<div class="main">
				<%
				if (title == null) {
				%>
				<h3 id="title_infor">TRANG CHỦ</h3>
				<%
				} else {
				%>
				<h3 id="title_infor"><%=title%></h3>
				<%
				}
				%>
				<div id="toast"></div>
				<div class="main-content">
					<div class="MajorManageContainer">
					<div class="MajorManageContent">
						<form action="searchMajor" method="POST">
							<div class="searchMajor">
								<div style="display: flex">
									<div class="nganh">
									<label style="display: block" for="">Ngành</label> <select
												name="Nganh">
												<option value=""></option>
												<%
												ArrayList<Nganh> danhSachNganh = (ArrayList<Nganh>) session.getAttribute("dsNganh");
												if (danhSachNganh != null) {
													for (Nganh nganh : danhSachNganh) {
												%>
												<option value="<%=nganh.getMaNganh()%>"><%=nganh.getTenNganh()%></option>
												<%
												}
												}
												%>
											</select>
										</div>
									<div class="khoa">
									<label style="display: block" for="">Khoa</label> <select name="Khoa">
											<option value=""></option>
											<%
											ArrayList<Khoa> danhSachKhoa = (ArrayList<Khoa>) session.getAttribute("dsKhoa");
											if (danhSachKhoa != null){
												for (Khoa khoa : danhSachKhoa){
												%>
												<option value="<%=khoa.getMaKhoa()%>"><%=khoa.getTenKhoa()%></option>
												<% 
												}
											}
											%>
										</select>
										</div>
								</div>
							</div>
							<button class="btn" type="submit">Tìm kiếm</button>
						</form>
						<div class="majorList">
						<div style="display: flex" class="majorHeader">
							<h2 class="title">Danh sách ngành học</h2>
							<a href="" class="addMajor"> Tạo ngành học</a>
						</div>
						<table class="table">
									<thead
										style="background-color: rgb(238, 70, 70); color: white; font-size: 20px; border-color: black;">
										<tr>
											<th style="width: 5%">STT</th>
											<th style="width: 13%">Mã ngành học</th>
											<th style="width: 22%">Tên ngành học</th>
											<th style="width: 13%">Tổng số tín chỉ</th>
											<th style="width: 15%">Thời gian đào tạo</th>
											<th style="width: 5%"></th>
											<th style="width: 5%"></th>
										</tr>
									</thead>
									<tbody>
										<%
										ArrayList<MonHoc> dsMonHoc = (ArrayList<MonHoc>) session.getAttribute("dsMonHoc");
										if (danhSachNganh != null) {
											for (int i = 0; i < danhSachNganh.size(); i++) {
												Nganh ng = danhSachNganh.get(i);
										%>
										<tr>

											<th scope="row"><%=i + 1%></th>
											<td><%=ng.getMaNganh()%></td>
											<td><%=ng.getTenNganh()%></td>
											<td><%=ng.getSoTinChi()%></td>
											<td><%=ng.getThoiGianDaoTao()%></td>
											<td><a href="" class="btn btn-update" >Sửa</a></td>
											<td><a href="" class="btn btn-danger deleteMajorButton" >Xóa</a></td>
										</tr>
										<%
										}
										}
										%>
									</tbody>
								</table>
						</div>
						
					</div>
				</div>
</body>
	
</html>