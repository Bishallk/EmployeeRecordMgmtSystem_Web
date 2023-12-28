package mbmc.advancejava.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import mbmc.advancejava.models.Employee;
import mbmc.advancejava.service.EmployeeService;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name ="addEmployee",urlPatterns = "/addEmployee")
@MultipartConfig
public class InsertServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("eId"));
            String name = req.getParameter("eName");
            String gender = req.getParameter("eGender");
            String department = req.getParameter("eDepartment");
            int salary = Integer.parseInt(req.getParameter("eSalary"));
            String address = req.getParameter("eAddress");
            Part image = req.getPart("eProfile");
            byte[] imageBytes=image.getInputStream().readAllBytes();
            Employee employee = new Employee(id, name, gender, department, salary, address, imageBytes);
            String msg = EmployeeService.insertEmployee(employee);
            HttpSession session = req.getSession();
            session.setAttribute("message", msg);
            resp.sendRedirect("index.jsp");
        }catch (Exception ex){
            System.out.println("add employee servlet :"+ex);
        }
    }
}
