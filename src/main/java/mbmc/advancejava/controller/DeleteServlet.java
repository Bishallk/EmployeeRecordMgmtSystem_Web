package mbmc.advancejava.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mbmc.advancejava.service.EmployeeService;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "deleteEmployee", urlPatterns = "/deleteEmployee")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String msg = null;
        try {
            int delId = Integer.parseInt(req.getParameter("deleteId"));
            System.out.println(delId);
            msg = EmployeeService.deleteEmployee(delId);
            HttpSession session = req.getSession();
            session.setAttribute("message", msg);
            resp.sendRedirect("index.jsp");
        } catch (Exception e) {
            System.out.println("Delete servlet :" + e);
        }

    }
}
