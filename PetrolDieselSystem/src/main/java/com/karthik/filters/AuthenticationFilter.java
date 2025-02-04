package com.karthik.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthenticationFilter implements Filter {

    public AuthenticationFilter() {
        // Default constructor
    }

    @Override
    public void init(FilterConfig fConfig) throws ServletException {
        // Filter initialization if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        // Check if user is logged in
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

        // Allow access to login and registration pages without authentication
        String loginURI = req.getContextPath() + "/login.jsp";
        String registerURI = req.getContextPath() + "/register.jsp";
        boolean isLoginPage = req.getRequestURI().equals(loginURI);
        boolean isRegisterPage = req.getRequestURI().equals(registerURI);

        if (isLoggedIn || isLoginPage || isRegisterPage) {
            // User is logged in or accessing login/registration pages, continue request
            chain.doFilter(request, response);
        } else {
            // Redirect to login page
            res.sendRedirect(loginURI);
        }
    }

    @Override
    public void destroy() {
        // Cleanup if needed
    }
}
