package mbmc.advancejava.service;


import mbmc.advancejava.database.DatabaseConnection;
import mbmc.advancejava.models.Employee;
import java.sql.*;
import java.util.ArrayList;

public class EmployeeService {
    public static String insertEmployee(Employee employee) throws SQLException, ClassNotFoundException {
        String msg;
        try (Connection connection = DatabaseConnection.getConnection()) {
            PreparedStatement statement = connection.prepareStatement(QueryUtils.insertQuery());
            statement.setInt(1, employee.getId());
            statement.setString(2, employee.getName());
//            (id,name,address,gender,department,salary,profilePic)
            statement.setString(3, employee.getAddress());
            statement.setString(4, employee.getGender());
            statement.setString(5, employee.getDepartment());
            statement.setInt(6, employee.getSalary());
            statement.setBytes(7, employee.getProfilePic());
            int rows = statement.executeUpdate();

            if (rows > 0) {
                msg = "New Employee <strong>" + employee.getName() + "</strong> Registration Success!";
            } else {
                msg = "New Employee <strong>" + employee.getName() + "</strong> Registration Failed!";
            }

        } catch (Exception e) {
            msg = "New Employee <strong>" + employee.getName() + "</strong> Registration Failed!";
            System.out.println("From employee Insert :" + e);
        }
        return msg;
    }

    public static String updateEmployee(Employee employee) throws SQLException, ClassNotFoundException {
        String msg;
        try (Connection connection = DatabaseConnection.getConnection()) {
            PreparedStatement statement = connection.prepareStatement(QueryUtils.updateQuery(employee.getId()));
            statement.setString(1, employee.getName());
//            (id,name,address,gender,department,salary,profilePic)
            statement.setString(2, employee.getAddress());
            statement.setString(3, employee.getGender());
            statement.setString(4, employee.getDepartment());
            statement.setInt(5, employee.getSalary());
            statement.setBytes(6, employee.getProfilePic());
            int rows = statement.executeUpdate();
            if (rows > 0) {
                msg = "Employee <strong>" + employee.getName() + "</strong> Update Successfully!";
            } else {
                msg = "Employee <strong>" + employee.getName() + "</strong> Update Failed!";
            }

        } catch (Exception e) {
            msg = "Employee <strong>" + employee.getName() + "</strong> Update Failed!";
            System.out.println("From update employee :" + e);
        }
        return msg;
    }

    public static ArrayList<Employee> getEmployeeList() throws SQLException, ClassNotFoundException {
        ArrayList<Employee> employeeList = new ArrayList<>();
        try (Connection connection = DatabaseConnection.getConnection()) {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(QueryUtils.selectAllQuery());
            Employee employee;
            while (resultSet.next()) {
                employee = new Employee(resultSet.getInt("id"), resultSet.getString("name"),
                        resultSet.getString("gender"), resultSet.getString("department"),
                        resultSet.getInt("salary"), resultSet.getString("address"),
                        resultSet.getBytes("profilePic"));
                employeeList.add(employee);
            }
        }
        return employeeList;
    }

    public static String deleteEmployee(int id) throws SQLException {
        String msg;
        String eName=" ";
        try (Connection connection = DatabaseConnection.getConnection();
             Statement statement = connection.createStatement()) {
            Employee employee = EmployeeService.getEmployeeById(id);
            int rows = statement.executeUpdate(QueryUtils.deleteQuery(id));

            eName = employee.getName();
            if (rows > 0) {
                msg = "Employee <strong>" + eName + "</strong> Deletion Success!";
            } else {
                msg = "Employee <strong>" +eName + "</strong> Deletion Failed!";
            }

        } catch (Exception e) {
            msg = "Employee <strong>" + eName + "</strong> Deletion Failed!";
            System.out.println("From delete employee :" + e);
        }
        return msg;
    }

    public static Employee getEmployeeById(int id) throws SQLException, ClassNotFoundException {
        Employee employee = null;
        try (Connection connection = DatabaseConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(QueryUtils.getByIdQuery(id));) {
//             public Employee(int id, String name, String gender, String department, int salary, String address, byte[] profilePic)
            if (resultSet.next()) {
                employee = new Employee(resultSet.getInt("id"), resultSet.getString("name"),
                        resultSet.getString("gender"), resultSet.getString("department"),
                        resultSet.getInt("salary"), resultSet.getString("address"),
                        resultSet.getBytes("profilePic"));
            } else {
                System.out.println("Employee not found for id : "+id);
            }
        }
        return employee;
    }


}

