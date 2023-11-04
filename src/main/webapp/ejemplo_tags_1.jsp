<%-- 
    Document   : ejemplos_tags_1
    Created on : 30-oct-2023, 18:30:37
    Author     : Pedro
--%>

<!<!-- Tutorial de JSTL:
  http://www.w3big.com/es/jsp/jsp-jstl.html#gsc.tab=0 (es como 3wschool en español)
  https://www.javatpoint.com/jstl -->

<!-- añadir manualmente el siguiente taglib para usar jstl y la dependencia Maven en pom.xml,
puede estar obsoleto, tuve que buscar otras versiones no tan actuales en Stackoverflow
-->

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- como ejemplo, dentro del scriptlet se crea un array para recorrerlo con 
        un bucle foreach de jstl-->
<%
    String empleados[] = {"Pedro", "Manuel", "Juan"};

    pageContext.setAttribute("misEmpleados", empleados);


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

        Mostrar String por el método de antes
        <%            for (String iteradorEmpleados : empleados) {
                out.println(iteradorEmpleados + "<br>");
            }
        %>
    </body>

    <c:forEach var="TempEmpleados" items="${misEmpleados}">
        ${TempEmpleados}<br>
    </c:forEach>
</html>
