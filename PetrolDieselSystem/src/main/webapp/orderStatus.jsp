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
    String sql = "SELECT * FROM orders WHERE user_id = ? ORDER BY order_date DESC LIMIT 1";
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setInt(1, userId);
    ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Status</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://source.unsplash.com/1600x900/?fuel,delivery') no-repeat center center/cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            max-width: 500px;
            background: rgba(255, 255, 255, 0.95);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .status {
            font-weight: bold;
            padding: 8px 15px;
            border-radius: 5px;
            display: inline-block;
        }
        .status-pending { background-color: orange; color: white; }
        .status-delivered { background-color: green; color: white; }
        .status-canceled { background-color: red; color: white; }
    </style>
</head>
<body>

    <div class="container">
        <h2 class="text-primary">Order Status</h2>
        <hr>
        <%
            if (rs.next()) {
                String status = rs.getString("status");
                String statusClass = status.equalsIgnoreCase("Delivered") ? "status-delivered" : 
                                     status.equalsIgnoreCase("Pending") ? "status-pending" : "status-canceled";
        %>
            <p><strong>Order ID:</strong> <%= rs.getInt("id") %></p>
            <p><strong>Company:</strong> <%= rs.getString("company") %></p>
            <p><strong>Fuel Type:</strong> <%= rs.getString("fuel_type") %></p>
            <p><strong>Quantity:</strong> <%= rs.getInt("quantity") %> Liters</p>
            <p><strong>Order Date:</strong> <%= rs.getTimestamp("order_date") %></p>
            <p><strong>Delivery Date:</strong> <%= rs.getTimestamp("delivery_date") != null ? rs.getTimestamp("delivery_date") : "Not Assigned" %></p>
            <p><strong>Status:</strong> <span class="status <%= statusClass %>"><%= status %></span></p>
        <%
            } else {
        %>
            <p class="text-danger">No recent orders found.</p>
        <%
            }
        %>
    </div>

</body>
</html>
