/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cad;

import java.sql.Connection;
import java.sql.PreparedStatement;
import modelo.Factura;

/**
 *
 * @author mrm96
 */
public class FacturaCad {
    public static boolean insertarClientes( Factura factura){
        
        try{
            String sql= "{call sp_insertarFactura(?,?)}";
            Connection c = Conexion.conectar();
            PreparedStatement sentencia = c.prepareStatement(sql);
            sentencia.setString(1,factura.getNombre());
            sentencia.setDouble(2,factura.getTotal()); 
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
