/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vista;

import cad.ProductoCad;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Item;
import modelo.Producto;

/**
 *
 * @author mrm96
 */
public class Carrito extends HttpServlet {

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
        sesion.setAttribute("pagina", "Carrito");
        request.getRequestDispatcher("WEB-INF/carrito.jsp").forward(request, response);
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
        if(request.getParameter("ordenar") != null){
            int id_producto = Integer.parseInt(request.getParameter("producto"));
            if(request.getParameter("tamano") != null){
                int id_tamano = Integer.parseInt(request.getParameter("tamano"));
                Producto p;
                HttpSession sesion = request.getSession();
                if(sesion.getAttribute("carrito") == null){
                    ArrayList<Item> carrito = new ArrayList<>();
                    p = ProductoCad.consultarProductoConTamano(id_producto, id_tamano);
                    carrito.add(new Item(p, 1));
                    sesion.setAttribute("carrito", carrito);
                }
                else{
                    ArrayList<Item> carrito = (ArrayList<Item>)sesion.getAttribute("carrito");
                    p = ProductoCad.consultarProductoConTamano(id_producto, id_tamano);
                    carrito.add(new Item(p, 1));
                    sesion.setAttribute("carrito", carrito);
                }
            }
        }
        processRequest(request, response);
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
