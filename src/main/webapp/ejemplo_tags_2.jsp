<%-- 
    videos 229 y 230
    JSTL tags:
    foreach
    if
    choose, when, otherwise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- añadir manualmente el siguiente taglib para usar jstl y la dependencia Maven en pom.xml.
Puede estar obsoleto, tuve que buscar otras versiones no tan actuales en Stackoverflow -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!<!-- importación de paquetes, java.util, java.sql, mi propio paquete con clase Usuario -->
<%@page import="java.util.*, java.sql.*, pildoras.tags_videos228_231.*" %>



<%

    ArrayList<Usuario> datosUsuario = new ArrayList<>();

    //Para carga dinámica, para evitar problemas de que el jar no encuentre el driver y errores varios en lib 
    Class.forName("com.mysql.cj.jdbc.Driver");

    try {
        Connection miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionpedidos", "root", "");
        Statement miSt = miConexion.createStatement();
        String sentenciaSQL = "SELECT * FROM USUARIOS";
        ResultSet miRs = miSt.executeQuery(sentenciaSQL);

        while (miRs.next()) {
            // a cada vuelta de bucle se añade un objeto Usuario al ArrayList con los atributos 
            //escogidos en el constructor de la clase Usuario
            datosUsuario.add(new Usuario(miRs.getString(2), miRs.getString(3), miRs.getString(4), miRs.getString(6), miRs.getDouble(8)));

        }

        miRs.close();
        miConexion.close();
    } catch (Exception e) {
        out.println("error: " + e);
    }

    //almacenar la información de "datosUsuario" en la sesión del usuario.
    //No es una sesión propiamente dicha, es un atributo o variable temporal llamada "losUsuarios" en el contexto de 
    //la página actual, que estará disponible para esa página mientras se procesa la solicitud, pero no se almacena en la sesión del usuario.
    pageContext.setAttribute("losUsuarios", datosUsuario);

%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Muestra usuarios</h1>
        <p>Ejemplo de mostrar BBDD usando tags jsp</p>

        <!<!-- mostrar en tabla la bbdd -->
        <table>
            <tr>
                <th><strong>Nombre</strong></th>
                <th><strong>Apellido</strong></th>
                <th><strong>Usuario</strong></th>
                <th><strong>País</strong></th>
                <th><strong>Localización</strong></th>
                <th><strong>Salario</strong></th>
                <th><strong>Categoría salario</strong></th>
            </tr>
            <!-- con los tags se evita mezclar código Java con HTML. De fondo, se está ejecutando el bucle "for" de Java pero
             llamado en la forma HTML. Teoricamente, da claridad al código.-->
            <c:forEach var="iterador" items="${losUsuarios}">
                <tr>
                    <td>${iterador.nombre}</td>
                    <td>${iterador.apellido}</td>
                    <td>${iterador.usuario}</td>
                    <td>${iterador.pais}</td>

                    <td>
                        <c:if test="${iterador.pais=='España'}" >Nacional</c:if>
                        <c:if test="${iterador.pais!='España'}" >Internacional</c:if>
                        <%--  es mas correcto usar equals para comparar cadenas:
                            ${iterador.pais.equals('España') y 
                            ${!iterador.pais.equals('España')  --%>
                    </td>
                    <td>${iterador.salario}</td>

                    <!<!--En java: choose equivale a switch, when a case, otherwise a defailt -->
                    <td><c:choose>
                            <c:when test="${iterador.salario>2000}">Salario Alto</c:when>
                            <c:when test="${iterador.salario>1500}">Salario medio</c:when>
                            <c:when test="${iterador.salario>1200}">Salario bajo</c:when>
                            <c:otherwise>Salario muy bajo</c:otherwise>
                        </c:choose></td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
