<%@ page import="java.sql.*" %><%
    String id = request.getParameter("d");
    int no = Integer.parseInt(id);
    Statement stmt = null;
    PreparedStatement stmt2 = null;
    ResultSet rset = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/course_online", "root", "11100001");
    stmt = conn.createStatement();
    stmt.executeUpdate("delete from information where id='" + id + "'");
    response.sendRedirect("dashboard.jsp");
%>