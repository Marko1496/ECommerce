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
        
        if(request.getParameter("accion") != null){
            String a = request.getParameter("accion");
            int id_producto = Integer.parseInt(request.getParameter("id_producto"));
            int id_tamano = Integer.parseInt(request.getParameter("id_tamano"));
            if(a.equals("borrar") && sesion.getAttribute("carrito") != null){
                ArrayList<Item> carrito = (ArrayList<Item>)sesion.getAttribute("carrito");
                int indice=yaExisteProducto(id_producto, id_tamano, carrito);
                carrito.remove(indice);
                sesion.setAttribute("carrito", carrito);
            }
        }
        request.getRequestDispatcher("WEB-INF/carrito.jsp").forward(request, response);
    }
    
    private int yaExisteProducto(int id_producto, int id_tamano, ArrayList<Item> carrito){
        for (int i = 0; i < carrito.size(); i++) {
            if(carrito.get(i).getProducto().getId_producto() == id_producto && carrito.get(i).getTamano() == id_tamano){
                return i;
            }
        }
        return -1;
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
        if(request.getParameter("ordenar") != null){            
            int id_producto = Integer.parseInt(request.getParameter("producto"));
            if(request.getParameter("tamano") != null){
                int id_tamano = Integer.parseInt(request.getParameter("tamano"));
                Producto p;
                if(sesion.getAttribute("carrito") == null){
                    ArrayList<Item> carrito = new ArrayList<>();
                    p = ProductoCad.consultarProductoConTamano(id_producto, id_tamano);
                    carrito.add(new Item(p, id_tamano, 1));
                    sesion.setAttribute("carrito", carrito);
                }
                else{
                    ArrayList<Item> carrito = (ArrayList<Item>)sesion.getAttribute("carrito");
                    p = ProductoCad.consultarProductoConTamano(id_producto, id_tamano);
                    int indice=yaExisteProducto(id_producto, id_tamano, carrito);
                    if(indice == -1){
                        carrito.add(new Item(p, id_tamano, 1));
                        sesion.setAttribute("carrito", carrito);
                    } else{
                        int cantidad = carrito.get(indice).getCantidad()+1;
                        carrito.get(indice).setCantidad(cantidad);
                    }
                    
                }
            }
            else{
                Producto p;
                if(sesion.getAttribute("carrito") == null){
                    ArrayList<Item> carrito = new ArrayList<>();
                    p = ProductoCad.consultarProductoSinTamano(id_producto);
                    carrito.add(new Item(p, 0, 1));
                    sesion.setAttribute("carrito", carrito);
                }
                else{
                    ArrayList<Item> carrito = (ArrayList<Item>)sesion.getAttribute("carrito");
                    p = ProductoCad.consultarProductoSinTamano(id_producto);
                    int indice=yaExisteProducto(id_producto, 0, carrito);
                    if(indice == -1){
                        carrito.add(new Item(p, 0, 1));
                        sesion.setAttribute("carrito", carrito);
                    } else{
                        int cantidad = carrito.get(indice).getCantidad()+1;
                        carrito.get(indice).setCantidad(cantidad);
                    }
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
