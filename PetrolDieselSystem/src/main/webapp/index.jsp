<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Petrol & Diesel Ordering System</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: #000;
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
        .hero {
            background: url('https://source.unsplash.com/1600x900/?fuel,petrol') no-repeat center center/cover;
            height: 500px;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: #fff;
            font-size: 28px;
            font-weight: bold;
            text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.7);
            position: relative;
        }
        .hero-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
        }
        .hero-content {
            position: relative;
            z-index: 2;
        }
        .btn-order {
            background-color: #f8c200;
            color: black;
            padding: 12px 30px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 5px;
            transition: 0.3s;
        }
        .btn-order:hover {
            background-color: #d1a700;
            color: white;
        }
        .features {
            padding: 50px 0;
            text-align: center;
        }
        .feature-icon {
            font-size: 40px;
            color: #f8c200;
            margin-bottom: 15px;
        }
        .footer {
            background-color: black;
            color: #fff;
            text-align: center;
            padding: 15px;
            margin-top: 50px;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">⛽ Petrol & Diesel Ordering</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
                    <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero">
        <div class="hero-overlay"></div>
        <div class="hero-content">
            <h1>Fast, Reliable, and Hassle-Free Fuel Ordering</h1>
            <p>Order Petrol & Diesel Online and Get It Delivered Instantly</p>
            
            <%
                String loggedInUser = (String) session.getAttribute("username");
                if (loggedInUser != null) {
            %>
                <a href="order.jsp" class="btn btn-order mt-3">Place Order</a>
            <%
                } else {
            %>
                <a href="order.jsp" class="btn btn-danger mt-3">Login to Place Order</a>
                
            <%
                }
            %>
        </div>
    </div>

    <!-- Features Section -->
    <div class="container features">
        <div class="row">
            <div class="col-md-4">
                <i class="feature-icon fas fa-truck"></i>
                <h4>Fast Delivery</h4>
                <p>We ensure quick and timely fuel delivery to your location.</p>
            </div>
            <div class="col-md-4">
                <i class="feature-icon fas fa-shield-alt"></i>
                <h4>Secure Payment</h4>
                <p>Pay safely through our encrypted and secure platform.</p>
            </div>
            <div class="col-md-4">
                <i class="feature-icon fas fa-gas-pump"></i>
                <h4>Quality Fuel</h4>
                <p>We provide high-quality petrol and diesel at market rates.</p>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2025 Petrol & Diesel Ordering System. All Rights Reserved.</p>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Font Awesome Icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

</body>
</html>
