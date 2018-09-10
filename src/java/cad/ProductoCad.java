/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cad;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Producto;

/**
 *
 * @author mrm96
 */
public class ProductoCad {
    public static ArrayList<Producto> listarProductos(String categoriaS){
        try {
            int categoria = Integer.parseInt(categoriaS);
            String sql="{call sp_listarProductosPorCategoria(?)}";
            Connection c = Conexion.conectar();
            CallableStatement sentencia = (CallableStatement) c.prepareCall(sql);
            sentencia.setInt(1, categoria);
            ResultSet resultado = sentencia.executeQuery();
            ArrayList<Producto> lista = new ArrayList<>();
            while(resultado.next()){
                Producto prod = new Producto();
                prod.setId_producto(resultado.getInt("id_producto"));
                prod.setNombre(resultado.getString("nombre"));
                prod.setCategoria(resultado.getInt("categoria"));
                prod.setPrecio(resultado.getInt("precio"));
                prod.setImagen(resultado.getString("imagen"));
                prod.setDescripcion(resultado.getString("descripcion"));
                lista.add(prod);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public static boolean tieneTamanos(int producto){
        try {
            String sql="{call sp_contarTamanosPorProducto(?)}";
            Connection c = Conexion.conectar();
            CallableStatement sentencia = (CallableStatement) c.prepareCall(sql);
            sentencia.setInt(1, producto);
            ResultSet resultado = sentencia.executeQuery();
            resultado.next();
            return resultado.getInt("cantidad")>0;
        } catch (SQLException ex) {
            return false;
        }
    }
    
    public static Producto consultarProductoConTamano (int producto, int tamano){
        try {
            String sql="{call sp_consultarProductoConTamano(?,?)}";
            Connection c = Conexion.conectar();
            CallableStatement sentencia = (CallableStatement) c.prepareCall(sql);
            sentencia.setInt(1, producto);
            sentencia.setInt(2, tamano);
            ResultSet resultado = sentencia.executeQuery();
            Producto prod=null;
            if(resultado.next()){
                prod = new Producto();
                prod.setId_producto(resultado.getInt("id_producto"));
                prod.setNombre(resultado.getString("nombre")+" "+resultado.getString("nombre_tamano"));
                prod.setCategoria(resultado.getInt("categoria"));
                prod.setPrecio(resultado.getInt("precio"));
                prod.setImagen(resultado.getString("imagen"));
                prod.setDescripcion(resultado.getString("descripcion"));
            }
            return prod;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public static Producto consultarProductoSinTamano (int producto){
        try {
            String sql="{call sp_consultarProductoSinTamano(?)}";
            Connection c = Conexion.conectar();
            CallableStatement sentencia = (CallableStatement) c.prepareCall(sql);
            sentencia.setInt(1, producto);
            ResultSet resultado = sentencia.executeQuery();
            Producto prod=null;
            if(resultado.next()){
                prod = new Producto();
                prod.setId_producto(resultado.getInt("id_producto"));
                prod.setNombre(resultado.getString("nombre"));
                prod.setCategoria(resultado.getInt("categoria"));
                prod.setPrecio(resultado.getInt("precio"));
                prod.setImagen(resultado.getString("imagen"));
                prod.setDescripcion(resultado.getString("descripcion"));
            }
            return prod;
        } catch (SQLException ex) {
            return null;
        }
    }
}
