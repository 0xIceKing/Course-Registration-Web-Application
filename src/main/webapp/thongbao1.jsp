<%@page import="model.NoiDungThongBao"%>
<%@page import="model.LoaiThongBao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style0893.css" />
</head>

<body>
<% 
String value=request.getParameter("value");
 int value_page=Integer.parseInt(value);
ArrayList<NoiDungThongBao> dsNDTB = (ArrayList<NoiDungThongBao>) session.getAttribute("dsNDTB");

%>
	<div class="studentManageContent" style="width: -webkit-fill-available; height:100%;padding:0;margin:0">
		<div class="studentList">
			<table class="table">
									<thead
										style="background-color: rgb(238, 70, 70); color: white; font-size: 20px; border-color: black;">
										<tr>
											<th style="width: 9%">MãTB</th>
											<th style="width: 27%">Tiêu đề</th>
											<th style="width: 50%">Nội dung</th>
											<th style="width: 15%">Ngày TB</th>
											<th style="width: 10%">Loại</th>
											<th style="width: 12%"></th>
											<th style="width: 12%"></th>
										</tr>
									</thead>
									<tbody>
									<%if(value_page==1){ 
										for (int i = 0; i < Math.min(10, dsNDTB.size()); i++) { %>
										<tr>
							                <td><%= dsNDTB.get(i).getMaNoiDungThongBao() %></td>
							                <td><%= dsNDTB.get(i).getTieuDe() %></td>
							                <td><%= dsNDTB.get(i).getNoiDung() %></td>
							                <td><%= dsNDTB.get(i).getThoiGianThongBao() %></td>
							                <td><%= dsNDTB.get(i).getLtb().getMaLoaiThongBao() %></td>
							                <td><a href="upDateStudent" class="btn btn-update">Sửa</a></td>
							                <td><a class="btn btn-danger">Xóa</a></td>
							            </tr>
									<%}
									}else{
										for (int i = (value_page-1)*10; i < Math.min(value_page * 10, dsNDTB.size()); i++) { %>
										<tr>
							                <td><%= dsNDTB.get(i).getMaNoiDungThongBao() %></td>
							                <td><%= dsNDTB.get(i).getTieuDe() %></td>
							                <td><%= dsNDTB.get(i).getNoiDung() %></td>
							                <td><%= dsNDTB.get(i).getThoiGianThongBao() %></td>
							                <td><%= dsNDTB.get(i).getLtb().getMaLoaiThongBao() %></td>
							                <td><a href="upDateStudent" class="btn btn-add">Sửa</a></td>
							                <td><a class="btn btn-danger">Xóa</a></td>
							            </tr>																		
										<%
										}									
										}%>							        									
									</tbody>
								</table>
		</div>
	</div>
	
</body>
</html>