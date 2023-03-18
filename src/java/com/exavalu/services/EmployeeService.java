/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.empweb.utils.JDBCConnectionManager;
import com.exavalu.entities.Employee;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Avijit
 */
public class EmployeeService {

    public static ArrayList getAllEmployees() {

        ArrayList empList = new ArrayList();
        try {
            Connection con = JDBCConnectionManager.getMySQLConnection();
            String sql = "select * from employees e, departments d, roles r "
                    + "where e.departmentId=d.departmentId and e.roleId=r.roleId ";
            PreparedStatement preparedStatement = con.prepareStatement(sql);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Employee emp = new Employee();
                emp.setAddress(rs.getString("address"));
                emp.setEmployeeId(rs.getString("employeeId"));
                emp.setFirstName(rs.getString("firstName"));
                emp.setLastName(rs.getString("lastName"));
                emp.setPhone(rs.getString("phone"));
                emp.setGender(rs.getString("gender"));
                emp.setAge(rs.getString("age"));
                emp.setDepartmentName(rs.getString("departmentName"));
                emp.setRoleName(rs.getString("roleName"));
                emp.setDepartmentId(rs.getString("departmentId"));
                emp.setRoleId(rs.getString("roleId"));
                emp.setBasicSalary(rs.getString("basicSalary"));
                emp.setCarAllowance(rs.getString("carAllowance"));

                empList.add(emp);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        System.out.println("Number of employees = " + empList.size());
        return empList;
    }

    public static Employee getEmployee(String employeeId) {

        Employee emp = new Employee();

        try {
            Connection con = JDBCConnectionManager.getMySQLConnection();
            String sql = "select * from employees e, departments d, roles r "
                    + "where e.departmentId=d.departmentId and e.roleId=r.roleId and  e.employeeId =?";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, employeeId);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {

                emp.setAddress(rs.getString("address"));
                emp.setEmployeeId(rs.getString("employeeId"));
                emp.setFirstName(rs.getString("firstName"));
                emp.setLastName(rs.getString("lastName"));
                emp.setPhone(rs.getString("phone"));
                emp.setGender(rs.getString("gender"));
                emp.setAge(rs.getString("age"));
                emp.setDepartmentId(rs.getString("departmentId"));
                emp.setRoleId(rs.getString("roleId"));
                emp.setDepartmentName(rs.getString("departmentName"));
                emp.setRoleName(rs.getString("roleName"));
                emp.setBasicSalary(rs.getString("basicSalary"));
                emp.setCarAllowance(rs.getString("carAllowance"));

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return emp;

    }

    public static boolean updateEmployee(Employee emp, String employeeId) {

        boolean result = false;
        try {
            Connection con = JDBCConnectionManager.getMySQLConnection();
            String sql = "UPDATE employeedb.employees\n"
                    + "SET firstName = ? , lastName = ? , phone = ? , address = ? ,\n"
                    + "gender = ? , age = ? , basicSalary = ?,carAllowance = ?,departmentId= ? ,roleId= ?\n"
                    + "WHERE employeeId = ?";

            PreparedStatement preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, emp.getFirstName());
            preparedStatement.setString(2, emp.getLastName());
            preparedStatement.setString(3, emp.getPhone());
            preparedStatement.setString(4, emp.getAddress());
            preparedStatement.setString(5, emp.getGender());
            preparedStatement.setString(6, emp.getAge());
            preparedStatement.setDouble(7, Double.parseDouble(emp.getBasicSalary()));
            preparedStatement.setDouble(8, Double.parseDouble(emp.getCarAllowance()));
            preparedStatement.setString(9, emp.getDepartmentId());
            preparedStatement.setString(10, emp.getRoleId());

            preparedStatement.setString(11, employeeId);

            int row = preparedStatement.executeUpdate();

            if (row == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }

    public static ArrayList getSearchResult(String firstName, String lastName, String gender, String departmentName, String roleName) {
        System.out.println(firstName);
        System.out.println(lastName);
        System.out.println(gender);
        System.out.println(departmentName);
        System.out.println(roleName);
        ArrayList empList = new ArrayList();

        try {
            Connection con = JDBCConnectionManager.getMySQLConnection();
            String sql = "select * from employees e, departments d, roles r "
                    + "where e.departmentId=d.departmentId and e.roleId=r.roleId having firstName like ? and lastName like ? and gender like ? and departmentName like ? and roleName like ?";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, firstName + "%");
            preparedStatement.setString(2, lastName + "%");
            preparedStatement.setString(3, gender + "%");
            preparedStatement.setString(4, departmentName + "%");
            preparedStatement.setString(5, roleName + "%");

//            System.out.println("Prepared statement = "+preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Employee emp = new Employee();
                emp.setAddress(rs.getString("address"));
                emp.setEmployeeId(rs.getString("employeeId"));
                emp.setFirstName(rs.getString("firstName"));
                emp.setLastName(rs.getString("lastName"));
                emp.setPhone(rs.getString("phone"));
                emp.setGender(rs.getString("gender"));
                emp.setAge(rs.getString("age"));
                emp.setDepartmentName(rs.getString("departmentName"));
                emp.setRoleName(rs.getString("roleName"));
                emp.setBasicSalary(rs.getString("basicSalary"));
                emp.setCarAllowance(rs.getString("carAllowance"));
                empList.add(emp);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return empList;
    }

    public static boolean addEmployee(Employee emp, String parameter) {

        boolean result = false;
        try {
            Connection con = JDBCConnectionManager.getMySQLConnection();
            String sql = "INSERT INTO employees (firstName,lastName,phone,address,gender,age,departmentId,roleId,basicSalary,carAllowance)"
                    + "VALUES (?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, emp.getFirstName());
            preparedStatement.setString(2, emp.getLastName());
            preparedStatement.setString(3, emp.getPhone());
            preparedStatement.setString(4, emp.getAddress());
            preparedStatement.setString(5, emp.getGender());
            preparedStatement.setString(6, emp.getAge());
            preparedStatement.setString(7, emp.getDepartmentId());
            preparedStatement.setString(8, emp.getRoleId());

            preparedStatement.setDouble(9, Double.parseDouble(emp.getBasicSalary()));
            preparedStatement.setDouble(10, Double.parseDouble(emp.getCarAllowance()));

            int row = preparedStatement.executeUpdate();

            if (row == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }
}
