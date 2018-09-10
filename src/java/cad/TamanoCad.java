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
import modelo.Tamano;

/**
 *
 * @author mrm96
 */
public class TamanoCad {
    public static ArrayList<Tamano> listarTamanosPorProductos(int producto){
        try {
            String sql="{call sp_listarTamanosPorProducto(?)}";
            Connection c = Conexion.conectar();
            CallableStatement sentencia = (CallableStatement) c.prepareCall(sql);
            sentencia.setInt(1, producto);
            ResultSet resultado = sentencia.executeQuery();
            ArrayList<Tamano> lista = new ArrayList<>();
            while(resultado.next()){
                Tamano tam = new Tamano();
                tam.setId_tamano(resultado.getInt("id_tamano"));
                tam.setNombre(resultado.getString("nombre"));
                tam.setPrecio(resultado.getInt("precio"));
                tam.setProducto(resultado.getInt("producto"));
                lista.add(tam);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        }
    }
}
