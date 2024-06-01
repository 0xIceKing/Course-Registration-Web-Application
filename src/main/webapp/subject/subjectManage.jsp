<%@page import="model.MonHoc"%>
<%@page import="model.HocKy"%>
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
<title>Quản lý môn học</title>
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
					<div class="subjectManageContainer">
						<div class="subjectManageContent">
							<form action="searchSubject" method="POST">
								<div class="searchSubject">
									<%-- <div class="khoa">
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
									</div> --%>
									<div class="nganh">
										<label style="display: block" for="">Ngành</label> <select name="Nganh">
										<option value=""></option>
											<%
											ArrayList<Nganh> danhSachNganh = (ArrayList<Nganh>) session.getAttribute("dsNganh");
											if (danhSachNganh != null) {
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
										<label style="display: block" for="">Học kỳ</label> <select name="HocKy">
										<option value=""></option>
											<%
											ArrayList<HocKy> danhSachHocKy = (ArrayList<HocKy>) session.getAttribute("dsHocKy");
											if (danhSachHocKy != null) {
												for (HocKy hocKy : danhSachHocKy) {
											%>
											<option  value="<%=hocKy.getMaHocKy()%>"><%=hocKy.getMaHocKy()%></option>
											<%
											}
											}
											%>
										</select>
									</div>
									<%-- <div class="year">
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
									</div> --%>
									<div class="id">
										<label style="display: block" for="">Mã môn học</label> <input
											name="subjectID" type="text" />
									</div>
									<div class="name">
										<label style="display: block" for="">Tên môn học</label> <input
											name="subjectName" type="text" />
									</div>  
									<button class="btn" type="submit">Tìm kiếm</button>
								</div>
							</form>
							<div class="subjectList">
								<div style="display: flex" class="subjectHeader">
									<h2 class="title">Danh sách môn học</h2>
									<a href="addSubject" class="addSubject"> Tạo môn học</a>
								</div>
								<table class="table">
									<thead
										style="background-color: rgb(238, 70, 70); color: white; font-size: 20px; border-color: black;">
										<tr>
											<th style="width: 7%">STT</th>
											<th style="width: 13%">Mã môn học</th>
											<th style="width: 22%">Tên môn học</th>
											<th style="width: 1%">Số tín chỉ</th>
											<th style="width: 5%"></th>
											<th style="width: 5%"></th>

										</tr>
									</thead>
									<tbody>
										<%
										ArrayList<MonHoc> dsMonHoc = (ArrayList<MonHoc>) session.getAttribute("dsMonHoc");
										if (dsMonHoc != null) {
											for (int i = 0; i < dsMonHoc.size(); i++) {
												MonHoc mh = dsMonHoc.get(i);
										%>
										<tr>
											<th scope="row"><%=i + 1%></th>
											<td><%=mh.getMaMonHoc()%></td>
											<td><%=mh.getTenMonHoc()%></td>
											<td><%=mh.getSoTinChi()%></td>
											<td><a href="updateSubject?subjectId=<%=mh.getMaMonHoc()%>" class="btn btn-update " data-subjectId="<%=mh.getMaMonHoc()%>">Sửa</a></td>
											<td><a class="btn btn-danger deleteSubjectButton" data-Id="<%=mh.getMaMonHoc()%>">Xóa</a></td>
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
								<form name="delete-form" action="deleteSubject" method="POST">
								<input type="hidden" name="Id" value="" />
									<div class="desc">Thông báo</div>
									<div class="close2">
										<span class="icon-close"> <i class='bx bx-x'></i>
										</span>
									</div>
									<p>Xác nhận xóa đi một môn học ?</p>
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

<script src="handleJs/confirmDeleteScript1.js" ></script> 


