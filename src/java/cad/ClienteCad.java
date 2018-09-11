/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cad;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import modelo.Clientes;

/**
 *
 * @author barrot
 */
public class ClienteCad {
    
    public static boolean insertarClientes( Clientes cliente){
        
        try{
            String sql= "INSERT INTO tbl_cliente(nombre,apellido,telefono,correo,direccion,contrasena,numero_tarjeta,codigo_seguridad,fecha_vencimiento) VALUES(?,?,?,?,?,?,?,?,?);";
            Connection c = Conexion.conectar();
            PreparedStatement sentencia = c.prepareStatement(sql);
            sentencia.setString(1,cliente.getNombre());
            sentencia.setString(2,cliente.getApellido());
            sentencia.setInt(3,cliente.getTelefono());
            sentencia.setString(4,cliente.getCorreo());
            sentencia.setString(5,cliente.getDireccion());
            sentencia.setString(6,cliente.getContrasena());
            sentencia.setString(7,cliente.getNumero_tarjeta());
            sentencia.setInt(8,cliente.getCodigo_seguridad());
            sentencia.setString(9,cliente.getFecha_vencimiento());  
            
            sentencia.execute();   
            c.close();
        }
        catch(Exception ex){
            System.err.println(ex.getMessage());
            return false;
        }
        return true;
    }
    
}
