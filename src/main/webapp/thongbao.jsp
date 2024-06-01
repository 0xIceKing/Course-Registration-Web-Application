<%@page import="model.NoiDungThongBao"%>
<%@page import="model.LoaiThongBao"%>
<%@page import="database.ThongBaoDAO" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông báo</title>
<link rel="stylesheet" type="text/css" href="css/trangChu.css">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
	integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>
        /* CSS cho phân trang */
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .pagination a {
            padding: 10px;
            margin: 0 5px;
            text-decoration: none;
            color: #333;
            border: 1px solid #ccc;
            border-radius: 5px;
             font-size: 16px;
        }

        .pagination a:hover {
            background-color: #f0f0f0;
            background-color: red;
        }
    </style>
</head>
<body>	
<%
//--------------------------------------------------------
String page_string=(String)session.getAttribute("trang");
String loai_thong_bao=(String)session.getAttribute("loaiThongBao");
int value_page=Integer.parseInt(page_string);
ArrayList<NoiDungThongBao> dsNDTB= (ArrayList<NoiDungThongBao>)session.getAttribute("result");

%>
		<div class="news-content">
				<ul class="news-list-items">
				<%
					for (NoiDungThongBao ndtb:dsNDTB) {%>
					<li class="notice-item"><%= ndtb.getTieuDe() %><br><span class="date"><%=ndtb.getThoiGianThongBao() %></span>
							</li>	
							<%} %>
				</ul>		
		</div>
			 <div class="pagination">
				<a onclick="changeValue('-1'); changeText();"> < </a>
				<a href="#" id="value_page">0</a>
				<a onclick="changeValue('+1'); changeText();" href="http://localhost:8080/DoAnDKHP_Nhom14/trangChu?hanhDong=a&loaiThongBao=<%=loai_thong_bao %>&trang=<%=value_page+1%>"/> '>' </a>
			</div>
			
<script>

	function changeText(){
	    document.getElementById("value_page").innerHTML = page;	    
    } 
</script>
</body>
</html>