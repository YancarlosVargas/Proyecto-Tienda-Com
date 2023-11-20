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
import java.util.HashMap;
import java.util.Map;
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
public class ModeloUsuario {

    private int doc, sex, rol;
    private String nom, dir, tel, cor, lo, cl, tipodedoc;
    private Date fec;

    public int getDoc() {
        return doc;
    }

    public void setDoc(int doc) {
        this.doc = doc;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getTipodedoc() {
        return tipodedoc;
    }

    public void setTipodedoc(String tipodedoc) {
        this.tipodedoc = tipodedoc;
    }

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
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

    public void setTecl(String tec) {
        this.tel = tec;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public String getLo() {
        return lo;
    }

    public void setLo(String lo) {
        this.lo = lo;
    }

    public String getCl() {
        return cl;
    }

    public void setCl(String cl) {
        this.cl = cl;
    }

    public Date getFec() {
        return fec;
    }

    public void setFec(Date fec) {
        this.fec = fec;
    }

    public Map<String, Integer> llenarCombo(String valor) {
        Conexion conect = new Conexion();
        Connection cn = conect.iniciarConexion();

        String sql = "Select * from mostrar_" + valor;

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

        String sql = "Call Insersion_Usuario(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, getDoc());
            ps.setInt(2, getSex());
            ps.setInt(3, getRol());
            ps.setString(4, getNom());
            ps.setString(5, getTel());
            ps.setString(6, getCor());
            ps.setString(7, getDir());
            ps.setString(8, getLo());
            ps.setString(9, getCl());
            ps.setDate(10, (java.sql.Date) getFec());
            ps.setString(11, getTipodedoc());
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

    public void mostrarTablaUsuario(JTable tabla, String valor, String nomPesta) {
        Conexion conect = new Conexion();
        Connection cn = conect.iniciarConexion();

        JButton editar = new JButton();
        JButton eliminar = new JButton();
        JButton agregar = new JButton();

        JTableHeader encabezado = tabla.getTableHeader();
        encabezado.setDefaultRenderer(new GestionEncabezado());
        tabla.setTableHeader(encabezado);
        tabla.setDefaultRenderer(Object.class, new GestionCeldas());

        editar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/editar.png")));
        eliminar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/eliminar.png")));
        agregar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/agregar-usuario.png")));

        String[] titulo = {"Numero De Documento", "Genero/Sexo", "Cargo/Rol", "Nombre", "Telefono", "Correo", "Direccion", "Fecha De Nacimiento", "Tipo de Documento"};
        int total = titulo.length;

        if (nomPesta.equals("Usuario")) {
            titulo = Arrays.copyOf(titulo, titulo.length + 2);
            titulo[titulo.length - 2] = "Editar";
            titulo[titulo.length - 1] = "Eliminar";
        } else {
            titulo = Arrays.copyOf(titulo, titulo.length + 1);
            titulo[titulo.length - 1] = "Agregar";
        }

        DefaultTableModel tablaUsuario = new DefaultTableModel(null, titulo) {
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };

        String sqlUsuario;
        if (valor.equals("")) {
            sqlUsuario = "Select * from mostrar_usuario";
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

                Object[] fila = {dato[0], dato[1], dato[2], dato[3], dato[4], dato[5], dato[6], dato[7], dato[8]};
                if (nomPesta.equals("Usuario")) {
                    fila = Arrays.copyOf(fila, fila.length + 2);
                    fila[fila.length - 2] = editar;
                    fila[fila.length - 1] = eliminar;
                } else {
                    fila = Arrays.copyOf(fila, fila.length + 1);
                    fila[fila.length - 1] = agregar;
                }
                tablaUsuario.addRow(fila);
            }
            cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        tabla.setModel(tablaUsuario);

        int numColumnas = tabla.getColumnCount();
        int[] tamanos = {350, 150, 120, 100, 100, 100, 100, 150, 150, 50, 50};
        for (int i = 0; i < numColumnas; i++) {
            TableColumn columna = tabla.getColumnModel().getColumn(i);
            columna.setPreferredWidth(tamanos[i]);
        }
        conect.cerrarConexion();

    }

    public void buscarUsuario(int valor) {
        Conexion cone = new Conexion();
        Connection cn = cone.iniciarConexion();

        String sql = "call BuscarRegistroActualizar(" + valor + ")";

        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                setDoc(rs.getInt(1));
                setNom(rs.getString(4));
                setTecl(rs.getString(5));
                setCor(rs.getString(6));
                setDir(rs.getString(7));
                setFec(rs.getDate(11));
                setSex(rs.getInt(2));
                setRol(rs.getInt(3));
                setLo(rs.getString(9));
                setCl(rs.getString(10));
                setTipodedoc(rs.getString(12));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public String obtenerSeleccion(Map<String, Integer> dato, int valor) {
        for (Map.Entry<String, Integer> seleccion : dato.entrySet()) {
            if (seleccion.getValue() == valor) {
                return seleccion.getKey();
            }
        }
        return null;
    }

    public void actualizarUsuario() {
        Conexion cone = new Conexion();
        Connection cn = cone.iniciarConexion();

        String sql = "call Actualizar_Usuario(?,?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement ps = cn.prepareStatement(sql);

            ps.setInt(1,getDoc());
            ps.setString(2, getNom());
            ps.setString(3, getTel());
            ps.setString(4, getCor());
            ps.setString(5, getDir());
            ps.setDate(6, (java.sql.Date) getFec());
            ps.setString(7, getCl());
            ps.setInt(8, getSex());
            ps.setInt(9, getRol());
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null, "Registro Actualizado");
            cn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
        
        public void eliminarUsuario() {
        Conexion cone = new Conexion();
        Connection cn = cone.iniciarConexion();

        String sql = "call Eliminar_Usuario(?)";

        try {
            PreparedStatement ps = cn.prepareStatement(sql);

            ps.setInt(1,getDoc());
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null, "Usuario Eliminado", "Eliminar Usuario", JOptionPane.PLAIN_MESSAGE);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }

}
