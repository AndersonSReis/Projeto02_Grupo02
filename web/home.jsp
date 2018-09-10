<%--
    Document   : home
    Created on : 02/09/2018, 17:01:26
    Author     : MARIA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="cabecalho.jsp" %>
        <title>Home</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="container py-5">
            <div class="row">
                <div class="col-lg-8 col-md-6">
                    <h1 class="mb-4">Projeto 02 - Grupo 02</h1>
                    <p>Aplicação web para cálculo de sistemas de amortização constante, americana e tabela price.</p>
                </div>
                <div class="col-lg-4 col-md-6">
                    <ul class="list-group">
                        <li class="list-group-item active">Membros da Equipe </li>
                        <li class="list-group-item">Ana Paula Otiai</li>
                        <li class="list-group-item">Anderson Reis</li>
                        <li class="list-group-item">Paolla Gil Claudino</li>
                    </ul>
                </div>
            </div>
        </div>
        <%@include file="rodape.jsp" %>
    </body>
</html>
