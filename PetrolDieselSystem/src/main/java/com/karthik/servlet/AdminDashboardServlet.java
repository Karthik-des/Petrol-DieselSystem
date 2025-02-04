package com.karthik.servlet;

import com.karthik.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminUsername") == null) {
            response.sendRedirect("admin-login.jsp");
            return;
        }

        ArrayList<String[]> usersList = new ArrayList<>();
        ArrayList<String[]> ordersList = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            // Fetch all users
            String userQuery = "SELECT id, username, email, role FROM users";
            PreparedStatement userPs = conn.prepareStatement(userQuery);
            ResultSet userRs = userPs.executeQuery();
            while (userRs.next()) {
                usersList.add(new String[]{
                    userRs.getString("id"),
                    userRs.getString("username"),
                    userRs.getString("email"),
                    userRs.getString("role") != null ? userRs.getString("role") : "user"
                });
            }

            // Fetch all orders
            String orderQuery = "SELECT order_id, username, company, fuel_type, quantity, status, payment_method, order_date FROM orders";
            PreparedStatement orderPs = conn.prepareStatement(orderQuery);
            ResultSet orderRs = orderPs.executeQuery();
            while (orderRs.next()) {
                ordersList.add(new String[]{
                    orderRs.getString("order_id"),
                    orderRs.getString("username"),
                    orderRs.getString("company"),
                    orderRs.getString("fuel_type"),
                    orderRs.getString("quantity"),
                    orderRs.getString("status"),
                    orderRs.getString("payment_method"),
                    orderRs.getString("order_date")
                });
            }

            request.setAttribute("usersList", usersList);
            request.setAttribute("ordersList", ordersList);
            request.getRequestDispatcher("admin-dashboard.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin-dashboard.jsp?error=db_error");
        }
    }
}
