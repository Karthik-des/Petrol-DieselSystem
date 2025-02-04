<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | Petrol & Diesel Ordering</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <!-- Custom Styles -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://source.unsplash.com/1600x900/?fuel,petrol') no-repeat center center/cover;
            height: 100vh;
            margin: 0;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
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
        .register-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 10px;
            width: 100%;
            max-width: 450px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
            margin: 50px auto;
        }
        .register-header {
            font-size: 28px;
            font-weight: 600;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }
        .form-control {
            border-radius: 5px;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 15px;
            transition: 0.3s;
        }
        .form-control:focus {
            box-shadow: 0px 0px 8px rgba(248, 194, 0, 0.7);
        }
        .btn-register {
            background-color: #f8c200;
            color: black;
            width: 100%;
            padding: 12px;
            border-radius: 5px;
            font-weight: bold;
            transition: 0.3s;
        }
        .btn-register:hover {
            background-color: #d1a700;
            color: white;
        }
        .toggle-link {
            cursor: pointer;
            color: #f8c200;
            text-decoration: underline;
        }
        .footer {
            background-color: black;
            color: #fff;
            text-align: center;
            padding: 15px;
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

    <!-- Registration Form -->
    <div class="register-container">
        <h2 class="register-header">Create Your Account</h2>

        <form action="RegisterServlet" method="post">
            <div class="mb-3">
                <input type="text" name="username" class="form-control" placeholder="Username" required>
            </div>
            <div class="mb-3">
                <input type="email" name="email" class="form-control" placeholder="Email" required>
            </div>
            <div class="mb-3">
                <input type="password" name="password" class="form-control" placeholder="Password" required>
            </div>
            <button type="submit" class="btn btn-register">Register</button>
        </form>

        <p class="mt-3 text-center">Already have an account? <a href="login.jsp" class="toggle-link">Login</a></p>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2025 Petrol & Diesel Ordering System. All Rights Reserved.</p>
    </div>

</body>
</html>
