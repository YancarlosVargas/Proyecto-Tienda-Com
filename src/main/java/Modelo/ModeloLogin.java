/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Controlador.Conexion;
import Vista.Login;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author HuevosFundidos
 */
public class ModeloLogin {

    Conexion conect = new Conexion();
    Connection cn = conect.iniciarConexion();

    String usu, contra;

    public ModeloLogin() {

    }

    public String getUsu() {
        return usu;
    }

    public void setUsu(String usu) {
        this.usu = usu;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public boolean validacion(String usuario, String pass) {
        boolean result = false;
        String sql = "Call login(?,?)";
        try {
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                result = true;                
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;

    }

}
