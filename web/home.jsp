
<jsp:include page="menu.jsp"></jsp:include>
<%@page import="com.exavalu.entities.Employee"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<%--if (request.getSession().getAttribute("User") == null)
        request.getRequestDispatcher("login.jsp").forward(request, response);
--%>

<!--JSTL TAG FOR ABOVE SCRIPLET-->
<c:if test="${empty sessionScope.User}">
    <jsp:forward page="login.jsp"></jsp:forward>
</c:if>

<!doctype html>
<html lang="en">
    <head>        
        <title>Employee Management Web Application</title>
        <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/product/">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/menu_css.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/product.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css"/><link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css"/><style>
                        #example_wrapper{
                width: 90%;
                display: block;
                margin: auto;
            }
        </style>
    </head>

    <body>



        <%--<jsp:include page="menu.jsp"></jsp:include>--%>

        <menu>
                
            <c:if test="${not empty requestScope.SuccessMsg}">
            <div class="alert alert-success" role="alert">
                ${requestScope.SuccessMsg}
            </div>
        </c:if>
            
            <%--
                ArrayList empList = (ArrayList) request.getAttribute("EmpList");
                Iterator itr = empList.iterator();
           --%>
           
           <c:set var="empList" value="${requestScope.EmpList}"/>
           
           
            <table class="table table-bordered table-hover"id="example">
                <thead>
                    <tr>
                        <th>
                            Employee Id
                        </th>
                        <th>
                            First Name
                        </th>
                        <th>
                            Last Name
                        </th>
                        <th>
                            Address
                        </th>
                        <th>
                            Phone
                        </th>
                        <th>
                            Gender
                        </th>
                        <th>
                            Age
                        </th>
                        <th>
                            Department
                        </th>
                        <th>
                            Role
                        </th>
                        <th>
                            Basic Salary
                        </th>
                        <th>
                            Car Allowance
                        </th>
                        <th>
                            Action
                        </th>

                    </tr>
                </thead>




                <tbody>
                    <%--
                        while (itr.hasNext()) {
                            Employee emp = (Employee) itr.next();
                    --%>

<!--                    <tr>

                        <td>
                            <%--=emp.getEmployeeId()--%>
                        </td>
                        <td>
                            <%--=emp.getFirstName()--%>
                        </td>
                        <td>
                            <%--=emp.getLastName()--%>
                        </td>
                        <td>
                            <%--=emp.getAddress()--%>
                        </td>
                        <td>
                            <%--=emp.getPhone()--%>
                        </td>
                        <td>
                            <%--=emp.getGender()--%>
                        </td>
                        <td>
                            <%--=emp.getAge()--%>
                        </td>
                        <td>
                            <%--=emp.getDepartmentName()--%>
                        </td>
                        <td>
                            <%--=emp.getRoleName()--%>
                        </td>
                        <td>
                            <%--=emp.getBasicSalary()--%>
                        </td>
                        <td>
                            <%--=emp.getCarAllowance()--%>
                        </td>
                        <td> 

                            <a href=EditEmployee?employeeId=<%--=emp.getEmployeeId()--%>>
                                Edit
                            </a>
                        </td>
                    </tr>-->

                    <%--
                        }
                    --%>
                    
                    
                    <c:forEach items="${empList}" var="emp">
                <tr>
                    <td>
                        ${emp.getEmployeeId()}
                    </td>
                    <td> 
                        ${emp.getFirstName()}
                        
                    </td>
                    <td>
                        ${emp.getLastName()}
                    </td>
                    <td>
                        ${emp.getAddress()}
                    </td>
                    <td>
                        ${emp.getPhone()}
                    </td>
                    <td>
                       ${emp.getGender()}
                    </td>
                    <td>
                        ${emp.getAge()}
                    </td>
                    <td>
                        ${emp.getDepartmentName()}
                    </td>
                    <td>
                        ${emp.getRoleName()}
                    </td>
                    <td>
                        ${emp.getBasicSalary()}
                    </td>
                    
                    <td>
                       ${emp.getCarAllowance()}
                    </td>
                    <td> 
                        <a href=EditEmployee?employeeId=${emp.getEmployeeId()}>
                            Edit</a>                     
                    </td>
                </tr>
               </c:forEach>


                </tbody>
            </table>
        </menu>






        <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>


        <script src="https://code.jquery.com/jquery-3.5.1.js"></script><script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script><script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script><script>
                        $(document).ready(function () {
                                $('#example').DataTable();
                        });</script>
    </body>

</html>
