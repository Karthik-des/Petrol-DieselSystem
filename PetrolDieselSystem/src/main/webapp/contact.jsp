<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>

    <!-- Bootstrap 5.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <style>
        /* Background and container styling */
        body {
            font-family: 'Arial', sans-serif;
            background-image: url('https://www.w3schools.com/w3images/contact.jpg');
            background-size: cover;
            background-position: center;
            color: white;
            padding-top: 100px;
        }

        .contact-container {
            background-color: rgba(0, 0, 0, 0.7);
            border-radius: 10px;
            padding: 40px;
            max-width: 900px;
            margin: 0 auto;
        }

        h2 {
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-label {
            font-size: 18px;
        }

        .form-control,
        .btn-custom {
            border-radius: 5px;
        }

        .form-control {
            font-size: 16px;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #f2f2f2;
            border: 1px solid #ddd;
            transition: 0.3s ease;
        }

        .form-control:focus {
            background-color: #ffffff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            border-color: #007bff;
        }

        .btn-custom {
            background-color: #007bff;
            color: white;
            padding: 15px 30px;
            border: none;
            font-size: 18px;
            font-weight: bold;
            transition: 0.3s ease;
        }

        .btn-custom:hover {
            background-color: #0056b3;
            cursor: pointer;
        }

        .footer {
            text-align: center;
            margin-top: 50px;
            color: #ddd;
        }

        .footer p {
            margin: 10px 0;
        }

        /* Responsive */
        @media (max-width: 768px) {
            body {
                padding-top: 50px;
            }

            .contact-container {
                padding: 30px;
                margin: 0 20px;
            }

            h2 {
                font-size: 30px;
            }

            .form-label {
                font-size: 16px;
            }

            .form-control {
                font-size: 14px;
            }

            .btn-custom {
                font-size: 16px;
            }
        }
    </style>
</head>

<body>

    <div class="container">
        <div class="contact-container">
            <h2 class="text-center">Contact Us</h2>
            <form action="ContactServlet" method="post">
                <div class="mb-4">
                    <label for="name" class="form-label">Full Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="V. Karthik" required>
                </div>

                <div class="mb-4">
                    <label for="email" class="form-label">Email Address</label>
                    <input type="email" class="form-control" id="email" name="email" value="karthikvenkatesh7258@gmail.com" required>
                </div>

                <div class="mb-4">
                    <label for="phone" class="form-label">Phone Number</label>
                    <input type="tel" class="form-control" id="phone" name="phone" value="9676081475">
                </div>

                <div class="mb-4">
                    <label for="message" class="form-label">Message</label>
                    <textarea class="form-control" id="message" name="message" rows="5" required>Good morning, Sir/Madam.
First of all, thank you for giving me this wonderful opportunity to introduce myself. My name is V. Karthik, and I am a recent graduate from the Computer Science and Engineering department of Kuppam Engineering College, affiliated with JNTU Anantapur.

During my academic journey, I have developed strong technical skills in Core Java, MySQL, HTML, CSS, JavaScript, Servlets, JSP, and Bootstrap. These skills have equipped me to work effectively in software development and web application projects.

Coming to my family background, my father is a farmer, and my mother is a homemaker.

My short-term goal is to secure a job as a software developer or join a reputed IT company where I can utilize my skills and grow professionally. In the long term, I aspire to achieve a leadership position, such as a team leader or project manager. I believe my ability to interact effectively with clients and make informed decisions will help me achieve these goals.

Talking about my strengths, I am a self-motivated person with strong work ethics, quick learning capabilities, and a positive attitude. However, I am working on improving my time management skills, which I consider my weakness.

In my free time, I enjoy watching movies, listening to music, and playing indoor and outdoor games.

Thank you once again for this opportunity.</textarea>
                </div>

                <div class="d-grid gap-2">
                    <button><a href="index.jsp">Home</a></button>
                </div>
            </form>
        </div>
    </div>

    <div class="footer">
        <p>© 2025 Your Company Name. All rights reserved.</p>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
