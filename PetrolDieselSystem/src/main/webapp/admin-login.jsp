<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login | Petrol & Diesel Ordering</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background: url('https://via.placeholder.com/1500x800') no-repeat center center/cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .admin-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            width: 350px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .btn-admin {
            background-color: #343a40;
            color: white;
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            transition: 0.3s;
        }
        .btn-admin:hover {
            background-color: #23272b;
        }
    </style>
</head>
<body>

    <div class="admin-container">
        <h2>Admin Login</h2>
        <form action="AdminLoginServlet" method="post">
            <div class="mb-3">
                <input type="text" name="username" class="form-control" placeholder="Admin Username" required>
            </div>
            <div class="mb-3">
                <input type="password" name="password" class="form-control" placeholder="Password" required>
            </div>
            <button type="submit" class="btn btn-admin">Login</button>
        </form>
    </div>

</body>
</html>
