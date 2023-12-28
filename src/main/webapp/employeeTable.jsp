<%@ page import="mbmc.advancejava.models.Employee" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mbmc.advancejava.service.EmployeeService" %>
<%@ page import="java.sql.SQLException" %>
<%
    ArrayList<Employee> employeeList = new ArrayList<>();

    try {
        employeeList = EmployeeService.getEmployeeList();

    } catch (SQLException | ClassNotFoundException e) {
        System.out.println("Employee table :" + e);
    }
%>
<table class="table table-striped border-2 m-2 w-100 mt-2">
    <tr class="table-light border-2 p-2 text-center ">
        <th colspan="10" class="text-danger ">Employee Details</th>
    </tr>
    <tr class=" border-2 p-2">
        <th class="border-2 p-2 text-center text-nowrap">SN</th>
        <th class="border-2 p-2 text-center ">Id</th>
        <th class="border-2 p-2 text-center">Name</th>
        <th class="border-2 p-2 text-center">Gender</th>
        <th class="border-2 p-2 text-center">Address</th>
        <th class="border-2 p-2 text-center text-nowrap">Department</th>
        <th class="border-2 p-2 text-center">Salary</th>
        <th class="border-2 p-2 text-center" colspan="3">Action</th>
    </tr>
    <%
        int sn = 1;
        for (Employee e : employeeList) {

    %>

    <tr>
        <td class="border-2 p-2"><%=sn%>
        </td>
        <td class="border-2 p-2"><%=e.getId()%>
        </td>
        <td class="border-2 p-2"><%=e.getName()%>
        </td>
        <td class="border-2 p-2"><%=e.getGender()%>
        </td>
        <td class="border-2 p-2"><%=e.getAddress() %>
        </td>
        <td class="border-2 p-2"><%=e.getDepartment()%>
        </td>
        <td class="border-2 p-2"><%=e.getSalary()%>
        </td>
<%--href="updateEmployeeForm.jsp?updateId=<%=e.getId()%>"  --%>
        <td class="border-2 p-2">
            <a href="${pageContext.request.contextPath}/updateEmployeeForm.jsp?updateId=<%=e.getId()%>">
                <img src="icons/edit.svg" alt="edit" width="20px" title="edit">
            </a>
        </td>
        <td class="border-2 p-2">
            <a href="/deleteEmployee?deleteId=<%=e.getId()%>">
                <img src="icons/delete.svg" alt="edit" width="20px" title="delete">
            </a>
        </td>
        <td class="border-2 p-2">
            <a href="/employeeCard.jsp?viewId=<%=e.getId()%>">
                <img src="icons/view.svg" alt="edit" width="20px" title="view">
            </a>
        </td>
    </tr>
    <% sn++;
        } %>

</table>
