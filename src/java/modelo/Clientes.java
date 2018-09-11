/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;

/**
 *
 * @author barrot
 */
public class Clientes implements Serializable {
    
    private int id_cliente;
    private String nombre;
    private String apellido;
    private int telefono;
    private String correo;
    private String direccion;
    private String contrasena;
    private String numero_tarjeta;
    private int codigo_seguridad;
    private String fecha_vencimiento;
    
    
    public Clientes(){
    }

    public Clientes(int id_cliente, String nombre, String apellido, int telefono, String correo, String direccion, String contrasena, String numero_tarjeta, int codigo_seguridad, String fecha_vencimiento) {
        this.id_cliente = id_cliente;
        this.nombre = nombre;
        this.apellido = apellido;
        this.telefono = telefono;
        this.correo = correo;
        this.direccion = direccion;
        this.contrasena = contrasena;
        this.numero_tarjeta = numero_tarjeta;
        this.codigo_seguridad = codigo_seguridad;
        this.fecha_vencimiento = fecha_vencimiento;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getNumero_tarjeta() {
        return numero_tarjeta;
    }

    public void setNumero_tarjeta(String numero_tarjeta) {
        this.numero_tarjeta = numero_tarjeta;
    }

    public int getCodigo_seguridad() {
        return codigo_seguridad;
    }

    public void setCodigo_seguridad(int codigo_seguridad) {
        this.codigo_seguridad = codigo_seguridad;
    }

    public String getFecha_vencimiento() {
        return fecha_vencimiento;
    }

    public void setFecha_vencimiento(String fecha_vencimiento) {
        this.fecha_vencimiento = fecha_vencimiento;
    }
    
    
    
    
}
