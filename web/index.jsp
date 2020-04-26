<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 4/17/20
  Time: 10:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="com.codegym.readFile.*" %>
<%@ page language="java" import="java.util.*" %>
<%
    String filePath = "/root/Documents/Codegym_Projects/Case_Study_Module_2_Project/web/storage_file/CoursesData.csv";
    CourseController course = new CourseController(new CSVStorage());
    course.read(filePath);
    List<InformationCourse> listCourse = course.getListCourse();
%>
<html>
<head>
    <title>Khóa Học Online</title>
    <link href="css/style.css" type="text/css" rel="stylesheet"/>
</head>
<body>
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
                    <li><a href="login.jsp">Đăng Nhập</a></li>
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
                        Chúng tôi phát triển các giải pháp học tập hiện đại và hiệu quả trên nền tảng công nghệ giáo
                        dục.
                    </p>
                    <button>Chi Tiết</button>
                </div>
            </article>
            <article id="article_1">
                <div class="header_bar_main">Khóa Học Mới Nhất</div>
                <table>
                    <tr>
                        <%
                            for (int i = 0; i < listCourse.size(); i++) {
                                if (i != 3) {
                        %>
                        <td>
                            <img src="image/html_5.jpg" alt="html_5" width="150" height="120"/>
                            <span><%=listCourse.get(i).getNameCourse()%></span>
                            <span><%=listCourse.get(i).getPriceCourse()%></span>
                            <input type="button" value="Chi Tiết" class="btn"/>
                        </td>
                        <%
                            } else {
                        %>
                    </tr>
                    <tr>
                        <td>
                            <img src="image/html_5.jpg" alt="html_5" width="150" height="120"/>
                            <span><%=listCourse.get(i).getNameCourse()%></span>
                            <span><%=listCourse.get(i).getPriceCourse()%></span>
                            <input type="button" value="Chi Tiết" class="btn"/>
                        </td>
                        <%
                                }
                        %>
                        <%
                            }
                        %>
                    </tr>
                </table>
            </article>
            <article id="article_2">
                <div class="header_bar_main">Tuyển Dụng</div>
                <table>
                    <tr>
                        <td>
                            <p>
                                Yêu cầu chung:<br/>
                                Đã lập trình với ngôn ngữ JAVA hoặc .NET và sẽ được đào tạo thêm khi tham gia dự
                                án.<br/>
                            </p>
                            <input type="button" value="Ứng Tuyển" class="btn"/>
                        </td>
                        <td>
                            <p>
                                Yêu cầu chung:<br/>
                                Thao tác tốt với có sở dữ liệu Mysql, Java Servlet Progrmming (JSP) kinh nghiệm 3
                                năm.<br/>
                            </p>
                            <input type="button" value="Ứng Tuyển" class="btn"/>
                        </td>
                        <td>
                            <p>
                                Yêu cầu chung:<br/>
                                Sử Dụng thành thạo ngôn ngữ JavaScript, HTML và CSS. Biết Tiếng Anh và có thể đọc tài
                                liệu.<br/>
                            </p>
                            <input type="button" value="Ứng Tuyển" class="btn"/>
                        </td>
                    </tr>
                </table>
            </article>
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
