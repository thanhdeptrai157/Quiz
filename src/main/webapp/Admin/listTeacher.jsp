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
        <a href="./Admin/addTeacher.jsp" class="add-button">Add Teacher</a>

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
                <tr id="teacher-row-<%= teacher.getIdGV() %>">
                    <td><%= teacher.getIdGV() %></td>
                    <td><%= teacher.getNameGV() %></td>
                    <td><%= teacher.getUsernameGV() %></td>
                    <td><%= teacher.getNumberOfTests() %></td>
                    <td class="action-buttons">
                        <a href="admin?action=viewDetail&idgv=<%=teacher.getIdGV()%>" class="view">View Tests</a>
                        <a href="admin?action=editName&idgv=<%=teacher.getIdGV()%>" class="edit">Edit name</a>
                        <a href="#!" onclick="showPopup('<%= teacher.getNameGV() %>', '<%= teacher.getIdGV() %>')" class="reset">Reset Password</a>
                        <a href="javascript:void(0);" onclick="deleteTeacher('<%= teacher.getIdGV() %>')" class="delete">Delete</a>
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

<div class="popup-overlay" id="popup-overlay">
    <div class="popup-content">
        <p id="popup-message">Reset password cho giáo viên tên là  có ID là </p>
        <div class="popup-buttons">
            <button class="confirm" id="confirm-button">Xác nhận</button>
            <button class="cancel" onclick="hidePopup()">Hủy</button>
        </div>
    </div>
</div>

<script>
    let teacherId = "";

    function showPopup(name, id) {
     console.log("Name: ", name, "ID: ", id);
        if (!name || !id) {
            alert("Dữ liệu giáo viên không hợp lệ!");
            return;
        }

        teacherId = id;

       document.getElementById("popup-message").innerText = "Reset password cho giáo viên "+ name + " có id "+id;
        document.getElementById("popup-overlay").style.display = "flex";
    }

    function hidePopup() {
        document.getElementById("popup-overlay").style.display = "none";
    }

    document.getElementById("confirm-button").addEventListener("click", function () {
          fetch("${pageContext.request.contextPath}/admin?action=resetPassword&idgv=" + teacherId, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            }

        }).then(response => {
            if (response.ok) {
                alert("Password reset to 123456 successfully.");
                hidePopup();
                window.location.reload();
            } else {
                alert("Failed to reset password. Please try again.");
            }
        }).catch(error => {
            console.error("Error:", error);
            alert("An error occurred. Please try again.");
        });
    });

    function deleteTeacher(id) {
        if (confirm("Are you sure you want to delete this teacher?")) {
            fetch("${pageContext.request.contextPath}/admin?action=delete&idgv=" + id, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                }
            })
            .then(response => {
                if (response.ok) {
                    // Nếu xóa thành công, xóa trực tiếp dòng tương ứng trong bảng
                    const row = document.getElementById("teacher-row-" + id); // Mỗi dòng của giáo viên sẽ có ID là "teacher-row-{id}"
                    if (row) {
                        row.remove(); // Xóa dòng
                    }
                    alert("Teacher deleted successfully.");
                } else {
                    alert("Failed to delete teacher. Please try again.");
                }
            })
            .catch(error => {
                console.error("Error:", error);
                alert("An error occurred. Please try again.");
            });
        }
    }


</script>


</body>
</html>
