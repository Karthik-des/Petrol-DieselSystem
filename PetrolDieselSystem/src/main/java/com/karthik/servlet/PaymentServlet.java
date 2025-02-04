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

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String paymentMethod = request.getParameter("paymentMethod");
        
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "UPDATE orders SET status = 'Completed', payment_method = ? WHERE username = ? AND status = 'Pending'";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, paymentMethod);
            pstmt.setString(2, username);
            pstmt.executeUpdate();

            session.setAttribute("paymentSuccess", "Payment Successful! Your order will be delivered soon.");
            response.sendRedirect("confirmation.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("payment.jsp?error=Payment Failed");
        }
    }
}
