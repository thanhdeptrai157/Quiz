<%--
  Created by IntelliJ IDEA.
  User: giapwibu
  Date: 12/6/24
  Time: 7:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Signup Form</title>
    <script>
        function validateForm() {
            const password = document.forms["signupForm"]["password"].value;
            const repassword = document.forms["signupForm"]["repassword"].value;

            if (password !== repassword) {
                alert("Passwords do not match!");
                return false; // Ngăn form gửi đi
            }
            return true; // Cho phép gửi form
        }
    </script>
</head>
<body>
<form name="signupForm" action="../author?mod=signup" method="post" onsubmit="return validateForm()">
    Name: <input type="text" name="name" required><br>
    Username: <input type="text" name="username" required><br>
    Password: <input type="password" name="password" required><br>
    Re-enter Password: <input type="password" name="repassword" required><br>
    Role: <input type="text" name="role" required><br>
    <button type="submit">OK</button>
</form>
</body>
</html>