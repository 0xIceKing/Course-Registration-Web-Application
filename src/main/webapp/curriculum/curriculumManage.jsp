<%@page import="model.MonHoc"%>
<%@page import="model.HocKy"%>
<%@page import="model.Nganh"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý chương trình học</title>
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
					<div class="CurriculumManageContainer">
						<div class="CurriculumManageContent">
							<form action="searchCurriculum" method="POST">
								<div class="searchCurriculum">
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
										<div class="HocKy">
											<label style="display: block" for="">Học kỳ</label> <select
												name="HocKy">
												<option value=""></option>
												<%
												ArrayList<HocKy> danhSachHocKy = (ArrayList<HocKy>) session.getAttribute("dsHocKy");
												if (danhSachHocKy != null) {
													for (HocKy hocKy : danhSachHocKy) {
												%>
												<option value="<%=hocKy.getMaHocKy()%>"><%=hocKy.getMaHocKy()%></option>
												<%
												}
												}
												%>
											</select>
										</div>
									</div>
									<button class="btn" type="submit">Tìm kiếm</button>
								</div>
							</form>
							<div class="CurriculumList">
								<div style="display: flex" class="CurriculumHeader">
									<h2 class="title">Danh sách ngành học</h2>
									<a href="addCurriculum" class="addCurriculum"> Tạo môn học</a>
								</div>
								<table class="table">
									<thead
										style="background-color: rgb(238, 70, 70); color: white; font-size: 20px; border-color: black;">
										<tr>
											<th style="width: 7%">STT</th>
											<th style="width: 13%">Mã ngành học</th>
											<th style="width: 22%">Tên ngành học</th>
											<th style="width: 13%">Tổng số tín chỉ</th>
											<th style="width: 15%">Thời gian đào tạo</th>
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
											<td><a
												href="updateCurriculum?CurriculumId=<%=ng.getMaNganh()%>"
												class="btn btn-update "
												data-CurriculumId="<%=ng.getMaNganh()%>">Chi tiết</a></td>
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
					<%@ include file="/layout/confirmDelete.jsp"%>
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