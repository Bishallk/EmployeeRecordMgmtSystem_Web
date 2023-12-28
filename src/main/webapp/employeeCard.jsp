<%@ page import="mbmc.advancejava.models.Employee" %>
<%@ page import="mbmc.advancejava.service.EmployeeService" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Base64" %>
<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%
  try {
    int eId=Integer.parseInt(request.getParameter("viewId"));
    Employee employee= EmployeeService.getEmployeeById(eId);
%>
<html>
<head>
    <title><%=employee.getName()%></title>
  <jsp:include page="common_css_js.jsp"/>
</head>
<body class="bg-info-subtle">
<div class="card me-auto ms-auto mt-4" style="width: 300px">
  <img src="data:image/jpeg;base64,<%=new String(Base64.getEncoder().encode(employee.getProfilePic()))%>"
       alt="Product Image" class="img-fluid" width="300px">
  <div class="card-body text-center">
    <h4 class="card-title"><%=employee.getName()%></h4>
    <p class="card-text"><%=employee.getDepartment()%></p>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">Id: <%=employee.getId()%></li>
    <li class="list-group-item">Address: <%=employee.getAddress()%></li>
    <li class="list-group-item">Gender: <%=employee.getGender()%></li>
    <li class="list-group-item">Salary: <%=employee.getSalary()%></li>
    <li class="list-group-item">
      <a href="index.jsp">
        <button class="btn btn-danger w-100">
          Go Back
        </button>

      </a>

    </li>
  </ul>
</div>
<%} catch (Exception e) {
System.out.println("CArd: " + e);
}
%>
</body>
</html>
