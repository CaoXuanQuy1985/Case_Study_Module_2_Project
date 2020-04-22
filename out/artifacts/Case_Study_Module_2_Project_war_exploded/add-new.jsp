<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: root
  Date: 4/19/20
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New</title>
    <link href="css/style.css" type="text/css" rel="stylesheet"/>
    <link href="css/style_login.css" type="text/css" rel="stylesheet"/>
    <link href="css/style_dashboard.css" type="text/css" rel="stylesheet"/>
    <link href="css/style_add.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div id="page">
    <header>
        <div id="banner">
        </div>
        <div id="menu_bar">
            <nav>
                <ul>
                    <li><a href="index.jsp">Trang Chủ</a></li>
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
            <div id="dashboard">
                <h2>Thêm Tài Khoản Thành Viên</h2>
                <form id="form-add-new" action="" method="post">
                    <div class="form-group">
                        <label>Username: </label>
                        <input type="text" class="form-control" name="nm" placeholder="Your Name"/>
                    </div>
                    <div class="form-group">
                        <label>Password: </label>
                        <input id="pwd" type="password" class="form-control" name="pw" placeholder="Your Password"/>
                    </div>
                    <div class="form-group">
                        <label>Email: </label>
                        <input id="email" type="text" class="form-control" name="em" placeholder="Your Email"/>
                    </div>
                    <div class="form-group">
                        <label>Phone: </label>
                        <input id="phone" type="text" class="form-control" name="ph" placeholder="Your Phone"/>
                    </div>
                    <button id="btnSubmit">Thêm</button>
                </form>
            </div>
        </div>
    </div>
    <footer>
        <span>&#64Codegym Việt Nam. <br/>Thiết kế bởi Developer: Cao Xuân Quý</span>
    </footer>
</div>
<script src="js/utilities.js" type="text/javascript"></script>
<script src="js/validate-form.js" type="text/javascript"></script>
</body>
</html>
<%
    String username = request.getParameter("nm");
    String password = request.getParameter("pw");
    String email = request.getParameter("em");
    String phone = request.getParameter("ph");

    String host = "jdbc:mysql://localhost:3306/course_online";
    Connection conn = null;
    PreparedStatement stmt = null;
    Class.forName("com.mysql.jdbc.Driver");

    if (username != null && password != null && email != null && phone != null) {
        conn = DriverManager.getConnection(host, "root", "11100001");
        StringBuilder sqlUpdate = new StringBuilder();
        sqlUpdate.append("INSERT INTO users (username,password,email,phone) VALUES ('");
        sqlUpdate.append(username).append("',");
        sqlUpdate.append("password('");
        sqlUpdate.append(password).append("'),'");
        sqlUpdate.append(email).append("','");
        sqlUpdate.append(phone).append("')");

        conn = DriverManager.getConnection(host, "root", "11100001");
        stmt = conn.prepareStatement(sqlUpdate.toString());
        System.out.println(sqlUpdate.toString());
        stmt.executeUpdate(sqlUpdate.toString());

        String newData = "insert into user_roles(username,role) values(?,?)";
        stmt = conn.prepareStatement(newData);
        stmt.setString(1, username);
        stmt.setString(2, "user");
        stmt.executeUpdate();

        String newData2 = "insert into information(username,email,phone) values(?,?,?)";
        stmt = conn.prepareStatement(newData2);
        stmt.setString(1, username);
        stmt.setString(2, email);
        stmt.setString(3, phone);
        stmt.executeUpdate();
        response.sendRedirect("dashboard.jsp");
    }
%>
