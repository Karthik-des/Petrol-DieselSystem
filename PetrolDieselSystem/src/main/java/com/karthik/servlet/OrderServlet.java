package com.karthik.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.karthik.util.DBConnection;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String company = request.getParameter("company");
        String fuelType = request.getParameter("fuelType");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO orders (username, company, fuel_type, quantity, status) VALUES (?, ?, ?, ?, 'Pending')";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, company);
            pstmt.setString(3, fuelType);
            pstmt.setInt(4, quantity);
            pstmt.executeUpdate();
            
            session.setAttribute("orderSuccess", "Order placed successfully! Proceed to payment.");
            response.sendRedirect("payment.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("order.jsp?error=Order Failed");
        }
    }
}
