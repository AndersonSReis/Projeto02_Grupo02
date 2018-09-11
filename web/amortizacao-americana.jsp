<%--
    Document   : amortizacaoamericana
    Created on : 09/09/2018, 17:05:48
    Author     : Ana Paula Otiai
--%>
<%@page import="java.text.NumberFormat"%>
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
                        
                         NumberFormat moeda = NumberFormat.getCurrencyInstance();
                            int n = Integer.parseInt(request.getParameter("n"));
                            double ve = Double.parseDouble(request.getParameter("ve"));
                            double i = (Double.parseDouble(request.getParameter("i"))) / 100;
                            double tj = 0;
                            double tp = 0;

                            if (n > 0 && ve > 0 && i > 0) {%>
                <div class="col-md-6">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th><center>Mês</center></th>
                                <th><center>Saldo Devedor</center></th>
                                <th><center>Amortização</center></th>
                                <th><center>Juros</center></th>
                                <th><center>Prestação</center></th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            <% for (int ct = 0; ct <= n; ct++) {%>

                            <tr>
                                <th>
                                    <%-- Meses--%>
                                    <%= ct %> 
                                </th>
                                <%-- Saldo devedor--%>
                                <td><% if (ct == n) {%>
                        <center><%="-"%> </center>
                            <%} else {%>
                        <center><%=moeda.format(ve)%></center>  
                            <%}%>
                        </td>
                        <td>
                            <%--Amortizacao--%>
                            <%if (ct == n) {%>
                        <center><%= moeda.format(ve)%> </center>  
                            <%} else {%>
                        <center><%="-"%></center>
                            <%}%>
                        </td>
                        <td>
                            <%--Juros--%>
                            <%if (ct == 0) {%>
                        <center>
                            <%="-"%>
                        </center>
                        <%} else {%>
                        <center>
                            <%tj = i * ve * n;%>
                            <%=moeda.format(i * ve)%>
                        </center>

                        <%}%>
                        </td>
                        <td>
                            <%--Prestacao--%>
                            <%if (ct == 0) {%>
                        <center> <%="-"%>    </center>

                        <% } else if (ct<n) {%>
                        <center>
                            <% tp = ve + tj;%>
                            <%= moeda.format(i * ve)%>
                        </center>
                            <%} else {%>
                        <center><%=moeda.format(ve+(i*ve))%></center>
                        <%}%>
                        </td>
                        </tr>
                        <%}%>
                        </body>
                        <tfoot>
                            <tr>
                                <th>Total</th>
                                <td></td>
                                <td><center><%=moeda.format(ve)%></center></td>
                                <td><center><%=moeda.format(tj)%></center></td>
                                <td><center><%=moeda.format(tp)%></center></td>
                                <td></td>
                            </tr>
                        </tfoot>
                    </table>
                    <%} else {%>
                    <h2></h2>
                    <%}
                    } catch (Exception e) {%>
                    <h2></h2>
                    <%}%>
                </div></div>
        </div>
        <%@include file="rodape.jsp" %>
    </body>
</html>