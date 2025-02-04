<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.karthik.util.DBConnection, javax.servlet.http.HttpSession" %>
<%
    HttpSession sess = request.getSession(false);
    if (sess == null || sess.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int userId = (int) sess.getAttribute("userId");
    Connection conn = DBConnection.getConnection();
    String sql = "SELECT * FROM orders WHERE user_id = ? ORDER BY order_date DESC";
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setInt(1, userId);
    ResultSet rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Orders</title>
</head>
<body>
    <h2>My Order History</h2>
    <table border="1">
        <tr>
            <th>Order ID</th>
            <th>Company</th>
            <th>Fuel Type</th>
            <th>Quantity</th>
            <th>Order Date</th>
            <th>Delivery Date</th>
            <th>Status</th>
        </tr>
        <% while (rs.next()) { %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("company") %></td>
            <td><%= rs.getString("fuel_type") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td><%= rs.getTimestamp("order_date") %></td>
            <td><%= rs.getTimestamp("delivery_date") == null ? "Not Scheduled" : rs.getTimestamp("delivery_date") %></td>
            <td><%= rs.getString("status") %></td>
        </tr>
        <% } %>
        <a href="LogoutServlet">Logout</a>  
    </table>
</body>
</html>
