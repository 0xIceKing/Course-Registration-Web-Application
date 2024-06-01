<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="model.SinhVien"%>
 <%@page import="java.time.LocalDateTime"%>
 <%@page import="java.time.format.DateTimeFormatter"%>   
<!DOCTYPE html>
<html lang="vi">
	<head>
	    <meta charset="UTF-8">
	    <title>Thông Tin Cá Nhân</title>
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	    <style>
	        .custom-bg-color{
	            background-color: rgb(238, 70, 70);
	        }
	        .tdt{
	            font-size: 23px;
	            width: 100%;
	            font-weight: 500;
	            color:rgb(87, 27, 27)
	        }
			.image{
				border-radius: 50%;
				width: 120px;
				height: 120px;
			}
	        .flex1{
	        	flex-basis: 33%;
	        }
	        .flex2{
	        	flex-basis: 67%;
	        }
	        .container{
	        	display: grid;
	        	grid-template-columns: 3fr 2fr;
	        	grid-template-rows: 6fr 4fr;
	        }
	        .item1{
	        	grid-column: 1 / 2;
	        	grid-row: 1 / 2;
	        	max-height: 420px;
	        	max-width:515px;
	        }
	       	.item2{
	       		grid-column: 2 / 3;
	        	grid-row: 1 / 2;
	        	max-height: 420px;
	        	max-width:515px;
	        }
	       .item3{
	        	grid-column: 1 / 3;
	        	grid-row: 2 / 3;
	        }
	    </style>
	    <script src="https://www.gstatic.com/charts/loader.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
	</head>
	<body>
	<%SinhVien sinhVien = (SinhVien) session.getAttribute("sinhVien"); 
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
	%>
		<!-- Thanh tiêu đề -->
	     <div class="custom-bg-color text-white text-center p-2">
	        <h2>Thông Tin Sinh Viên</h2>
	    </div>
		<div class="row">
			<div class="flex1 px-1">
				<!--Ảnh kèm tên-->
				<div class="card shadow-lg" style="margin-top: 5px;">
					<div class="card-body">
						<div class="text-center">
						  <img class="image" src="image/default-avatar-profile-icon.jpg" style="border: 2px solid black;">
						</div>
						<div style="text-align: center; margin-top: 20px;">
							<h4><%= sinhVien.getHoTen() %></h4>
						</div>
					</div>
				</div>
				<!--Thông tin chung-->
				<div class="card shadow-lg my-3">
					<div class="card-header tdt">
						Thông Tin Chung
					</div>
					<div class="card-body py-1">
						<div class="container-fluid p-0">
							<div class="row my-1 ng-star-inserted">
								<p class="card-title col-4 col-lg-4 pr-1">Mã Sinh Viên</p>
								<p class="card-text col-8 col-lg-6 px-1"><%= sinhVien.getMaSinhVien() %></p>
							</div>
							<div class="row my-1 ng-star-inserted">
								<p class="card-title col-4 col-lg-4 pr-1">Họ Và Tên</p>
								<p class="card-text col-8 col-lg-8 px-1"><%= sinhVien.getHoTen() %></p>
							</div>
							<div class="row my-1 ng-star-inserted">
								<p class="card-title col-2 col-lg-4 psr-1">Ngày sinh</p>
								<p class="card-text col-8 col-lg-8 px-1"><%= sinhVien.getNgaySinh().format(formatter) %></p>
							</div>
							<div class="row my-1 ng-star-inserted">
								<p class="card-title col-4 col-lg-4 pr-1">Giới tính</p>
								<p class="card-text col-8 col-lg-8 px-1"><%= sinhVien.getGioiTinh() %></p>
							</div>
							<div class="row my-1 ng-star-inserted">
								<p class="card-title col-4 col-lg-4 pr-1">Số điện thoại</p>
								<p class="card-text col-8 col-lg-8 px-1"><%= sinhVien.getSoDienThoai() %></p>
							</div>
							<div class="row my-1 ng-star-inserted">
								<p class="card-title col-4 col-lg-4 pr-1">Số CMND/ CCCD</p>
								<p class="card-text col-8 col-lg-8 px-1"><%= sinhVien.getCCCD() %></p>
							</div>
							<div class="row my-1 ng-star-inserted">
								<p class="card-title col-4 col-lg-4 pr-1">Email</p>
								<p class="card-text col-8 col-lg-8 px-1"><%= sinhVien.getEmail() %></p>
							</div>
							<div class="row my-1 ng-star-inserted">
								<p class="card-title col-4 col-lg-4 pr-1">Hộ khẩu</p>
								<p class="card-text col-8 col-lg-8 px-1"><%= sinhVien.getTamTru() %></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="flex2">
				<div class="container">
					<!-- Kết quả học tập -->
					<div class="item1">
						<div class="card" style="margin-top: 5px;">
								<div style="text-align: center;margin-top: 25px;">
									<h5 class="card-title">Kết Quả Học Tập</h5>
								</div>
								<div style="display: flex; align-items: center; justify-content: center;">
									<div id="columnchart_values" style="width:100%; max-width:500px; height:360px;"></div>
									<script src="handleJs/chart.js"></script>
								</div>
						</div>
					</div>
					<!-- Tiến độ học tập -->
					<div class="item2">
						<div class="card" style="margin-top: 5px; height: 423px; margin-left: 1px;">
								<div style="text-align: center; margin-top: 25px;">
									<h5 class="card-title">Tiến độ học tập</h5>
								</div>
								<div style="display: flex; align-items: center; justify-content: center;">
									<canvas id="myChart" style="width:100%;height: 300px; max-width:300px;"></canvas>
									<script src="handleJs/piechart.js"></script>
								</div>
						</div>
					</div>
					<!-- Thông tin khóa học -->
					<div class="item3">						
						<div class="card shadow-lg my-3 ">
							<div class="card-header tdt">
								Thông Tin Khóa Học
							</div>
							<div class="card-body py-1">
								<div class="container-fluid p-0">
									<div class="row my-1 ng-star-inserted">
										<p class="card-title col-4 col-lg-4 text-nowrap pr-1">Lớp</p>
										<p class="card-text col-8 col-lg-8 px-1"><%= sinhVien.getLop().getMaLop() %> </p>
									</div>
									<div class="row my-1 ng-star-inserted">
										<p class="card-title col-4 col-lg-4 text-nowrap pr-1">Ngành</p>
										<p class="card-text col-8 col-lg-8 px-1"><%= sinhVien.getLop().getNganh().getTenNganh() %> </p>
									</div>
									<div class="row my-1 ng-star-inserted">
										<p class="card-title col-4 col-lg-4 text-nowrap pr-1">Khoa</p>
										<p class="card-text col-8 col-lg-8 px-1"><%= sinhVien.getLop().getNganh().getKhoa().getTenKhoa()%></p>
									</div>
									<div class="row my-1 ng-star-inserted">
										<p class="card-title col-4 col-lg-4 text-nowrap pr-1">Niên Khóa</p>
										<p class="card-text col-8 col-lg-8 px-1"><%= sinhVien.getLop().getKhoaHoc().getNgayBatDau().format(formatter) %> - <%= sinhVien.getLop().getThoiGianKetThuc().format(formatter) %></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>