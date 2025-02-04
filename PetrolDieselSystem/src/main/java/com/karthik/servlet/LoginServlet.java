package com.karthik.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.karthik.util.DBConnection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        
        try {
            // Fetch role for ANY user (admin or normal)
            String query = "SELECT role FROM users WHERE username=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) { 
                String role = rs.getString("role"); // Get user role from DB
                
                // Create a session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", role); // Store role

                if ("admin".equalsIgnoreCase(role)) {
                    response.sendRedirect("admin-dashboard.jsp"); // Redirect admin
                } else {
                    response.sendRedirect("dashboard.jsp"); // Redirect normal user
                }
            } else {
                request.setAttribute("error", "Invalid username or password!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
