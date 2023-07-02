<%@ page import="beans.Cheque" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 6/28/2023
  Time: 8:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="row mt-3">
        <div class="col-4">
            <h4>Cheque Balance Report</h4>
            <table class="table table-bordered">
                <tr>
                    <td>Cheque Id</td>
                    <td>Customer Name</td>
                    <td>Remaining Balance</td>
                </tr>
                <%
                    ServletContext context = pageContext.getServletContext();
                    ArrayList<Cheque> cheques = new ArrayList<>();

                    if (context.getAttribute("cheques") != null) {

                        cheques = (ArrayList<Cheque>) context.getAttribute("cheques");
                    }

                    for (Cheque allCheques : cheques) {
                %>
                <tr>
                    <td><%=allCheques.getId()%>
                    </td>
                    <td><%=allCheques.getName()%>
                    </td>
                    <td><%=allCheques.getTotal()%>
                    </td>
                </tr>
                <%
                    }

                %>

            </table>
            <a href="index.jsp" class="link-opacity-50-hover">Generate Reciept</a>

        </div>

    <div class="col-4">
        <div>
            <form action="addcheque" method="post">
                <h4>Create a Cheque</h4>
                <span class="form-label">Cheque Id:</span>
                <input class="form-control" type="text" name="id"/>
                <span class="form-label">Customer Name:</span>
                <input class="form-control" type="text" name="name"/>
                <span class="form-label">Total:</span>
                <input class="form-control" type="text" name="value"/>
                <input class="btn btn-primary" type="submit" value="Add Cheque"/>
            </form>
        </div>
    </div>
</div>
</div>
</body>
</html>
