<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, com.karthik.util.DBConnection" %>
<%
    String loggedInUser = (String) session.getAttribute("username");
    if (loggedInUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place Order - Petrol & Diesel System</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: black;
            padding: 15px;
        }
        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
            color: #f8c200 !important;
        }
        .nav-link {
            color: white !important;
            font-size: 16px;
            transition: 0.3s;
        }
        .nav-link:hover {
            color: #f8c200 !important;
        }
        .container {
            max-width: 600px;
            background: white;
            padding: 30px;
            margin-top: 50px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .form-label {
            font-weight: bold;
        }
        .btn-submit {
            background-color: #f8c200;
            color: black;
            font-weight: bold;
            transition: 0.3s;
        }
        .btn-submit:hover {
            background-color: #d1a700;
            color: white;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">⛽ Petrol & Diesel Ordering</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="dashboard.jsp">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Order Form -->
    <div class="container">
        <h2 class="text-center mb-4">🚛 Place Your Order</h2>

        <form action="OrderServlet" method="post">
            <!-- Fuel Type Selection -->
            <div class="mb-3">
                <label class="form-label">Select Fuel Type:</label>
                <select class="form-select" name="fuelType" required>
                    <option value="Petrol">Petrol</option>
                    <option value="Diesel">Diesel</option>
                </select>
            </div>

            <!-- Company Selection -->
            <div class="mb-3">
                <label class="form-label">Select Fuel Company:</label>
                <select class="form-select" name="company" required>
                    <option value="Indian Oil">Indian Oil</option>
                    <option value="Bharat Petroleum">Bharat Petroleum</option>
                    <option value="HP">Hindustan Petroleum</option>
                </select>
            </div>

            <!-- Quantity Input -->
            <div class="mb-3">
                <label class="form-label">Enter Quantity (Liters):</label>
                <input type="number" class="form-control" name="quantity" min="1" required>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-submit w-100">Confirm Order</button>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
