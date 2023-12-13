/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Controlador.Conexion;
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
 * @author SENA
 */
public class ModeloVenta {

    private String tipodepago;
    private int idusuario, idcliente, idfactura, numerodecomprobante, idproducto, cantidad;
    private Date fecha;
    private float impuesto, totalfactura, descuento;

    public int getNumerodecomprobante() {
        return numerodecomprobante;
    }

    public void setNumerodecomprobante(int numerodecomprobante) {
        this.numerodecomprobante = numerodecomprobante;
    }
    
    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public float getImpuesto() {
        return impuesto;
    }

    public void setImpuesto(float impuesto) {
        this.impuesto = impuesto;
    }

    public float getTotalfactura() {
        return totalfactura;
    }

    public void setTotalfactura(float totalfactura) {
        this.totalfactura = totalfactura;
    }

    public int getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(int idproducto) {
        this.idproducto = idproducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public float getDescuento() {
        return descuento;
    }

    public void setDescuento(float descuento) {
        this.descuento = descuento;
    }
    
    public int getIdfactura() {
        return idfactura;
    }

    public void setIdfactura(int idfactura) {
        this.idfactura = idfactura;
    }

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

        String sql = "Call Insersion_Factura(?,?,?,?)";
        try {
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, getTipodepago());
            ps.setInt(2, getIdcliente());
            ps.setInt(3, getIdusuario());
            ps.setInt(4, getNumerodecomprobante());
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null, "Registro Almacenado");
            cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        conect.cerrarConexion();
    }
    
     public void insertarProductoFactura() {
        Conexion conect = new Conexion();
        Connection cn = conect.iniciarConexion();

        String sql = "Call Insersion_ProductoFactura(?,?,?,?)";
        try {
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, getIdproducto());
            ps.setInt(2, getIdfactura());
            ps.setInt(3, getCantidad());
            ps.setFloat(4, getDescuento());
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null, "Registro Almacenado");
            cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        conect.cerrarConexion();
    }

    public void mostrarVentaTabla(JTable tabla, String valor, String nomPesta) {
        Conexion conect = new Conexion();
        Connection cn = conect.iniciarConexion();

        JButton editar = new JButton();
        JButton agregar_producto = new JButton();
        JButton mostrar_detalle = new JButton();
        JButton imprimir = new JButton();

        JTableHeader encabezado = tabla.getTableHeader();
        encabezado.setDefaultRenderer(new GestionEncabezado());
        tabla.setTableHeader(encabezado);
        tabla.setDefaultRenderer(Object.class, new GestionCeldas());

        editar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/editar.png")));
        agregar_producto.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/agregar-producto.png")));
        mostrar_detalle.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/mostrar-detalle.png")));
        imprimir.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/impresora.png")));

        String[] titulo = {"Identificador", "Fecha", "TipoDePago", "Impuesto", "TotalFactura", "Cedula", "IDUsuario", "NumeroDeComprobante"};
        int total = titulo.length;

        if (nomPesta.equals("Editar")) {
            titulo = Arrays.copyOf(titulo, titulo.length + 4);
            titulo[titulo.length - 1] = "Editar";
            titulo[titulo.length - 2] = "Agregar Producto";
            titulo[titulo.length - 3] = "Mostrar Detalle";
            titulo[titulo.length - 4] = "Imprimir";
        }

        DefaultTableModel tablaProvedor = new DefaultTableModel(null, titulo) {
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };

        String sqlProvedor;
        if (valor.equals("")) {
            sqlProvedor = "Select * from mostrar_venta";
        } else {
            sqlProvedor = "call Filtro_Provedor('" + valor + "')";
        }
        try {
            String[] dato = new String[titulo.length];
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sqlProvedor);
            while (rs.next()) {
                for (int i = 0; i < total; i++) {
                    dato[i] = rs.getString(i + 1);
                }

                Object[] fila = {dato[0], dato[1], dato[2], dato[3], dato[4], dato[5], dato[6], dato[7]};
                if (nomPesta.equals("Editar")) {
                    fila = Arrays.copyOf(fila, fila.length + 4);
                    fila[fila.length - 1] = editar;
                    fila[fila.length - 2] = agregar_producto;
                    fila[fila.length - 3] = mostrar_detalle;
                    fila[fila.length - 4] = imprimir;
                }
                tablaProvedor.addRow(fila);
            }
            cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        tabla.setModel(tablaProvedor);

        int numColumnas = tabla.getColumnCount();
        int[] tamanos = {100, 100, 100, 100, 100, 100, 100, 100, 50, 50, 50, 50};
        for (int i = 0; i < numColumnas; i++) {
            TableColumn columna = tabla.getColumnModel().getColumn(i);
            columna.setPreferredWidth(tamanos[i]);
        }
        conect.cerrarConexion();

    }

    public void actualizarVenta() {
        Conexion cone = new Conexion();
        Connection cn = cone.iniciarConexion();

        String sql = "call Actualizar_Venta(?,?,?,?)";

        try {
            PreparedStatement ps = cn.prepareStatement(sql);

            ps.setInt(1, getIdfactura());
            ps.setString(2, getTipodepago());
            ps.setInt(3, getIdusuario());
            ps.setInt(4, getIdcliente());
            
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null, "Registro Actualizado");
            cn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void buscarVenta(int valor) {
        Conexion cone = new Conexion();
        Connection cn = cone.iniciarConexion();

        String sql = "call BuscarRegistro_Venta(" + valor + ")";

        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                setIdfactura(rs.getInt(1));
                setFecha(rs.getDate(2));
                setTipodepago(rs.getString(3));
                setImpuesto(rs.getFloat(4));
                setTotalfactura(rs.getFloat(5));
                setIdcliente(rs.getInt(6));
                setIdusuario(rs.getInt(7));
                setNumerodecomprobante(rs.getInt(9));
                
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    
    public boolean verificaciondecheckmarks(JTable Tabla) {
        for (int i = 0; i < Tabla.getRowCount(); i++) {
            Boolean recorrido = (Boolean) Tabla.getValueAt(i, 6);
            if (recorrido != null && recorrido) {
                return true;
            }
        }
        return false;

    }
    
      public void limpiarCasillas(Component[] panel) {
        for (Object vaciar : panel) {
            if (vaciar instanceof JTextField) {
                ((JTextField) vaciar).setText("");
            }

            if (vaciar instanceof JComboBox) {
                ((JComboBox) vaciar).setSelectedItem("Seleccionar:");
            }

        }
    }
    
    public void agregardatos(JTable TablaInformacion, JTable TablaLLevar) {
        JTableHeader encabezado = TablaInformacion.getTableHeader();
        encabezado.setDefaultRenderer(new GestionEncabezado());
        TablaLLevar.setTableHeader(encabezado);
        TablaLLevar.setDefaultRenderer(Object.class, new GestionCeldas());

        Object[] titulo = {"Codigo", "Producto", "Imagen", "Cantidad", "Precio"};

        DefaultTableModel tablaAñadirProducto = new DefaultTableModel(null, titulo) {
            public boolean isCellEditable(int row, int column) {
                return column == 3 || column == 4;
            }
        };

        if (verificaciondecheckmarks(TablaInformacion)) {
            for (int i = 0; i < TablaInformacion.getRowCount(); i++) {
                Boolean recorrido = (Boolean) TablaInformacion.getValueAt(i, 6);
                if (recorrido != null && recorrido) {
                    Object dato[] = new Object[titulo.length];
                    dato[0] = TablaInformacion.getValueAt(i, 0);
                    dato[1] = TablaInformacion.getValueAt(i, 2);
                    dato[2] = TablaInformacion.getValueAt(i, 1);
                    dato[3] = TablaInformacion.getValueAt(i, 4);
                    dato[4] = TablaInformacion.getValueAt(i, 5);

                    Object Fila[] = {dato[0], dato[1], dato[2], dato[3], dato[4]};
                    tablaAñadirProducto.addRow(Fila);

                }
            }
        } else {
            JOptionPane.showMessageDialog(null, "Seleccionar un producto");
        }
        TablaLLevar.setModel(tablaAñadirProducto);
    }
    
    public String[] buscarVentaDetalle(int idventa, JTable tabla) {
        Conexion cone = new Conexion();
        Connection cn = cone.iniciarConexion();
        tabla.setDefaultRenderer(Object.class, new GestionCeldas());
        Object[] titulo = {"COD","Producto", "Descripcion", "Cantidad", "Descuento", 
            "Total"};
        int tot = titulo.length;

        DefaultTableModel tablaDetalle = new DefaultTableModel(null, titulo) {
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };

        String sql = "call Ver_Detalle_Venta(" + idventa + ")";
        String[] dato = null;

        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            int total = rs.getMetaData().getColumnCount();
            dato = new String[total];
            while (rs.next()) {
                for (int i = 0; i < total; i++) {
                    dato[i] = rs.getString(i + 1);
                }
                Object[] fila = {dato[8], dato[9], dato[10], dato[11],dato[12],dato[14]};
                tablaDetalle.addRow(fila);
            }
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
      
        tabla.setModel(tablaDetalle);
        int numColumnas = tabla.getColumnCount();
        int[] tamanos = {5, 20, 55, 6, 20,40};

        for (int i = 0; i < numColumnas; i++) {
            TableColumn columna = tabla.getColumnModel().getColumn(i);
            columna.setPreferredWidth(tamanos[i]);
        }
        cone.cerrarConexion();
        return dato;

    }


}
