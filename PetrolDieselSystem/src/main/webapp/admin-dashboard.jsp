<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession sessionAdmin = request.getSession(false);
    if (sessionAdmin == null || sessionAdmin.getAttribute("adminUsername") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    ArrayList<String[]> usersList = (ArrayList<String[]>) request.getAttribute("usersList");
    ArrayList<String[]> ordersList = (ArrayList<String[]>) request.getAttribute("ordersList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar-brand, .nav-link {
            color: #ffffff !important;
        }
        .navbar-nav .nav-item:hover {
            background-color: #495057;
        }
        .card {
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .table thead {
            background-color: #007bff;
            color: white;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f2f2f2;
        }
        .btn-custom {
            background-color: #28a745;
            color: white;
        }
        .btn-custom:hover {
            background-color: #218838;
        }
        .container {
            max-width: 1200px;
            margin-top: 30px;
        }
        .logout-btn {
            background-color: #dc3545;
            color: white;
        }
        .logout-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Admin Dashboard</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="AdminDashboardServlet">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="card mb-4">
                    <div class="card-body">
                        <h2 class="card-title">Admin Dashboard</h2>
                        <p class="card-text">Welcome to the admin dashboard. Below you'll find a list of registered users and their orders.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Users Table -->
        <div class="card mb-4">
            <div class="card-header">
                <h3>Users List</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Role</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (usersList != null && !usersList.isEmpty()) {
                            for (String[] user : usersList) { %>
                                <tr>
                                    <td><%= user[0] %></td>
                                    <td><%= user[1] %></td>
                                    <td><%= user[2] %></td>
                                    <td><%= user[3] %></td>
                                </tr>
                        <%  } 
                        } else { %>
                            <tr><td colspan="4">No users found.</td></tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Orders Table -->
        <div class="card mb-4">
            <div class="card-header">
                <h3>Orders List</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Username</th>
                            <th>Company</th>
                            <th>Fuel Type</th>
                            <th>Quantity</th>
                            <th>Status</th>
                            <th>Payment Method</th>
                            <th>Order Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (ordersList != null && !ordersList.isEmpty()) {
                            for (String[] order : ordersList) { %>
                                <tr>
                                    <td><%= order[0] %></td>
                                    <td><%= order[1] %></td>
                                    <td><%= order[2] %></td>
                                    <td><%= order[3] %></td>
                                    <td><%= order[4] %></td>
                                    <td><%= order[5] %></td>
                                    <td><%= order[6] %></td>
                                    <td><%= order[7] %></td>
                                </tr>
                        <%  } 
                        } else { %>
                            <tr><td colspan="8">No orders found.</td></tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="d-flex justify-content-between">
            <a href="LogoutServlet" class="btn logout-btn">Logout</a>
            <a href="AdminDashboardServlet" class="btn btn-custom">History</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
