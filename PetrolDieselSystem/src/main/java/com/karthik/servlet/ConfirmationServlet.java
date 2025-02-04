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

@WebServlet("/confirmation")
public class ConfirmationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username"); // Get username from session
        Integer orderId = (Integer) session.getAttribute("orderId"); // Get order ID from session

        if (username == null || orderId == null) {
            session.setAttribute("confirmationError", "Session expired. Please login again.");
            response.sendRedirect("login.jsp");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT company, fuel_type, quantity, status, payment_method, order_date FROM orders WHERE order_id = ? AND username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderId);
            ps.setString(2, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                session.setAttribute("company", rs.getString("company"));
                session.setAttribute("fuelType", rs.getString("fuel_type"));
                session.setAttribute("quantity", rs.getInt("quantity"));
                session.setAttribute("status", rs.getString("status"));
                session.setAttribute("paymentMethod", rs.getString("payment_method"));
                session.setAttribute("orderDate", rs.getString("order_date"));
                response.sendRedirect("confirmation.jsp"); // Redirect to confirmation page
            } else {
                session.setAttribute("confirmationError", "Order details not found.");
                response.sendRedirect("home.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("confirmationError", "Something went wrong!");
            response.sendRedirect("home.jsp");
        }
    }
}
