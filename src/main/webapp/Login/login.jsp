<%--
  Created by IntelliJ IDEA.
  User: giapwibu
  Date: 12/6/24
  Time: 5:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<form action="../authen?action=login" method="post" accept-charset="UTF-8">
    username <input type="text" name="username">
    password <input type="password" name="password">
    <div class="btn">
        <button type="submit">Login</button>
    </div>

</form>


</body>
</html>
