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
                <div class="col-md-4">
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
                <div class="col-md-8">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>Mês</th>
                                <th class="text-center">Saldo Devedor</th>
                                <th class="text-center">Amortização</th>
                                <th class="text-center">Juros</th>
                                <th class="text-center">Prestação</th>
                            </tr>
                        </thead>
                        <tbody>

                            <% for (int ct = 0; ct <= n; ct++) {%>

                            <tr>
                                <th>
                                    <%-- Meses--%>
                                    <%= ct%>
                                </th>
                                <%-- Saldo devedor--%>
                                <td class="text-center"><% if (ct == n) {%>
                                    <%="-"%>
                                    <%} else {%>
                                    <%=moeda.format(ve)%>
                                    <%}%>
                                </td>
                                <td class="text-center">
                                    <%--Amortizacao--%>
                                    <%if (ct == n) {%>
                                    <%= moeda.format(ve)%>
                                    <%} else {%>
                                    <%="-"%>
                                    <%}%>
                                </td>
                                <td class="text-center">
                                    <%--Juros--%>
                                    <%if (ct == 0) {%>

                                    <%="-"%>

                                    <%} else {%>

                                    <%tj = i * ve * n;%>
                                    <%=moeda.format(i * ve)%>

                                    <%}%>
                                </td>
                                <td class="text-center">
                                    <%--Prestacao--%>
                                    <%if (ct == 0) {%>
                                    <%="-"%>

                                    <% } else if (ct < n) {%>

                                    <% tp = ve + tj;%>
                                    <%= moeda.format(i * ve)%>
                                    <%} else {%>
                                    <%=moeda.format(ve + (i * ve))%>
                                    <%}%>
                                </td>
                            </tr>
                            <%}%>
                            </body>
                        <tfoot>
                            <tr>
                                <th>TOTAL</th>
                                <td class="text-center">-</td>
                                <td class="text-center"><%=moeda.format(ve)%></td>
                                <td class="text-center"><%=moeda.format(tj)%></</td>
                                <td class="text-center"><%=moeda.format(tp)%></td>
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