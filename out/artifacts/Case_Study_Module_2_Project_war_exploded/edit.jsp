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
    <title>Edit</title>
    <link href="css/style.css" type="text/css" rel="stylesheet"/>
    <link href="css/style_login.css" type="text/css" rel="stylesheet"/>
    <link href="css/style_dashboard.css" type="text/css" rel="stylesheet"/>
    <link href="css/style-edit.css" type="text/css" rel="stylesheet"/>
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
                <h2>Edit Tài Khoản Thành Viên</h2>
                    <%
                        String host = "jdbc:mysql://localhost:3306/course_online";
                        Connection conn = null;
                        Statement stmt = null;
                        PreparedStatement stmt2 = null;
                        ResultSet rset = null;
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        conn = DriverManager.getConnection(host, "root", "11100001");
                        stmt = conn.createStatement();
                    %>
                    <form id="form-edit" action="" method="post">
                        <%
                            String u = request.getParameter("u");
                            int num = Integer.parseInt(u);
                            String data = "select * from information where id='" + num + "'";
                            System.out.println(data);
                            StringBuilder sqlStr = new StringBuilder();
                            sqlStr.append("select * from information where id='");
                            sqlStr.append(num).append("'");
                            rset = stmt.executeQuery(sqlStr.toString());
                            while (rset.next()) {
                        %>
                        <input type="hidden" name="id" value='<%=rset.getString("id")%>'/>
                        <div class="form-group">
                            <label>Username: </label>
                            <input type="text" class="form-control" name="nm" value='<%=rset.getString("username")%>'/>
                        </div>
                        <div class="form-group">
                            <label>Email: </label>
                            <input id="email" type="text" class="form-control" name="em" value='<%=rset.getString("email")%>'/>
                        </div>
                        <div class="form-group">
                            <label>Phone: </label>
                            <input id="phone" type="text" class="form-control" name="ph" value='<%=rset.getString("phone")%>'/>
                        </div>
                        <button type="submit" id="btnSubmit">Xác Nhận</button>
                    </form>
                </div>
                    <%
                        }
                    %>
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
    String id = request.getParameter("id");
    String username = request.getParameter("nm");
    String email = request.getParameter("em");
    String phone = request.getParameter("ph");

    if (id != null && username != null & email != null && phone != null) {
        String query = "update information set username=?, email=?, phone=? where id='" + id + "'";
        stmt2 = conn.prepareStatement(query);
        stmt2.setString(1,username);
        stmt2.setString(2,email);
        stmt2.setString(3,phone);
        stmt2.executeUpdate();
        response.sendRedirect("dashboard.jsp");
    }
%>
