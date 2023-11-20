/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Controlador.Conexion;
import com.toedter.calendar.JDateChooser;
import java.awt.Component;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.Date;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;
import javax.swing.table.TableColumn;

/**
 *
 * @author HuevosFundidos
 */
public class ModeloFactura_Compra {
    private int idfactu, ced, idusu;
    private String tipopago;
    private float impu, totalfac, desc;
    private Date fec;

    public int getIdfactu() {
        return idfactu;
    }

    public void setIdfactu(int idfactu) {
        this.idfactu = idfactu;
    }

    public int getCed() {
        return ced;
    }

    public void setCed(int ced) {
        this.ced = ced;
    }

    public float getDesc() {
        return desc;
    }

    public void setDesc(float desc) {
        this.desc = desc;
    }

    public int getIdusu() {
        return idusu;
    }

    public void setIdusu(int idusu) {
        this.idusu = idusu;
    }

    public String getTipopago() {
        return tipopago;
    }

    public void setTipopago(String tipopago) {
        this.tipopago = tipopago;
    }

    public float getImpu() {
        return impu;
    }

    public void setImpu(float impu) {
        this.impu = impu;
    }

    public float getTotalfac() {
        return totalfac;
    }

    public void setTotalfac(float totalfac) {
        this.totalfac = totalfac;
    }

    public Date getFec() {
        return fec;
    }

    public void setFec(Date fec) {
        this.fec = fec;
    }

    public void insertarfacturacompra() {
        Conexion conect = new Conexion();
        Connection cn = conect.iniciarConexion();

        String sql = "Call Insersion_Factura_Compra(?,?,?,?)";
        try {
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, getCed());
            ps.setInt(2, getIdusu());
            ps.setFloat(3, getDesc());
            ps.setString(4, getTipopago());
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null, "Registro Almacenado");
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

    public void mostrarFactura_Compra(JTable tabla, String valor, String nomPesta) {
        Conexion conect = new Conexion();
        Connection cn = conect.iniciarConexion();

        JButton editar = new JButton();
        JButton eliminar = new JButton();

        JTableHeader encabezado = tabla.getTableHeader();
        encabezado.setDefaultRenderer(new GestionEncabezado());
        tabla.setTableHeader(encabezado);
        tabla.setDefaultRenderer(Object.class, new GestionCeldas());

        editar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/editar.png")));
        eliminar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/eliminar.png")));

        String[] titulo = {"Identificacion", "IdProveedor", "IdUsuario", "Fecha","TotalCompra", "Descuento", "TipoDePago"};
        int total = titulo.length;

        if (nomPesta.equals("Factura")) {
            titulo = Arrays.copyOf(titulo, titulo.length + 2);
            titulo[titulo.length - 2] = "Editar";
            titulo[titulo.length - 1] = "Eliminar";
        } 

        DefaultTableModel tablaUsuario = new DefaultTableModel(null, titulo) {
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };

        String sqlUsuario;
        if (valor.equals("")) {
            sqlUsuario = "Select * from fact_comp";
        } else {
            sqlUsuario = "call Filtro_usuario('" + valor + "')";
        }
        try {
            String[] dato = new String[titulo.length];
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sqlUsuario);
            while (rs.next()) {
                for (int i = 0; i < total; i++) {
                    dato[i] = rs.getString(i + 1);
                }

                Object[] fila = {dato[0], dato[1], dato[2], dato[3], dato[4], dato[5], dato[6]};
                if (nomPesta.equals("Factura")) {
                    fila = Arrays.copyOf(fila, fila.length + 2);
                    fila[fila.length - 2] = editar;
                    fila[fila.length - 1] = eliminar;
                } 
                tablaUsuario.addRow(fila);
            }
            cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        tabla.setModel(tablaUsuario);

        int numColumnas = tabla.getColumnCount();
        int[] tamanos = {200, 200, 150, 100, 100, 100, 100, 50, 50};
        for (int i = 0; i < numColumnas; i++) {
            TableColumn columna = tabla.getColumnModel().getColumn(i);
            columna.setPreferredWidth(tamanos[i]);
        }
        conect.cerrarConexion();

    }
    
    public void actualizarFactura_Compra() {
        Conexion cone = new Conexion();
        Connection cn = cone.iniciarConexion();

        String sql = "call Actualizar_Factura_Compra(?,?,?,?)";

        try {
            PreparedStatement ps = cn.prepareStatement(sql);

            ps.setInt(1,getIdfactu());
            ps.setInt(2, getCed());
            ps.setInt(3, getIdusu());
            ps.setString(4, getTipopago());
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null, "Registro Actualizado");
            cn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void buscarFactura_Compra(int valor) {
        Conexion cone = new Conexion();
        Connection cn = cone.iniciarConexion();

        String sql = "call BuscarRegistro_Factura_Compra(" + valor + ")";

        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                setIdfactu(rs.getInt(1));
                setCed(rs.getInt(2));
                setIdusu(rs.getInt(3));
                setFec(rs.getDate(4));
                setTotalfac(rs.getInt(5));
                setDesc(rs.getFloat(6));
                setTipopago(rs.getString(7));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    
     public void eliminarFactura_Compra() {
        Conexion cone = new Conexion();
        Connection cn = cone.iniciarConexion();

        String sql = "call Eliminar_Factura_Compra(?)";

        try {
            PreparedStatement ps = cn.prepareStatement(sql);

            ps.setInt(1,getIdfactu());
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null, "Factura Compra Eliminada", "Eliminar Factura Compra", JOptionPane.PLAIN_MESSAGE);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
}
