<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: root
  Date: 4/19/20
  Time: 5:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Session</title>
    <link href="css/style.css" type="text/css" rel="stylesheet"/>
    <link href="css/style_login.css" type="text/css" rel="stylesheet"/>
    <link href="css/style_login_session.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<%
        String userName = (String) session.getAttribute("username");
        List<String> roles = (List<String>) session.getAttribute("roles");
%>
<div id="page">
    <header>
        <div id="banner">
        </div>
        <div id="menu_bar">
            <nav>
                <ul>
                    <li><a href="#">Trang Chủ</a></li>
                    <li><a href="#">Khóa Học</a></li>
                    <li><a href="#">Nâng Cao</a></li>
                    <li><a href="#">Thư Viện</a></li>
                    <li><a href="#">Trắc Nghiệm</a></li>
                    <li><a href="#">Đăng Nhập</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div id="container">
        <div id="left_sidebar" class="sidebar">
            <div class="header_bar">Phân Loại</div>
            <ul>
                <li><a href="#">Lập Trình</a></li>
                <li class="even"><a href="#">Khoa Học</a></li>
                <li><a href="#">Thiên Văn</a></li>
                <li class="even"><a href="#">Địa Lý</a></li>
                <li><a href="#">Toán Học</a></li>
                <li class="even"><a href="#">Hóa Học</a></li>
                <li><a href="#">Văn Học</a></li>
                <li class="even"><a href="#">Sử Học</a></li>
                <li><a href="#">Thuật Toán</a></li>
                <li class="even"><a href="#">Tiếng Anh</a></li>
            </ul>
            <div id="header_special" class="header_bar">Khuyến Mại</div>
            <table id="table_km">
                <tr>
                    <td>
                        <img src="image/kali.jpg" alt="kali" width="150" height="120"/>
                        <span>Giá: 7.500.000 VND</span>
                        <input type="submit" name="addToCart" value="Đăng Kí" class="btn"/>
                        <input type="button" value="Chi Tiết" class="btn"/>
                    </td>
                </tr>
            </table>
        </div>
        <div id="main_content">
            <article id="promotion">
                <div id="logo"></div>
                <div id="description">
                    <p>
                        <b>COGEGYM VIỆT NAM</b><br/>
                        CodeGym là hệ thống đào tạo lập trình viên hiện đại hàng đầu tại Việt Nam.
                        Chúng tôi phát triển các giải pháp học tập hiện đại và hiệu quả trên nền tảng công nghệ giáo dục.
                    </p>
                    <button>Chi Tiết</button>
                </div>
            </article>
            <div id="form_login">
                <h2>Đăng Nhập Thành Công</h2>
                <p>
                    Chào Mừng <b id="username"><%=userName%></b><br/>
                    Bạn đã đăng nhập thành công !!!<br/>
                    Bạn có quyền hạn truy cập là <b id="role"><%=roles.get(0)%></b><br/>
                    Hãy quay về trang chủ để tham khảo khóa học mới nhất<br/>
                    <a href="http://localhost:8080/Case_Study_Module_2_Project_war_exploded/index_session.jsp">Trang Chủ</a>
                </p>
            </div>
        </div>
        <div id="right_sidebar" class="sidebar">
            <div class="header_bar">Giỏ Hàng</div>
            <table id="shop_cart">
                <col style="width:90%">
                <tr>
                    <td id="infor_course">3 Khóa Học</td>
                    <td rowspan="2" id="logo_shopcart"><img src="image/shoppingcart.png"/></td>
                </tr>
                <tr>
                    <td>Tổng Tiền: <b>10.000.000 VND</b></td>
                </tr>
            </table>
            <div id="search_header" class="header_bar">Tìm Kiếm</div>
            <form id="search-form" method="get" action="#">
                <input type="text" name="search" size="15"/>
                <input type="submit" name="btnSearch" value="Search"/>
            </form>
            <div id="albert">
            </div>
        </div>
    </div>
    <footer>
        <span>&#64Codegym Việt Nam. <br/>Thiết kế bởi Developer: Cao Xuân Quý</span>
    </footer>
</div>
</body>
</html>

