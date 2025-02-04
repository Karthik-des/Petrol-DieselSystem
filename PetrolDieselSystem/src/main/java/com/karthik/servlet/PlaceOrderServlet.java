package com.karthik.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        
        if (session != null && session.getAttribute("username") != null) {
            // User is logged in, redirect to order page
            response.sendRedirect("placeorder.jsp");
        } else {
            // User is not logged in, redirect to login page
            response.sendRedirect("login.jsp?error=Please login to place an order");
        }
    }
}
