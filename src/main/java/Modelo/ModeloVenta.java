/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author SENA
 */
public class ModeloVenta {
    private String tipodepago;
    private int idusuario, idcliente;

    public String getTipodepago() {
        return tipodepago;
    }

    public void setTipodepago(String tipodepago) {
        this.tipodepago = tipodepago;
    }

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public int getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(int idcliente) {
        this.idcliente = idcliente;
    }
    
    public void insertarVenta() {
        Conexion conect = new Conexion();
        Connection cn = conect.iniciarConexion();

        String sql = "Call Insersion_Factura(?,?,?)";
        try {
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, getTipodepago());
            ps.setInt(2, getIdusuario());
            ps.setInt(3, getIdcliente());
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null, "Registro Almacenado");
            cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        conect.cerrarConexion();
    }
    
    
}
