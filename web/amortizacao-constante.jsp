<%-- 
    Document   : amortizacao-constante
    Created on : 06/09/2018, 21:10:31
    Author     : agencia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form>
            <h3>Emprestimo:</h3><input type="number" name="emprestimo">
            <h3>Taxa de juros</h3><input type="number" name="taxaJuros">
            <h3>Numero de Meses:</h3><input type="number" name="numeroMeses">
            <h3>Periodo:</h3><input type="text" name="periodo">
            <input type="submit" name="submit" value="Enviar">          
            
        </form>
        
        <%
             double emprestim =1.0;
             double taxa=0.01;
             int meses=1;
             String period;
             double amortizacao;
            if(request.getParameter("emprestimo")!= null){
                if(request.getParameter("taxaJuros")!= null){
                    if(request.getParameter("numeroMeses")!= null){
                        if(request.getParameter("periodo")!= null){
                             emprestim= Double.parseDouble(request.getParameter("emprestimo"));
                             taxa= Double.parseDouble(request.getParameter("taxaJuros"));
                             meses= Integer.parseInt(request.getParameter("numeroMeses"));
                             period=request.getParameter("periodo");
                             
                                 if(period=="mensal"){
                                amortizacao = emprestim/meses;
                                for(int i=1;i<=meses;i++){ 
      
                                    
                                %> <%= i %>
                                <h3>° Parcela =</h3> <%= amortizacao+(taxa/100)*emprestim %>
                                <%
                                }
                             
                                }
                
                        }
                    }
                }
            }
        %>
        <h1><u><%= emprestim %></u></h1>
    </body>
</html>
