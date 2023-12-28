package mbmc.advancejava.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import mbmc.advancejava.models.Employee;
import mbmc.advancejava.service.EmployeeService;

import java.io.IOException;

@WebServlet(name = "updateEmployee",urlPatterns = "/updateEmployee")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            int eId = Integer.parseInt(req.getParameter("Id"));
            String eName = req.getParameter("Name");
            String eGender = req.getParameter("Gender");
            String eDepartment = req.getParameter("Department");
            int eSalary = Integer.parseInt(req.getParameter("Salary"));
            String eAddress = req.getParameter("eAddress");
            Part image = req.getPart("eProfile");
            byte[] imageBytes=image.getInputStream().readAllBytes();
            Employee employee = new Employee(eId, eName,eGender, eDepartment, eSalary, eAddress, imageBytes);
            String msg = EmployeeService.updateEmployee(employee);
            HttpSession session = req.getSession();
            session.setAttribute("message", msg);
            resp.sendRedirect("index.jsp");
        }catch (Exception ex){
            System.out.println("update employee servlet :"+ex);
        }


    }
}
