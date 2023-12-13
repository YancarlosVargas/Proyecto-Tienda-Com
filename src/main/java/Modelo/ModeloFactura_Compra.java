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
 * @author HuevosFundidos
 */
public class ModeloFactura_Compra {

    private int idfactu, ced, idusu, idprodu, cantidadcompra, preciouni, numerodecomprobante;
    private String tipopago;
    private float impu, totalfac, desc;
    private Date fec;

    public int getNumerodecomprobante() {
        return numerodecomprobante;
    }

    public void setNumerodecomprobante(int numerodecomprobante) {
        this.numerodecomprobante = numerodecomprobante;
    }

    public int getIdprodu() {
        return idprodu;
    }

    public void setIdprodu(int idprodu) {
        this.idprodu = idprodu;
    }

    public int getCantidadcompra() {
        return cantidadcompra;
    }

    public void setCantidadcompra(int cantidadcompra) {
        this.cantidadcompra = cantidadcompra;
    }

    public int getPreciouni() {
        return preciouni;
    }

    public void setPreciouni(int preciouni) {
        this.preciouni = preciouni;
    }

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
            ps.setString(3, getTipopago());
            ps.setInt(4, getNumerodecomprobante());
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null, "Registro Almacenado");
            cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        conect.cerrarConexion();
    }

    public void verDetalleFactura(int valor) {
        Conexion cone = new Conexion();
        Connection cn = cone.iniciarConexion();

        String sql = "call Ver_Detalle_Factura(" + valor + ")";

        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                for (int i = 0; i < 7; i++) {
                    rs.getString(i + 1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void insertarfacturacompraproducto() {
        Conexion conect = new Conexion();
        Connection cn = conect.iniciarConexion();

        String sql = "Call Insersion_Factura_Compra_Producto(?,?,?,?)";
        try {
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, getIdfactu());
            ps.setInt(2, getIdprodu());
            ps.setInt(3, getCantidadcompra());
            ps.setInt(4, getPreciouni());
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
                ((JComboBox) vaciar).setSelectedItem("Seleccionar:");
            }

        }
    }

    public void mostrarFactura_Compra(JTable tabla, String valor, String nomPesta) {
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

        String[] titulo = {"Identificacion", "IdProveedor", "IdUsuario", "Fecha", "TotalCompra", "Descuento", "TipoDePago", "NumeroDeComprobante"};
        int total = titulo.length;

        if (nomPesta.equals("Factura")) {
            titulo = Arrays.copyOf(titulo, titulo.length + 4);
            titulo[titulo.length - 1] = "Editar";
            titulo[titulo.length - 2] = "Agregar Producto";
            titulo[titulo.length - 3] = "Mostrar Detalle";
            titulo[titulo.length - 4] = "Imprimir";
        }

        DefaultTableModel tablaUsuario = new DefaultTableModel(null, titulo) {
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };

        String sqlUsuario;
        if (valor.equals("")) {
            sqlUsuario = "Select * from mostrar_factura_compra";
        } else {
            sqlUsuario = "call Filtro_Factura_Compra('" + valor + "')";
        }
        try {
            String[] dato = new String[titulo.length];
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sqlUsuario);
            while (rs.next()) {
                for (int i = 0; i < total; i++) {
                    dato[i] = rs.getString(i + 1);
                }

                Object[] fila = {dato[0], dato[1], dato[2], dato[3], dato[4], dato[5], dato[6], dato[7]};
                if (nomPesta.equals("Factura")) {
                    fila = Arrays.copyOf(fila, fila.length + 4);
                    fila[fila.length - 1] = editar;
                    fila[fila.length - 2] = agregar_producto;
                    fila[fila.length - 3] = mostrar_detalle;
                    fila[fila.length - 4] = imprimir;
                }
                tablaUsuario.addRow(fila);
            }
            cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        tabla.setModel(tablaUsuario);

        int numColumnas = tabla.getColumnCount();
        int[] tamanos = {200, 200, 150, 100, 100, 100, 100, 100, 50, 50, 50, 50};
        for (int i = 0; i < numColumnas; i++) {
            TableColumn columna = tabla.getColumnModel().getColumn(i);
            columna.setPreferredWidth(tamanos[i]);
        }
        conect.cerrarConexion();

    }

    public void mostrarDetalleFactura(JTable tabla, String valor, String nomPesta) {
        Conexion conect = new Conexion();
        Connection cn = conect.iniciarConexion();

        JButton eliminar = new JButton();

        JTableHeader encabezado = tabla.getTableHeader();
        encabezado.setDefaultRenderer(new GestionEncabezado());
        tabla.setTableHeader(encabezado);
        tabla.setDefaultRenderer(Object.class, new GestionCeldas());

        eliminar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/eliminar.png")));

        String[] titulo = {"IdentificadorFacturaCompra", "Producto", "CantidadComprada", "PrecioUnitario", "PrecioTotal"};
        int total = titulo.length;

        if (nomPesta.equals("Eliminar")) {
            titulo = Arrays.copyOf(titulo, titulo.length + 1);
            titulo[titulo.length - 1] = "Eliminar";
        }

        DefaultTableModel tablaProvedor = new DefaultTableModel(null, titulo) {
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };

        String sqlProvedor;
        if (valor.equals("")) {
            sqlProvedor = "Select * from mostrar_detalle_factura";
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

                Object[] fila = {dato[0], dato[1], dato[2], dato[3], dato[4]};
                if (nomPesta.equals("Eliminar")) {
                    fila = Arrays.copyOf(fila, fila.length + 1);
                    fila[fila.length - 1] = eliminar;
                }
                tablaProvedor.addRow(fila);
            }
            cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        tabla.setModel(tablaProvedor);

        int numColumnas = tabla.getColumnCount();
        int[] tamanos = {100, 100, 100, 100, 100, 20};
        for (int i = 0; i < numColumnas; i++) {
            TableColumn columna = tabla.getColumnModel().getColumn(i);
            columna.setPreferredWidth(tamanos[i]);
        }
        conect.cerrarConexion();

    }

    public void actualizarFactura_Compra() {
        Conexion cone = new Conexion();
        Connection cn = cone.iniciarConexion();

        String sql = "call Actualizar_Factura_Compra(?,?,?,?,?)";

        try {
            PreparedStatement ps = cn.prepareStatement(sql);

            ps.setInt(1, getIdfactu());
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

    public boolean verificaciondecheckmarks(JTable Tabla) {
        for (int i = 0; i < Tabla.getRowCount(); i++) {
            Boolean recorrido = (Boolean) Tabla.getValueAt(i, 6);
            if (recorrido != null && recorrido) {
                return true;
            }
        }
        return false;

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
    
    public String[] buscarFacturaDetalle(int fact, JTable tabla) {
        Conexion cone = new Conexion();
        Connection cn = cone.iniciarConexion();
        tabla.setDefaultRenderer(Object.class, new GestionCeldas());
        Object[] titulo = {"COD","Producto", "Descripcion", "Cantidad", "Valor Unitario", 
            "Total"};
        int tot = titulo.length;

        DefaultTableModel tablaDetalle = new DefaultTableModel(null, titulo) {
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };

        String sql = "call Ver_Detalle_Factura(" + fact + ")";
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
                Object[] fila = {dato[8], dato[9], dato[10], dato[11],dato[12],dato[13]};
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
