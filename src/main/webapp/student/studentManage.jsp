<%@page import="model.KhoaHoc"%>
<%@page import="model.SinhVien"%>
<%@page import="model.Lop"%>
<%@page import="model.Nganh"%>
<%@page import="model.Khoa"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
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
				<div id="toast">
                        
                    </div>
				<div class="main-content">
					<div class="studentManageContainer">
						<div class="studentManageContent">
							<form action="searchStudent" method="POST">
								<div class="searchStudent">
									<div class="khoa">
										<label style="display: block" for="">Khoa</label> <select name="Khoa">
										<option value=""></option>
											<%
											ArrayList<Khoa> danhSachKhoa = (ArrayList<Khoa>) session.getAttribute("dsKhoa");
											if (danhSachKhoa != null) {
												for (Khoa khoa : danhSachKhoa) {
											%>
											<option  value="<%=khoa.getMaKhoa()%>"><%=khoa.getTenKhoa()%></option>
											<%
											}
											}
											%>
										</select>
									</div>
									<div class="nganh">
										<label style="display: block" for="">Ngành</label> <select name="Nganh">
										<option value=""></option>
											<%
											ArrayList<Nganh> danhSachNganh = (ArrayList<Nganh>) session.getAttribute("dsNganh");
											if (danhSachKhoa != null) {
												for (Nganh nganh : danhSachNganh) {
											%>
											<option  value="<%=nganh.getMaNganh()%>"><%=nganh.getTenNganh()%></option>
											<%
											}
											}
											%>
										</select>
									</div>
									<div class="lop">
										<label style="display: block" for="">Lớp</label> <select name="Lop">
										<option value=""></option>
											<%
											ArrayList<Lop> danhSachLop = (ArrayList<Lop>) session.getAttribute("dsLop");
											if (danhSachLop != null) {
												for (Lop lop : danhSachLop) {
											%>
											<option  value="<%=lop.getMaLop()%>"><%=lop.getMaLop()%></option>
											<%
											}
											}
											%>
										</select>
									</div>
									<div class="year">
										<label style="display: block" for="">Khóa</label> <select name="Year">
										<option value=""></option>
											<%
											ArrayList<KhoaHoc> danhSachNamHoc = (ArrayList<KhoaHoc>) session.getAttribute("dsKhoaHoc");
											if (danhSachNamHoc != null) {
												for (KhoaHoc khoaHoc : danhSachNamHoc) {
											%>
											<option  value="<%=khoaHoc.getMaNamHoc()%>"><%=khoaHoc.getMaNamHoc()%></option>
											<%
											}
											}
											%>
										</select>
									</div>
									<div class="id">
										<label style="display: block" for="">Mã sinh viên</label> <input
											name="studentID" type="text" />
									</div>
									<button class="btn" type="submit">Tìm kiếm</button>
								</div>
							</form>
							<div class="studentList">
								<div style="display: flex" class="studentHeader">
									<h2 class="title">Danh sách sinh viên</h2>
									<a href="addStudent" class="addStudent"> Tạo sinh viên</a>
								</div>
								<table class="table">
									<thead
										style="background-color: rgb(238, 70, 70); color: white; font-size: 20px; border-color: black;">
										<tr>
											<th style="width: 10%">STT</th>
											<th style="width: 23%">Mã sinh viên</th>
											<th style="width: 27%">Họ tên</th>
											<th style="width: 25%">Ngày sinh</th>
											<th style="width: 17%">Giới tính</th>
											<th style="width: 29%">Lớp</th>
											<th style="width: 25%">Email</th>
											<th style="width: 16%"></th>
											<th style="width: 16%"></th>

										</tr>
									</thead>
									<tbody>
										<%
										ArrayList<SinhVien> dsSinhVien = (ArrayList<SinhVien>) session.getAttribute("dsSinhVien");
										if (dsSinhVien != null) {
											for (int i = 0; i < dsSinhVien.size(); i++) {
												SinhVien sv = dsSinhVien.get(i);
										%>
										<tr>
											<th scope="row"><%=i + 1%></th>
											<td><%=sv.getMaSinhVien()%></td>
											<td><%=sv.getHoTen()%></td>
											<td><%=sv.getNgaySinh()%></td>
											<td><%=sv.getGioiTinh()%></td>
											<td><%=sv.getLop().getMaLop()%></td>
											<td><%=sv.getEmail()%></td>
											<td><a href="upDateStudent?studentId=<%=sv.getMaSinhVien()%>" class="btn btn-update " data-studentId="<%=sv.getMaSinhVien()%>">Sửa</a></td>
											<td><a class="btn btn-danger deleteStudentButton" data-Id="<%=sv.getMaSinhVien()%>">Xóa</a></td>
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
					<div class="modal1">
						<div class="confirmDelete">
								<form name="delete-form" action="deleteStudent" method="POST">
								<input type="hidden" name="Id" value="" />
									<div class="desc">Thông báo</div>
									<div class="close2">
										<span class="icon-close"> <i class='bx bx-x'></i>
										</span>
									</div>
									<p>Xác nhận xóa đi một sinh viên ?</p>
									<div class="action">
										<button type="submit" id="btn-delete-user" class="btn">
											Đúng</button>
										<a class="btn denied"> Hủy </a>
									</div>
								</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

<script>

function toast(){
	const main = document.getElementById('toast');
    if(main){
        const toast = document.createElement('div');
        const icons = {
            success: 'bxs-check-circle',
            error: 'bxs-error'
        }

        toast.classList.add('toast',`toast--${type}`);
        toast.innerHTML = `
        <div class="toast__icon">
            <i class='bx ${icon}' ></i>
        </div>
        <div class="toast__body">
            <h3 class="toast__title">${titleToast}</h3>
            <p class="toast__msg">
                ${messageToast}
            </p>
        </div>
        <div class="toast__close">
            <i class='bx bx-x bx-rotate-90' ></i>
        </div>                                
        `
        main.appendChild(toast);
    }
}

const messageToast = "<%= session.getAttribute("messageToast") %>";
if (messageToast != 'null') {
    toast();
}
<% session.removeAttribute("messageToast"); %>

</script>

<script src="handleJs/confirmDeleteScript1.js"></script> 


