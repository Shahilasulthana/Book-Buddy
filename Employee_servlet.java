import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Employee details: Name, Department, Salary
        String[][] employees = {
            {"John Doe", "IT", "60000"},
            {"Jane Smith", "HR", "55000"},
            {"Alice Johnson", "Finance", "65000"},
            {"Bob Brown", "Marketing", "58000"},
            {"Charlie White", "Operations", "62000"}
        };
        
        double totalSalary = 0;
        int employeeCount = employees.length;
        
        out.println("<html><body>");
        out.println("<h2>Employee Details</h2>");
        out.println("<table border='1'>");
        out.println("<tr><th>Name</th><th>Department</th><th>Salary</th></tr>");
        
        for (String[] employee : employees) {
            String name = employee[0];
            String department = employee[1];
            double salary = Double.parseDouble(employee[2]);
            totalSalary += salary;
            
            out.println("<tr>");
            out.println("<td>" + name + "</td>");
            out.println("<td>" + department + "</td>");
            out.println("<td>$" + salary + "</td>");
            out.println("</tr>");
        }
        
        double averageSalary = totalSalary / employeeCount;
        
        out.println("</table>");
        out.println("<h3>Total Salary: $" + totalSalary + "</h3>");
        out.println("<h3>Average Salary: $" + averageSalary + "</h3>");
        out.println("</body></html>");
    }
}