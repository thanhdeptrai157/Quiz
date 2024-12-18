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
    <title>Trang đăng ký</title>
    <link rel="stylesheet" href="style.css">
    
</head>
<body>
<form name="signupForm" action="../authen?action=signup" method="post" onsubmit="return validateForm()" accept-charset="UTF-8">
    Name: <input type="text" name="name" required>
    Username: <input type="text" name="username" required>
    Password: <input type="password" name="password" required>
    Re-enter Password: <input type="password" name="repassword" required>
    Role: <input type="text" name="role" required>
    <div class="btn">
        <button type="submit">Đăng ký</button>
    </div>
</form>
</body>
<script>
        function validateForm() {
        const password = document.forms["signupForm"]["password"].value;
        const repassword = document.forms["signupForm"]["repassword"].value;

        if (password !== repassword) {
            alert("Passwords do not match!");
            return false;
        }
            return true;
        }
</script>
</script>
</html>