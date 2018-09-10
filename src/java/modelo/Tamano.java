/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;

/**
 *
 * @author mrm96
 */
public class Tamano implements Serializable{
    private int id_tamano;
    private String nombre;
    private int precio;
    private int producto;

    public Tamano() {
    }

    public Tamano(int id_tamano, String nombre, int precio, int producto) {
        this.id_tamano = id_tamano;
        this.nombre = nombre;
        this.precio = precio;
        this.producto = producto;
    }

    public int getId_tamano() {
        return id_tamano;
    }

    public void setId_tamano(int id_tamano) {
        this.id_tamano = id_tamano;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getProducto() {
        return producto;
    }

    public void setProducto(int producto) {
        this.producto = producto;
    }
    
    
}
