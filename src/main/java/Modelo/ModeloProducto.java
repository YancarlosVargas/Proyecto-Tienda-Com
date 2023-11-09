/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Controlador.Conexion;
import java.awt.Component;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;

/**
 *
 * @author SENA
 */
public class ModeloProducto {

    private String nom, desc, route;
    private byte imagen[];

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }

    public void buscarImagen() {
        JFileChooser archivos = new JFileChooser();
        String rutacarpeta = getClass().getClassLoader().getResource("productos").getPath();
        File carpeta = new File(rutacarpeta);
        archivos.setCurrentDirectory(carpeta);
        FileNameExtensionFilter filtro = new FileNameExtensionFilter(
                "JPG, PNG & GIF", "jpg", "png", "gif");

        archivos.setFileFilter(filtro);
        if (archivos.showOpenDialog(null) == JFileChooser.APPROVE_OPTION) {
            setRoute(archivos.getSelectedFile().getAbsolutePath());
        }

    }

    public byte[] convertirImagenes(String ruta) {
        try {
            File archivo = new File(ruta);
            byte[] img = new byte[(int) archivo.length()];
            InputStream Imagen = new FileInputStream(archivo);
            Imagen.read(img);

            return img;
        } catch (Exception e) {
            return null;
        }

    }

    public void insertarProducto() {
        Conexion cn = new Conexion();
        Connection conect = cn.iniciarConexion();

        String sql = "call Insersion_Producto(?,?,?,?)";

        try {
            PreparedStatement ps = conect.prepareStatement(sql);
            ps.setString(1, getNom());
            ps.setString(2, getDesc());
            ps.setBytes(3, getImagen());
            ps.setString(4, getRoute());
            ps.executeUpdate();

            JOptionPane.showMessageDialog(null, "Guardado");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void limpiarCasillas(Component[] panel) {
        for (Object vaciar : panel) {
            if (vaciar instanceof JTextField) {
                ((JTextField) vaciar).setText("");
            }

            if (vaciar instanceof JScrollPane) {
                Component[] limpio = ((JScrollPane) vaciar).getViewport().getComponents();
                for (Object controltext : limpio) {
                    if (controltext instanceof JTextArea) {
                        ((JTextArea) controltext).setText("");
                    }
                }

            }

        }
    }

    public void mostrarTablaProducto(JTable tabla, String valor, String NomPesta) {
        Conexion cn = new Conexion();
        Connection conex = cn.iniciarConexion();

        JTableHeader encabezado = tabla.getTableHeader();
        encabezado.setDefaultRenderer(new GestionEncabezado());
        tabla.setTableHeader(encabezado);

        String[] titulo = {"Identificador", "Nombre", "Descripcion", "Cantidad", "Imagen", "Precio"};
        int total = titulo.length;

        if (NomPesta.equals("Producto")) {
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

        String sqlproducto = valor.isEmpty() ? "select * from mostrar_producto" : "call Filtro_Producto('" + valor + "')";

        try {
            String datos[] = new String[total];
            Object dato[] = new Object[total];

            Statement st = conex.createStatement();
            ResultSet rs = st.executeQuery(sqlproducto);
            while (rs.next()) {
                try {
                    byte[] imag = rs.getBytes(5);
                    BufferedImage bfimage = null;
                    InputStream inStr = new ByteArrayInputStream(imag);

                    bfimage = ImageIO.read(inStr);

                    ImageIcon imagen = new ImageIcon(bfimage.getScaledInstance(64, 64, 0));
                    dato[1] = new JLabel(imagen);
                } catch (Exception e) {
                    dato[1] = new JLabel("No Image");
                }

                dato[0] = rs.getString(1);
                dato[2] = rs.getString(2);
                dato[3] = rs.getString(3);
                dato[4] = rs.getString(4);
                dato[5] = rs.getString(5);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}

