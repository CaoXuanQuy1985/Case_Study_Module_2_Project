package com.codegym.logout;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
        session.invalidate();

        String encodedURL = response.encodeRedirectURL("login.jsp");
        response.sendRedirect(encodedURL);
    }
}
