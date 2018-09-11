/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import cad.FacturaCad;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Factura;
import modelo.Item;

/**
 *
 * @author mrm96
 */
public class FacturaControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion = request.getSession();
        sesion.setAttribute("pagina", "Inicio");
        request.getRequestDispatcher("Inicio").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        if(request.getParameter("pagar") != null && sesion.getAttribute("carrito") != null){
            ArrayList<Item> carrito = (ArrayList<Item>)sesion.getAttribute("carrito");
            String nombre = request.getParameter("nombre");
            double subTotal = 0;
            double impuestos = 0;
            double total = 0;
            sesion.setAttribute("pagina", "Checkout");
            for (int i = 0; i < carrito.size(); i++) {
                subTotal = subTotal + carrito.get(i).getProducto().getPrecio() * carrito.get(i).getCantidad();
            }
            impuestos = subTotal*0.13;
            total = subTotal + impuestos;
            Factura factura = new Factura();
            factura.setNombre(nombre);
            factura.setTotal(total);
            if(FacturaCad.insertarClientes(factura)){
                carrito.clear();
                sesion.setAttribute("carrito", carrito);
            }
        }
        response.sendRedirect("Inicio");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
