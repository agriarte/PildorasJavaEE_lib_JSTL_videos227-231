<%-- 
    video 231
    JSTL tags del grupo functions:
    split
    divide un string en un array de string. Se pone un caracter delimitador para los cortes
--%>

<%-- 
   importar las libs:
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Ejemplo JSTL functions tags</h1>
        
        <c:set var="datosPersona" value="Juan,Pelao,Argentina,Java,1500"></c:set>
        <c:set var="arrayPersona" value="${fn:split(datosPersona, ',')}"></c:set>
        
        <input type="text" value="${arrayPersona[0]}"><br>
        <input type="text" value="${arrayPersona[1]}"><br>
        <input type="text" value="${arrayPersona[2]}"><br>
        <input type="text" value="${arrayPersona[3]}"><br>
        <input type="text" value="${arrayPersona[4]}"><br>
    </body>
</html>
