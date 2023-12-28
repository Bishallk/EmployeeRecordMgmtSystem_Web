<%@ page import="mbmc.advancejava.models.Employee" %>
<%@ page import="mbmc.advancejava.service.EmployeeService" %>
<%@ page import="java.sql.SQLException" %>
<%
    int updateId = Integer.parseInt(request.getParameter("updateId"));
    Employee e = new Employee();
    try {
        e = EmployeeService.getEmployeeById(updateId);

    } catch (Exception ex) {
        System.out.println("update Employee :" + ex);
    }
%>

<!doctype html>
</html>
<html>
<head>
    <jsp:include page="common_css_js.jsp"/>
    <title><%= e.getName()%>
    </title>
</head>
<body class="bg-info-subtle">
<div class="card row ms-auto me-auto mt-4 col-4 mb-3">
    <div class="card-header">
        Employee Update
    </div>
    <div class="card-body">
        <form action="updateEmployee"
              method="post"
              enctype="multipart/form-data"
              class="">
            <div class="d-block">

                <div class="mb-3 col">
                    <label for="eId"
                           class="form-label">Employee Id</label>
                    <input value="<%=e.getId()%>"
                           disabled
                           name="Id"
                           type="text"
                           class="form-control"
                           id="eId"
                           placeholder="Employee Id"
                           required>
                </div>
                <div class="mb-3 col">
                    <label for="eName"
                           class="form-label">Name</label>
                    <input value="<%=e.getName()%>"
                           name="Name"
                           type="text"
                           class="form-control"
                           id="eName"
                           placeholder="Employee name"
                           required>
                </div>
                <div class="mb-3 col">
                    <label for="eGender"
                           class="form-label">Gender</label>
                    <select name="Gender"
                            class="form-select"
                            aria-label="Default select example"
                            id="eGender"
                            required>
                        <option disabled
                                selected
                                class="text-bg-danger">Select Gender
                        </option>
                        <option>Male</option>
                        <option>Female</option>
                        <option>Other</option>
                    </select>
                </div>


                <div class="mb-3 col">
                    <label for="eAddress"
                           class="form-label">Address</label>
                    <input value="<%=e.getAddress()%>"
                           name="Address"
                           type="text"
                           class="form-control"
                           id="eAddress"
                           placeholder="Employee Address"
                           required>
                </div>

                <div class="mb-3 col">
                    <label for="eDepartment"
                           class="form-label">Department</label>
                    <select name="Department"
                            class="form-select"
                            aria-label="Default select example"
                            id="eDepartment">
                        <option disabled
                                selected
                                class="text-bg-danger">Select Department
                        </option>
                        <option>Sales</option>
                        <option>Human Resources</option>
                        <option>Information Technology</option>
                        <option>Marketing</option>
                        <option>Finance</option>
                        <option>Customer Service</option>
                        <option>Research & Development</option>
                    </select>
                </div>
                <div class="mb-3 col">
                    <label for="eSalary"
                           class="form-label">Salary</label>
                    <input value="<%=e.getSalary()%>"
                           name="Salary"
                           type="number"
                           class="form-control"
                           id="eSalary"
                           placeholder="Employee salary"
                           min="0"
                           required>
                </div>

                <div class="mb-3 col">
                    <label for="eProfile"
                           class="form-label">Profile Image</label>
                    <input name="eProfile"
                           type="file"
                           class="form-control"
                           id="eProfile">
                </div>

                <div class="row m-3 d-flex justify-content-around">
                    <button class="btn btn-danger col-5  ">
                        <a href="index.jsp"
                           class="nav-link">Cancel</a>
                    </button>
                    <button class="btn btn-success col-5"
                            type="submit">
                        Update
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>

