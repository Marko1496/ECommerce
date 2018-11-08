/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import cad.ClienteCad;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Clientes;

/**
 *
 * @author mrm96
 */

@WebServlet("/cliente")
public class Cliente extends HttpServlet {

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
        sesion.setAttribute("pagina", "Cliente");
        request.getRequestDispatcher("WEB-INF/cliente.jsp").forward(request, response);
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
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String tel = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String direccion = request.getParameter("direccion");
        String num_tarjeta = request.getParameter("num_tarjeta");
        String fecha_vencimiento = request.getParameter("fecha_vencimiento");
        String cod_seg = request.getParameter("codigo_seguridad");
        String contrasena = request.getParameter("contrasena");
        
        int telefono = Integer.parseInt(tel);
        
        int codigo_seguridad = Integer.parseInt(cod_seg);
        
        Clientes cliente = new Clientes();
        
        cliente.setNombre(nombre);
        cliente.setApellido(apellido);
        cliente.setTelefono(telefono);
        cliente.setCorreo(correo);
        cliente.setDireccion(direccion);
        cliente.setNumero_tarjeta(num_tarjeta);
        cliente.setFecha_vencimiento(fecha_vencimiento);
        cliente.setCodigo_seguridad(codigo_seguridad);
        cliente.setContrasena(contrasena);
        
        ClienteCad cc = new ClienteCad();
        
        if(cc.insertarClientes(cliente)){
            request.getRequestDispatcher("WEB-INF/cliente.jsp").forward(request, response);
        }
        
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
