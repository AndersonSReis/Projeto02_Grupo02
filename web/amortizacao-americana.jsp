<%-- 
    Document   : amortizacao-americana
    Created on : 05/09/2018, 22:37:23
    Author     : Ana Paula Otiai
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@include file="WEB-INF/jspf/menu.jspf"%>
        <h1><center><u>Sistema Americano de Amortização</center></u></h1>
        <h3><center>O Sistema Americano de Amortização é um tipo de quitação de empréstimo que favorece aqueles que desejam pagar o valor principal através de uma única parcela, porém os juros devem ser pagos periodicamente ou, dependendo do contrato firmado entre as partes, os juros são capitalizados e pagos junto ao valor principal.</center></h3>
        <form>
            Valor do Emprestimo:<input type="text" name="ve"/>
            Taxa de Juros:<input type="text" name="i"/>
            Tempo de Aplicação:<input type="text" name="n"/>
            <input type="submit" name="j" name="tj name=tp" value="Calcular"/>
           
        </form>
            
    </body>
</html>
