package com.codegym.login;

import java.io.*;
import java.util.*;
import java.util.logging.*;
import javax.naming.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.sql.*;

public class LoginServlet extends HttpServlet {
    private DataSource pool;

    @Override
    public void init(ServletConfig config) throws ServletException {
        try {
            InitialContext ctx = new InitialContext();
            pool = (DataSource) ctx.lookup("java:comp/env/jdbc/course_online");
        } catch (NamingException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        Connection conn = null;
        Statement stmt = null;
        try {
            out.println("<html><head><title>Login</title></head><body>");
            out.println("<h2>Login</h2>");

            conn = pool.getConnection();
            stmt = conn.createStatement();

            String userName = request.getParameter("username");
            String password = request.getParameter("password");
            boolean hasUsername = (userName != null) && ((userName = userName.trim()).length() > 0);
            boolean hasPassword = (password != null) && ((password = password.trim()).length() > 0);

            if (!hasUsername) {
                out.println("<h3>Please Enter Your username!</h3>");
            } else if (!hasPassword) {
                out.println("<h3>Please Enter Your password!</h3>");
            } else {
                StringBuilder sqlStr = new StringBuilder();
                sqlStr.append("SELECT * FROM users, user_roles WHERE ");
                sqlStr.append("STRCMP(users.username, '")
                        .append(userName).append("') = 0 ");
                sqlStr.append("AND STRCMP(users.password, PASSWORD('")
                        .append(password).append("')) = 0 ");
                sqlStr.append("AND users.username = user_roles.username");
                System.out.println(sqlStr);

                ResultSet rset = stmt.executeQuery(sqlStr.toString());

                if (!rset.next()) {
                    out.println("<h3>Wrong username/password!</h3>");
                    out.println("<p><a>Back to Login Menu</a></p>");

                    String encodeURLInvalid = response.encodeRedirectURL("invalid-login.jsp");
                    response.sendRedirect(encodeURLInvalid);
                } else {
                    List<String> roles = new ArrayList<String>();
                    do {
                        roles.add(rset.getString("role"));
                    } while (rset.next());

                    HttpSession session = request.getSession(false);
                    if (session != null) {
                        session.invalidate();
                    }
                    session = request.getSession(true);
                    synchronized(session) {
                        session.setAttribute("username", userName);
                        session.setAttribute("roles", roles);
                    }

                    String encodedURL = response.encodeRedirectURL("login_session.jsp");
                    response.sendRedirect(encodedURL);
                    out.println("<p>Hello, " + userName + "!</p>");
                    out.println("<p><a href=\"dosomething\">Do Somethings</a></p>");
                }
            }
            out.println("</body></html>");
        } catch (SQLException ex) {
            out.println("<h3>Service not available. Try again later!</h3></body></html>");
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
