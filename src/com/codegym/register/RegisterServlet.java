package com.codegym.register;

import com.codegym.login.LoginServlet;

import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.util.logging.*;
import javax.naming.*;
import javax.servlet.*;
import java.sql.*;
import javax.sql.*;

public class RegisterServlet extends HttpServlet  {
    private DataSource pool;

    @Override
    public void init(ServletConfig config) throws ServletException {
        try {
            InitialContext ctx = new InitialContext();
            pool = (DataSource)ctx.lookup("java:comp/env/jdbc/course_online");
        } catch (NamingException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        Connection conn = null;
        Statement stmt = null;

        try {
            conn = pool.getConnection();
            stmt = conn.createStatement();

            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            StringBuilder sqlCheckExists = new StringBuilder();
            StringBuilder sqlUpdate = new StringBuilder();

            sqlCheckExists.append("SELECT * FROM users WHERE ");
            sqlCheckExists.append("STRCMP(users.username, '");
            sqlCheckExists.append(username).append("') = 0");

            System.out.println(sqlCheckExists.toString());
            ResultSet rset = stmt.executeQuery(sqlCheckExists.toString());

            if (rset.next()) {
                out.println("<html>");
                out.println("<head><title>Register</title></head>");
                out.println("<body>");
                out.println("<h3>Username này đã tồn tại, hãy chọn 1 username khác !!!</h3>");
                out.println("</body>");
                out.println("</html>");
            } else {
                out.println("<html>");
                out.println("<head><title>Register</title></head>");
                out.println("<body>");
                out.println("Đang tiến hành cập nhật cơ sở dữ liêu.");
                out.println("</body>");
                out.println("</html>");

                sqlUpdate.append("INSERT INTO users (username,password,email,phone) VALUES ('");
                sqlUpdate.append(username).append("',");
                sqlUpdate.append("password('");
                sqlUpdate.append(password).append("'),'");
                sqlUpdate.append(email).append("','");
                sqlUpdate.append(phone).append("')");
                System.out.println(sqlUpdate.toString());
                stmt.executeUpdate(sqlUpdate.toString());
                sqlUpdate.delete(0, sqlUpdate.length());

                sqlUpdate.append("INSERT INTO user_roles (username,role) VALUES('");
                sqlUpdate.append(username).append("','user')");
                System.out.println(sqlUpdate.toString());
                stmt.executeUpdate(sqlUpdate.toString());
                sqlUpdate.delete(0, sqlUpdate.length());

                sqlUpdate.append("INSERT INTO information (username,email,phone) VALUES('");
                sqlUpdate.append(username).append("','");
                sqlUpdate.append(email).append("','");
                sqlUpdate.append(phone).append("')");
                System.out.println(sqlUpdate.toString());
                stmt.executeUpdate(sqlUpdate.toString());

                String encodedURL = response.encodeRedirectURL("register-success.jsp");
                response.sendRedirect(encodedURL);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch(SQLException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
