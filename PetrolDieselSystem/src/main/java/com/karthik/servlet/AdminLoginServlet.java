package com.karthik.servlet;

import com.karthik.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = DBConnection.getConnection()) {
            // Check in 'users' table where role = 'admin'
            String sql = "SELECT * FROM users WHERE username = ? AND password = ? AND role = 'admin' ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {  // If a matching admin user is found
                HttpSession session = request.getSession();
                session.setAttribute("adminUsername", username);
                response.sendRedirect("admin-dashboard.jsp");  // Redirect to admin dashboard
            } else {
                response.sendRedirect("admin-login.jsp?error=invalid"); // Redirect back with error
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin-login.jsp?error=error"); // Redirect with error message
        }
    }
}
