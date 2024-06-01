<%@page import="model.NhanVien"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
NhanVien nhanVien = (NhanVien) session.getAttribute("nhanVien");
String title = (String) request.getAttribute("title");
%>

<div class="dashBoard">
	<div class="logoPTIT">
		<img
			src="image/Logo Học Viện Công Nghệ Bưu Chính Viễn Thông - PTIT(Simple).svg"
			alt="LogoPTIT" />
	</div>
	<div class="infObject">
		<div class="logoAvatar">
			<img src="image/user-solid-60.png" alt="" />
		</div>
		<div class="information">
			<p class="name"><%=nhanVien.getHoTen()%></p>
			<p class="id"><%=nhanVien.getMaNhanVien()%></p>
			<p class="role"><%=nhanVien.getTaiKhoan().getChucVu().getTenChucVu()%></p>
		</div>
	</div>
	<div class="features">
		<h2>CHỨC NĂNG</h2>
		<ul class="listFeatures">
			<li class="ftct"><a href="announceManage.jsp"><i class="bx bxs-bell"></i> <span
					class="text">Quản lý thông báo</span></a></li>
			<li class="ftct"><a href="studentManage"><i
					class="bx bxs-user-pin"></i><span class="text">Quản lý sinh
						viên</span></a></li>
			<li class="ftct"><a href=""><i class="bx bxs-user-circle"></i><span
					class="text">Quản lý giảng viên</span></a></li>
			<li class="ftct"><a href="subjectManagement"><i class="bx bx-food-menu"></i><span
					class="text">Quản lý môn học</span></a></li>
			<li class="ftct"><a href="curriculumManage"><i class='bx bx-notepad'></i><span
					class="text">Quản lý chương trình học</span></a></li>
			<li class="ftct"><a href="MajorManagement"><i class='bx bx-notepad'></i><span
					class="text">Quản lý ngành học</span></a></li>		
			<li class="ftct"><a href=""><i class="bx bx-clipboard"></i><span
					class="text">Mở lớp đăng ký học phần</span></a></li>
			<li class="ftct"><a
				onclick="changeIframeSrc('tiendohoctap.html');  changeText('Tiến độ học tập')"
				href="#"><i class='bx bx-check-square'></i></i><span class="text">Quản
						lý phiên đăng ký</span></a></li>
			<li class="ftct"><a href=""><i
					class="bx bx-objects-horizontal-left bx-rotate-270"></i><span
					class="text">Tạo báo cáo và thống kê</span></a></li>
			<li class="ftct"><a href=""><i class="bx bxs-check-shield"></i><span
					class="text">Quản lý tài khoản</span></a></li>
		</ul>
	</div>
</div>