package Modelo;

import Controlador.Conexion;
import com.toedter.calendar.JDateChooser;
import java.awt.Component;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

public class ModeloCliente {

    Conexion conect = new Conexion();
    Connection cn = conect.iniciarConexion();

    private int cdl, sex;
    private String nom, dir, tel, cor, tipodedocumento;
    private Date fec;

    public String getTipodedocumento() {
        return tipodedocumento;
    }

    public void setTipodedocumento(String tipodedocumento) {
        this.tipodedocumento = tipodedocumento;
    }
    
    public int getCdl() {
        return cdl;
    }

    public void setCdl(int cdl) {
        this.cdl = cdl;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public Date getFec() {
        return fec;
    }

    public void setFec(Date fec) {
        this.fec = fec;
    }

    public Map<String, Integer> llenarCombo(String genero) {
        String sql = "Select * from mostrar_sexo";

        Map<String, Integer> llenar_combo = new HashMap<>();
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                llenar_combo.put(rs.getString(2), rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return llenar_combo;
    }

    public void insertarUsuario() {
        Conexion conect = new Conexion();
        Connection cn = conect.iniciarConexion();
        String sql = "Call Insersion_Cliente(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, getCdl());
            ps.setInt(2, getSex());
            ps.setString(3, getNom());
            ps.setString(4, getTel());
            ps.setString(5, getCor());
            ps.setString(6, getDir());
            ps.setDate(7, (java.sql.Date) getFec());
            ps.setString(8, getTipodedocumento());
            ps.executeUpdate();
            JOptionPane.showConfirmDialog(null, "Registro Almacenado");
            cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        conect.cerrarConexion();
    }

    public void limpiarCasillas(Component[] panel) {
        for (Object vaciar : panel) {
            if (vaciar instanceof JTextField) {
                ((JTextField) vaciar).setText("");
            }

            if (vaciar instanceof JComboBox) {
                ((JComboBox) vaciar).setSelectedItem("Seleccione...");
                ((JComboBox) vaciar).setSelectedItem("Seleccionar:");
            }

            if (vaciar instanceof JDateChooser) {
                ((JDateChooser) vaciar).setDate(null);
            }
        }
    }
}
