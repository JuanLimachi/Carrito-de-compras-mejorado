<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Producto"%>
<%
    //  Verifica si exista la coleccion en el objeto session
    if(session.getAttribute("almacen") == null){
        //  Inicializar la lista auxiliar
        ArrayList<Producto> listaux = new ArrayList<Producto>();
        //  Creando un atributo con una coleccion vacia
        session.setAttribute("almacen", listaux);
    }
    //  Se obtiene la coleccion almacen que esta como atributo de session
    ArrayList<Producto> almacen = (ArrayList<Producto>)session.getAttribute("almacen");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>CARRITO DE COMPRAS MEJORADO</h1>
        <form action="MainServlet" method="post">
            <table>
                <tr>
                    <td>Id:</td>
                    <td><input type="text" name="id" value="0" size="2"></td>
                </tr>
                <tr>
                    <td>Producto:</td>
                    <td><input type="text" name="producto" value=""></td>
                </tr>
                <tr>
                    <td>Cantidad:</td>
                    <td><input type="text" name="cantidad" value="0"></td>
                </tr>
                <tr>
                    <td>Precio:</td>
                    <td><input type="text" name="precio" value="0"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Procesar"></td>
                </tr>
            </table>
        </form>
        <br>
        <a href="MainServlet?op=vaciar">Vaciar carrito</a>
        <h3>Contenido del carrito:</h3>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Producto</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th></th>
            </tr>
            <%
                if(almacen != null){
                    for(Producto pro : almacen){
            %>
            <tr>
                <td><%= pro.getId() %></td>
                <td><%= pro.getProducto() %></td>
                <td><%= pro.getCantidad() %></td>
                <td><%= pro.getPrecio() %></td>
                <td><a href="MainServlet?op=eliminar&id=<%= pro.getId() %>">ELIMINAR</a></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </body>
</html>
