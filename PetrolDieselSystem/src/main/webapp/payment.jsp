<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment - Petrol & Diesel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://source.unsplash.com/1600x900/?payment,banking') no-repeat center center/cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-attachment: fixed;
        }
        .container {
            max-width: 450px;
            background: rgba(255, 255, 255, 0.95);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .payment-option {
            display: flex;
            align-items: center;
            padding: 10px;
            border: 2px solid #007bff;
            border-radius: 8px;
            margin-bottom: 10px;
            cursor: pointer;
            transition: 0.3s;
        }
        .payment-option:hover {
            background: #007bff;
            color: white;
        }
        .payment-option input {
            margin-right: 10px;
        }
        .icon {
            font-size: 24px;
            margin-right: 10px;
        }
        .btn-pay {
            background-color: #007bff;
            color: white;
            font-size: 18px;
            padding: 12px;
            border-radius: 8px;
            width: 100%;
            transition: 0.3s;
        }
        .btn-pay:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2 class="text-primary">Choose Payment Method</h2>
        <form action="PaymentServlet" method="post">
            <!-- Credit Card -->
            <label class="payment-option">
                <input type="radio" name="paymentMethod" value="Credit Card" required>
                <i class="fas fa-credit-card icon"></i> Credit Card
            </label>

            <!-- UPI -->
            <label class="payment-option">
                <input type="radio" name="paymentMethod" value="UPI" required>
                <i class="fas fa-mobile-alt icon"></i> UPI (Google Pay, PhonePe, Paytm)
            </label>

            <!-- Cash on Delivery -->
            <label class="payment-option">
                <input type="radio" name="paymentMethod" value="Cash on Delivery" required>
                <i class="fas fa-money-bill-wave icon"></i> Cash on Delivery
            </label>

            <button type="submit" class="btn btn-pay mt-3">Proceed to Pay</button>
        </form>
    </div>

</body>
</html>
