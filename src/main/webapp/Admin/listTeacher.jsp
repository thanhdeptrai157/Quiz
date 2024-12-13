<%@ page import="Model.Bean.*" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Giáo Viên</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin/style.css">
</head>
<%
    Account account = (Account) request.getSession().getAttribute("account");
    if(account == null){
        response.sendRedirect("../index.jsp");
    }

%>
<body>
<header>
    <div>
        Quizziz
    </div>
    <div>
        <span> <%= account != null ? account.getName() : ""%></span>
        <a href="${pageContext.request.contextPath}/authen?action=logout">Đăng xuất</a>
    </div>
</header>

    <h1>List of Teachers</h1>
    <div class="container">
        <a href="#!" class="add-button">Add Teacher</a>

        <table>
            <thead>
                <tr>
                    <th>ID Teacher</th>
                    <th>Name Teacher</th>
                    <th>UserName</th>
                    <th>Number of Tests</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Teacher> listTeacher = (List<Teacher>) request.getAttribute("listTeacher");
                    if (listTeacher != null && !listTeacher.isEmpty()) {
                        for (Teacher teacher : listTeacher) {
                %>
                <tr>
                    <td><%= teacher.getIdGV() %></td>
                    <td><%= teacher.getNameGV() %></td>
                    <td><%= teacher.getUsernameGV() %></td>
                    <td><%= teacher.getNumberOfTests() %></td>
                    <td class="action-buttons">
                        <a href="admin?action=viewDetail&idgv=<%=teacher.getIdGV()%>" class="view">View Tests</a>
                        <a href="#!" class="edit">Edit name</a>
                        <a href="#!" class="reset">Reset Password</a>
                        <a href="#!" class="delete">Delete</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5" class="not-found">Does not have any teacher</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
