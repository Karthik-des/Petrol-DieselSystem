<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }

    // Define fuel prices for different companies (in INR per liter)
    HashMap<String, Double> petrolPrices = new HashMap<>();
    HashMap<String, Double> dieselPrices = new HashMap<>();

    petrolPrices.put("Bharat Petroleum", 102.5);
    petrolPrices.put("HP", 103.0);
    petrolPrices.put("Indian Oil", 101.8);
    petrolPrices.put("Reliance Petroleum", 105.2);
    petrolPrices.put("Shell", 108.5);
    petrolPrices.put("Nayara Energy", 104.0);

    dieselPrices.put("Bharat Petroleum", 92.5);
    dieselPrices.put("HP", 93.0);
    dieselPrices.put("Indian Oil", 91.8);
    dieselPrices.put("Reliance Petroleum", 95.2);
    dieselPrices.put("Shell", 98.0);
    dieselPrices.put("Nayara Energy", 94.5);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place Order - Petrol & Diesel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://source.unsplash.com/1600x900/?fuel,petrol') no-repeat center center/cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-attachment: fixed;
        }
        .container {
            max-width: 500px;
            background: rgba(255, 255, 255, 0.9);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            text-align: center;
        }
        .btn-submit {
            background-color: #007bff;
            color: white;
            padding: 12px;
            font-size: 18px;
            border-radius: 8px;
            width: 100%;
            transition: 0.3s;
        }
        .btn-submit:hover {
            background-color: #0056b3;
        }
        .price-box {
            font-size: 18px;
            font-weight: bold;
            padding: 10px;
            border: 2px solid #007bff;
            border-radius: 8px;
            margin-top: 15px;
        }
    </style>

    <script>
        function updatePrice() {
            var company = document.getElementById("company").value;
            var fuelType = document.querySelector('input[name="fuelType"]:checked');
            var quantity = document.getElementById("quantity").value;

            var petrolPrices = {
                "Bharat Petroleum": 102.5,
                "HP": 103.0,
                "Indian Oil": 101.8,
                "Reliance Petroleum": 105.2,
                "Shell": 108.5,
                "Nayara Energy": 104.0
            };

            var dieselPrices = {
                "Bharat Petroleum": 92.5,
                "HP": 93.0,
                "Indian Oil": 91.8,
                "Reliance Petroleum": 95.2,
                "Shell": 98.0,
                "Nayara Energy": 94.5
            };

            var price = 0;
            if (fuelType) {
                if (fuelType.value === "Petrol") {
                    price = petrolPrices[company];
                } else if (fuelType.value === "Diesel") {
                    price = dieselPrices[company];
                }
            }

            if (!isNaN(quantity) && quantity > 0) {
                document.getElementById("totalPrice").innerText = "Total: ₹" + (price * quantity).toFixed(2);
            } else {
                document.getElementById("totalPrice").innerText = "Total: ₹0.00";
            }
        }
    </script>
</head>
<body>

    <div class="container">
        <h2 class="text-primary">Place Your Order</h2>
        <form action="OrderServlet" method="post">
            
            <!-- Company Selection -->
            <div class="mb-3">
                <label class="form-label">Select Company:</label>
                <select class="form-select" id="company" name="company" required onchange="updatePrice()">
                    <option value="" disabled selected>Choose a company</option>
                    <option value="Bharat Petroleum">Bharat Petroleum</option>
                    <option value="HP">HP</option>
                    <option value="Indian Oil">Indian Oil</option>
                    <option value="Reliance Petroleum">Reliance Petroleum</option>
                    <option value="Shell">Shell</option>
                    <option value="Nayara Energy">Nayara Energy</option>
                </select>
            </div>

            <!-- Fuel Type -->
            <div class="mb-3">
                <label class="form-label">Fuel Type:</label>
                <div>
                    <input type="radio" name="fuelType" value="Petrol" required onchange="updatePrice()"> Petrol
                    <input type="radio" name="fuelType" value="Diesel" required onchange="updatePrice()"> Diesel
                </div>
            </div>

            <!-- Quantity -->
            <div class="mb-3">
                <label class="form-label">Quantity (in liters):</label>
                <input type="number" class="form-control" id="quantity" name="quantity" min="1" required oninput="updatePrice()">
            </div>

            <!-- Price Calculation -->
            <div class="price-box" id="totalPrice">Total: ₹0.00</div>

            <!-- Submit -->
            <button type="submit" class="btn btn-submit mt-3">Proceed to Payment</button>
        </form>
    </div>

</body>
</html>
