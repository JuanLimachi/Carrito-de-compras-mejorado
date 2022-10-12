package com.emergentes;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
        
        if(op.equals("vaciar")){
            //  Vaciar el carrito
            HttpSession ses = request.getSession();
            ses.invalidate();
            response.sendRedirect("index.jsp");
        }
        if(op.equals("eliminar")){
            int pos = -1;
            int buscado = 0;
            int id = Integer.parseInt(request.getParameter("id"));
            //  Eliminar el producto
            HttpSession ses = request.getSession();
            ArrayList<Producto> lista = (ArrayList<Producto>)ses.getAttribute("almacen");
            
            for(Producto pro : lista){
                pos++;
                if(pro.getId() == id){
                    buscado = pos;
                }
            }
            lista.remove(buscado);
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String producto = request.getParameter("producto");
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        double precio = Double.parseDouble(request.getParameter("precio"));
        
        Producto pro  = new Producto();
        
        pro.setId(id);
        pro.setProducto(producto);
        pro.setCantidad(cantidad);
        pro.setPrecio(precio);

        //  Se obtiene el acceso a la session
        HttpSession ses = request.getSession();
        //  Se obtiene la lista que esta como atributo de session
        ArrayList<Producto> lista = (ArrayList<Producto>)ses.getAttribute("almacen");
        //  A la coleccion se adiciona el elemento "producto"
        lista.add(pro);
        //  Se redirecciona a index.jsp
        response.sendRedirect("index.jsp");
    }
}
