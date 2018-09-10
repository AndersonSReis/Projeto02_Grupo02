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
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="menu.jsp"%>
        <h1><center><u>Sistema Americano de Amortização</center></u></h1>
    <h3><center>O Sistema Americano de Amortização é um tipo de quitação de empréstimo que favorece aqueles que desejam pagar o valor principal através de uma única parcela, porém os juros devem ser pagos periodicamente ou, dependendo do contrato firmado entre as partes, os juros são capitalizados e pagos junto ao valor principal.</center></h3>
    <br>
    <form>
        <center>
            Valor do Emprestimo:<input type="text" name="ve"/>
            Taxa de Juros:<input type="text" name="i"/>
            Tempo de Aplicação:<input type="text" name="n"/>
            <input type="submit" nome="Calculo" value="Calcular"/>
        </center>
    </form>
    <%try {
            int n = Integer.parseInt(request.getParameter("n"));
            double ve = Double.parseDouble(request.getParameter("ve"));
            double i = (Double.parseDouble(request.getParameter("i"))) / 100;
            double j = 0, vp = 0;
            double tj = 0;
            double tp = 0;

            if (n > 0 && ve > 0 && i > 0) {%>
    <br></br>
    <table border="1">
        <tr>
            <th>Mês</th>
            <th>Saldo Devedor</th>
            <th>Amortização</th>
            <th>Juros</th>
            <th>Prestação</th>
        </tr>
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
<tr>
    <th>Total</th>
    <td></td>
    <td><%=ve%></td>
    <td><%=tj%></td>
    <td><%=vp%></td>
    <td></td>
</tr>
</table>
<%} else {%>
<h3>Favor colocar valores válidos.</h3>
<%}
} catch (Exception e) {%>
<h3>Favor colocar valores válidos.</h3>
<%}%>
<%@include file="rodape.jsp" %>
</body>
</html>



