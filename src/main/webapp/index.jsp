<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Record Mgmt System</title>
   <jsp:include page="common_css_js.jsp"/>
</head>
<body>

<div class="container-fluid p-0 m-0">
    <jsp:include page="navBar.jsp"/>
</div>
<div class="mx-5 me5 mt-2 mb-2">
    <jsp:include page="alertMessage.jsp"/>
</div>
<div class="row d-flex justify-content-evenly m-2">
    <div class="col-3 card shadow-sm m-1" id="formDiv">
        <h2 class="card-title text-center p-2">Employee Registration</h2>
        <hr class="text-danger">
        <jsp:include page="insertForm.jsp"/>
    </div>
    <div class="col-8  p-0 m-0 overflow-x-scroll" id="tableDiv">
        <jsp:include page="employeeTable.jsp"/>
    </div>
</div>

</body>
</html>