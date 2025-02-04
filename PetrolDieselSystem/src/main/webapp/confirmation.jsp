<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.karthik.util.DBConnection" %>

<%
    // Retrieve payment method
    String paymentMethod = request.getParameter("paymentMethod");

    // Fetch the last placed order to update its status
    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM orders ORDER BY order_id DESC LIMIT 1");
    ResultSet rs = ps.executeQuery();

    int orderId = 0;
    String company = "";
    String fuelType = "";
    int quantity = 0;
    String orderDate = "";
    if (rs.next()) {
        orderId = rs.getInt("order_id");
        company = rs.getString("company");
        fuelType = rs.getString("fuel_type");
        quantity = rs.getInt("quantity");
        orderDate = rs.getString("order_date");
    }
    
    // Update order status to "Completed"
    if (orderId > 0) {
        PreparedStatement updatePs = con.prepareStatement("UPDATE orders SET status = 'Completed' WHERE order_id = ?");
        updatePs.setInt(1, orderId);
        updatePs.executeUpdate();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation - Petrol & Diesel Ordering System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f9;
            color: #333;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .success-icon {
            font-size: 50px;
            color: green;
        }
        .btn-home {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
        }
        .btn-home:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-success success-icon">✔</h2>
        <h2 class="text-success">Transaction Successful!</h2>
        <p>Your order has been placed successfully.</p>

        <h4>Order Details</h4>
        <p><strong>Company:</strong> <%= company %></p>
        <p><strong>Fuel Type:</strong> <%= fuelType %></p>
        <p><strong>Quantity:</strong> <%= quantity %> liters</p>
        <p><strong>Order Date:</strong> <%= orderDate %></p>
        <p><strong>Payment Method:</strong> <%= paymentMethod %></p>
        <p><strong>Status:</strong> Completed</p>

        <a href="index.jsp" class="btn-home">Go to Home</a>
    </div>
</body>
</html>
