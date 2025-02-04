<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/petrol_diesel_db", "root", "password");

        String query = "SELECT o.order_id, u.username, u.email, o.company, o.fuel_type, o.quantity, o.total_price, o.order_date, o.delivery_date, o.status, p.payment_status " +
                       "FROM orders o " +
                       "JOIN users u ON o.user_id = u.id " +
                       "LEFT JOIN payments p ON o.order_id = p.order_id";
        ps = con.prepareStatement(query);
        rs = ps.executeQuery();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Admin Dashboard - Order Details</h2>
        <table class="table table-bordered table-hover mt-4">
            <thead class="table-primary">
                <tr>
                    <th>Order ID</th>
                    <th>User</th>
                    <th>Email</th>
                    <th>Company</th>
                    <th>Fuel Type</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>Order Date</th>
                    <th>Delivery Date</th>
                    <th>Status</th>
                    <th>Payment Status</th>
                </tr>
            </thead>
            <tbody>
                <% while (rs != null && rs.next()) { %>
                    <tr>
                        <td><%= rs.getInt("order_id") %></td>
                        <td><%= rs.getString("username") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("company") %></td>
                        <td><%= rs.getString("fuel_type") %></td>
                        <td><%= rs.getInt("quantity") %></td>
                        <td>₹<%= rs.getDouble("total_price") %></td>
                        <td><%= rs.getTimestamp("order_date") %></td>
                        <td><%= (rs.getDate("delivery_date") != null) ? rs.getDate("delivery_date") : "Not Scheduled" %></td>
                        <td><%= rs.getString("status") %></td>
                        <td><%= (rs.getString("payment_status") != null) ? rs.getString("payment_status") : "Pending" %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <a href="admin-logout.jsp" class="btn btn-danger">Logout</a>
    </div>
    
    <form action="LogoutServlet" method="get">
    <button type="submit" class="btn btn-danger">Logout</button>
</form>
    
</body>
</html>

<%
    if (rs != null) rs.close();
    if (ps != null) ps.close();
    if (con != null) con.close();
%>
