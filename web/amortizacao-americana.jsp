<%--
    Document   : amortizacaoamericana
    Created on : 09/09/2018, 17:05:48
    Author     : Ana Paula Otiai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="cabecalho.jsp" %>
        <title>Amortização Americana</title>
    </head>
    <body>
        <%@include file="menu.jsp"%>
        <div class="container py-5">
            <div class="row">
                <div class="col-md-6">
                    <h1>Sistema Americano de Amortização</h1>
                    <p>O Sistema Americano de Amortização é um tipo de quitação de empréstimo que favorece aqueles que desejam pagar o valor principal através de uma única parcela, porém os juros devem ser pagos periodicamente ou, dependendo do contrato firmado entre as partes, os juros são capitalizados e pagos junto ao valor principal.</p>
                    <form>
                        <div class="form-group">
                            <label>Valor do Emprestimo: </label>
                            <input type="text" name="ve" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Taxa de Juros (%): </label>
                            <input type="text" name="i" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Tempo de Aplicação (Meses): </label>
                            <input type="text" name="n" class="form-control">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-lg btn-block btn-primary" nome="Calculo">Calcular</button>
                        </div>
                    </form></div>
                    <%try {
                            int n = Integer.parseInt(request.getParameter("n"));
                            double ve = Double.parseDouble(request.getParameter("ve"));
                            double i = (Double.parseDouble(request.getParameter("i"))) / 100;
                            double j = 0, vp = 0;
                            double tj = 0;
                            double tp = 0;

                            if (n > 0 && ve > 0 && i > 0) {%>
                <div class="col-md-6">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>Mês</th>
                                <th>Saldo Devedor</th>
                                <th>Amortização</th>
                                <th>Juros</th>
                                <th>Prestação</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int ct = 0; ct <= n; ct++) {%>

                            <%

                            %>

                            <tr>
                                <th>
                                    <%= ct%> <%-- Meses--%>
                                </th>
                                <td><% if (ct == n) {%>
                        <center><%="-"%> </center>
                            <%} else {%>
                        <center><%= ve%></center>  <%-- Saldo devedor--%>
                            <%}%>
                        </td>
                        <td>
                            <%if (ct == n) {%>
                        <center><%= ve%> </center>  <%--Amortizacao--%>
                            <%} else {%>
                        <center><%="-"%></center>
                            <%}%>
                        </td>
                        <td>
                            <%if (ct == 0) {%>
                        <center>
                            <%="-"%>
                        </center>
                        <%} else {%>
                        <center>
                            <% j = i * n * ve;%>
                            <% j = (i / 100) * ve; %>
                            <%tj = i * ve * n;%>
                            <%= i * ve%> <%--Juros--%>
                        </center>

                        <%}%>
                        </td>
                        <td>
                            <%if (ct == 0) {%>
                        <center> <%="-"%>    </center>

                        <% } else {%>
                        <center>
                            <% vp = (i * n * ve) + tj; %>
                            <% vp = ve + tj;%>
                            <%= (i * ve)%><%--Prestacao--%>
                        </center>

                        <%}%>
                        </td>
                        </tr>
                        <%}%>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Total</th>
                                <td></td>
                                <td><%=ve%></td>
                                <td><%=tj%></td>
                                <td><%=vp%></td>
                                <td></td>
                            </tr>
                        </tfoot>
                    </table>
                    <%} else {%>
                    <h3>Favor colocar valores válidos.</h3>
                    <%}
                    } catch (Exception e) {%>
                    <h3>Favor colocar valores válidos.</h3>
                    <%}%>
                </div></div>
        </div>
        <%@include file="rodape.jsp" %>
    </body>
</html>