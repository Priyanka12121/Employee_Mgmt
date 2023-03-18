<%@page import="com.exavalu.entities.Role"%>
<%@page import="com.exavalu.entities.Department"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.exavalu.entities.Employee"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <title>Employee Management</title>      
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/menu_css.css"rel="stylesheet">
        <link href="css/product.css" rel="stylesheet" >
       <link href="css/signin.css" rel="stylesheet">  
       
        <!-- Custom styles for this template -->
    </head>
    <body class="text-center">
        <jsp:include page="menu.jsp"></jsp:include>
            <main class="form-signin w-100 m-auto">

            <%-- Employee emp = (Employee) request.getAttribute("Emp");--%>
            
            <c:set var="emp" value="${requestScope.Emp}"/>
            
            <form action="SaveEmployee" method="Post">

                <img class="mb-4" src="css/logo.jpg" alt="" width="300" height="100">
                <h1 class="h3 mb-3 fw-normal">Please edit employee data</h1>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="first name" name="employeeId" value=${emp.getEmployeeId()} readonly>
                    <label for="floatingInput">Employee Id</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="first name" name="firstName" value=${emp.getFirstName()}>
                    <label for="floatingInput">First Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="last name" name="lastName" value=${emp.getLastName()}>
                    <label for="floatingInput">Last Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="address" name="address" value=${emp.getAddress()}>
                    <label for="floatingInput">Address</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="phone" name="phone" value=${emp.getPhone()}>
                    <label for="floatingInput">Phone</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="gender" name="gender" value=${emp.getGender()}>
                    <label for="floatingInput">Gender</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="age" name="age" value=${emp.getAge()}>
                    <label for="floatingInput">Age</label>
                </div>
                <!--                <div class="form-floating">
                                    <input type="text" class="form-control" id="floatingInput" placeholder="departmentName" name="departmentName" value=<%--=emp.getDepartmentName()--%>>
                                    <label for="floatingInput">Department Name</label>
                                </div>-->
<!--                <div class="form-floating">
                    <%--ArrayList deptList = (ArrayList) request.getAttribute("DeptList");
                        Iterator itr = deptList.iterator();%>
                    <select name="departmentId" class="form-select" id="departmentId">
                        <option value="0">Select a Department</option>
                        <%
                            while (itr.hasNext()) {
                                Department dept = (Department) itr.next();
                        %>
                        <option value=<%=dept.getDepartmentId()%> <%if(dept.getDepartmentName().equalsIgnoreCase(emp.getDepartmentName())){%> selected<% }%>> <%=dept.getDepartmentName() %>  </option>
                        <% }--%>
                    </select>
                </div>-->
                    
                   
                    <div class="form-floating">
                     <c:set var="deptList" value="${requestScope.DeptList}"/>
                    <select name="departmentId" class="form-select" id="departmentId">
                        <option value="0">Select a Department</option>
                        <c:forEach items="${deptList}" var="dept">
                            <option value="${dept.getDepartmentId()}"
                                    <c:if test="${dept.getDepartmentName() == emp.getDepartmentName()}">
                                        selected 
                                    </c:if>>
                                ${dept.getDepartmentName()} </option>
                            
                        </c:forEach>


                    </select>
                </div
                
                
                
                 <div class="form-floating">
                      <c:set var="roleList" value="${requestScope.RoleList}"/>
                    <select name="roleId" class="form-select" id="roleId">
                        <option value="0">Select a Role</option>
                        <c:forEach items="${roleList}" var="role">
                            <option value="${role.getRoleId()}"
                                    <c:if test="${role.getRoleName() == emp.getRoleName()}">
                                        selected 
                                    </c:if>>
                            ${role.getRoleName()} </option>
                        </c:forEach>
                    </select>
                </div>
                    
                    
<!--                    <div class="form-floating">
                    <%--ArrayList roleList = (ArrayList) request.getAttribute("RoleList");
                        Iterator itr1 = roleList.iterator();%>
                    <select name="roleId" class="form-select" id="roleId">
                        <option value="0">Select a Role</option>
                        <%
                            while (itr1.hasNext()) {
                                Role role = (Role) itr1.next();
                        %>
                        <option value=<%=role.getRoleId()%> <%if(role.getRoleName().equalsIgnoreCase(emp.getRoleName())){%> selected<% }%>> <%=role.getRoleName() %>  </option>
                        <% }--%>
                    </select>
                </div>-->


<!--                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="roleName" name="roleName" value=<%--=emp.getRoleName()--%>>
                    <label for="floatingInput">Role Name</label>
                </div>-->
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="basicSalary" name="basicSalary" value=${emp.getBasicSalary()}>
                    <label for="floatingInput">Basic Salary</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="carAllowance" name="carAllowance" value=${emp.getCarAllowance()}>
                    <label for="floatingInput">Car Allowance</label>
                </div>
<!--                    <input type="hidden" name="employeeId" value=<%--=emp.getEmployeeId()--%>>-->

                <button class="w-100 btn btn-lg btn-primary" type="submit">Save</button>

            </form>
        </main>
    </body>
</html>