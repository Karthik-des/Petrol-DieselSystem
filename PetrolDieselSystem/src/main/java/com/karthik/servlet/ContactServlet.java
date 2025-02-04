package com.karthik.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");

        // Process the form data (e.g., save to a database or send an email)
        // Here, just logging for demonstration
        System.out.println("Name: " + name);
        System.out.println("Email: " + email);
        System.out.println("Phone: " + phone);
        System.out.println("Message: " + message);

        // Redirect to a success page or show a confirmation message
        request.setAttribute("message", "Thank you for contacting us, " + name + ". We will get back to you soon!");
        request.getRequestDispatcher("contact-success.jsp").forward(request, response);
    }
}
