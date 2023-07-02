<%@ page import="beans.Cheque" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-8 offset-2 mx-auto p-2">
            <div class="shadow-sm ">
                <div>

                    <h2>Customer Reciept</h2>
                    <span class="form-label">Invoice id:</span>
                    <input class="form-control" type="text" value="ID0324"/>
                    <span class="form-label">Customer Name:</span>
                    <input class="form-control" type="text" value="Kamal"/>
                    <span class="form-label">Date:</span>
                    <input class="form-control" type="date"/>
                    <span class="form-label">Total:</span>
                    <input class="form-control" value="5000"/>
                    <div class="d-grid mt-2">
                        <input class="btn btn-primary" type="submit" value="Save Invoice"/>
                    </div>


                </div>
                <div class="mt-3 bg-light">

                    <%
                        ServletContext context = pageContext.getServletContext();
                        Integer dueTotal = (Integer)context.getAttribute("dueTotal");
                        Integer paidTotal = (Integer)context.getAttribute("paidTotal");
                    %>
                    <h5>Add Payment</h5>
                    <form action="addanothercheque" method="post">

                        <span class="form-label">Total Amount: </span>
                        <input class="form-control" disabled type="text" name="value" value="5000"/>

                        <span class="form-label">Paying total: </span>
                        <input class="form-control" disabled name="paid" value="<%=paidTotal==null? 0 : paidTotal%>"/>

                        <span class="form-label">Due total: </span>
                        <input class="form-control" disabled name="due" value="<%=dueTotal==null?0: dueTotal%>"/>


                        <span class="form-label">Select a Cheque</span>
                        <select class="form-select" name="id" id="select" onchange="printTotal()">
                            <%

                                ArrayList<Cheque> cheques = new ArrayList<>();

                                if (context.getAttribute("cheques") != null) {

                                    cheques = (ArrayList<Cheque>) context.getAttribute("cheques");
                                }

                                for (Cheque allCheques : cheques) {
                            %>
                            <option><%=allCheques.getId()%>
                            </option>
                            <%
                                }

                            %>

                        </select>
                        <input class="btn btn-dark mt-2" type="submit" value="Add Another Cheque"/>
                    </form>



                </div>
            </div>
        </div>
    </div>

</div>
<div class="text-center">
    <a class="link-opacity-50-hover" href="viewBalances.jsp">Create new Cheque</a>
</div>
</body>
</html>
