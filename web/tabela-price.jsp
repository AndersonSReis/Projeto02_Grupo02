<%--
    Document   : tabela-price
    Created on : 09/09/2018, 17:47:32
    Author     : Gil
--%>

<%@page import="java.text.NumberFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="cabecalho.jsp" %>
        <title>Tabela Price</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="container py-5">
            <div class="row">
                <div class="col-md-12 col-lg-4">
                    <h1>Tabela Price</h1>
                    <form action="tabela-price.jsp">
                        <div class="form-group">
                            <label>Valor do empréstimo: </label>
                            <input class="form-control" type="number" name="emprestimo" required>
                        </div>
                        <div class="form-group">
                            <label>Taxa de juros (%): </label>
                            <input class="form-control" type="number" step="0.01" name="taxa" required>
                        </div>
                        <div class="form-group">
                            <label>Tempo (Meses): </label>
                            <input class="form-control" type="number" name="tempo" required>
                        </div>
                        <input class="btn btn-lg btn-block btn-primary" type="submit" value="Enviar">
                    </form>
                </div>
                <%
                    NumberFormat moeda = NumberFormat.getCurrencyInstance();
                    if (request.getParameter("emprestimo") != null) {
                        double emprestimo = Double.parseDouble(request.getParameter("emprestimo"));
                        double taxa = Double.parseDouble(request.getParameter("taxa"));
                        int tempo = Integer.parseInt(request.getParameter("tempo"));
                        taxa = taxa / 100;
                        double aux = 1 + taxa;
                        double aux2 = Math.pow(aux, tempo);
                        double dividendo = aux2 * taxa;
                        double divisor = aux2 - 1;
                        double pmt = 0;
                        double juros = 0;
                        double amortizacao = 0;
                        double saldo = 0;
                        double totalj = 0;
                        double totalamor = 0;
                %>
                <div class="col-md-12 col-lg-8">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>Mês</th>
                                <th class="text-center">Prestação</th>
                                <th class="text-center">Juros</th>
                                <th class="text-center">Amortização</th>
                                <th class="text-center">Saldo Devedor</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%            for (int i = 0; i <= tempo; i++) {
                                    if (i == 0) {
                                        saldo = emprestimo;
                            %>
                            <tr>
                                <td><%=i%></td>
                                <td class="text-center">-</td>
                                <td class="text-center">-</td>
                                <td class="text-center">-</td>
                                <td class="text-center"><%=moeda.format(saldo)%></td>
                            </tr>
                            <%
                            } else if (i == tempo) {
                                pmt = emprestimo * (dividendo / divisor);
                                juros = saldo * taxa;
                                amortizacao = pmt - juros;
                                saldo = saldo - amortizacao;
                                totalj = totalj + juros;
                                totalamor = totalamor + amortizacao;
                            %>
                            <tr>
                                <td><%=i%></td>
                                <td class="text-center"><%=moeda.format(pmt)%></td>
                                <td class="text-center"><%=moeda.format(juros)%></td>
                                <td class="text-center"><%=moeda.format(amortizacao)%></td>
                                <td class="text-center">-</td>
                            </tr>
                            <%} else {
                                pmt = emprestimo * (dividendo / divisor);
                                juros = saldo * taxa;
                                amortizacao = pmt - juros;
                                saldo = saldo - amortizacao;
                                totalj = totalj + juros;
                                totalamor = totalamor + amortizacao;
                            %>
                            <tr>
                                <td><%=i%></td>
                                <td class="text-center"><%=moeda.format(pmt)%></td>
                                <td class="text-center"><%=moeda.format(juros)%></td>
                                <td class="text-center"><%=moeda.format(amortizacao)%></td>
                                <td class="text-center"><%=moeda.format(saldo)%></td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>TOTAL</th>
                                <td class="text-center"><%=moeda.format(pmt * tempo)%></td>
                                <td class="text-center"><%=moeda.format(totalj)%></td>
                                <td class="text-center"><%=moeda.format(totalamor)%></td>
                                <td class="text-center">-</td>
                            </tr>
                        </tfoot>

                    </table>
                </div>
                <%            }
                %>
            </div>
        </div>
        <%@include file="rodape.jsp" %>
    </body>
</html>
