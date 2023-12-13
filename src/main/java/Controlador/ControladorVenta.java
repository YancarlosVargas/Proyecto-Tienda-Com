/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.ModeloCliente;
import Modelo.ModeloProducto;
import Modelo.ModeloUsuario;
import Modelo.ModeloVenta;
import Vista.Agregar_Detalle_Venta;
import Vista.Clientes_Tabla;
import Vista.Factura;
import Vista.Principal;
import Vista.Producto_Tabla;
import Vista.Usuarios_Tabla;
import Vista.Ver_Detalle_Venta;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

/**
 *
 * @author SENA
 */
public class ControladorVenta implements ActionListener, DocumentListener {

    Principal prin = new Principal();
    Factura fact = new Factura();
    Usuarios_Tabla user_table = new Usuarios_Tabla();
    Clientes_Tabla cliente_table = new Clientes_Tabla();
    ModeloVenta modven = new ModeloVenta();
    ModeloUsuario moduser = new ModeloUsuario();
    ModeloCliente modcli = new ModeloCliente();
    Ver_Detalle_Venta verdetalleventa = new Ver_Detalle_Venta();
    Agregar_Detalle_Venta agregardetalleventa = new Agregar_Detalle_Venta();
    Producto_Tabla tableproducto = new Producto_Tabla();
    ModeloProducto modproduc = new ModeloProducto();

    public ControladorVenta() {
        fact.getBtnCancelar().addActionListener(this);
        fact.getBtnBuscarUsuario().addActionListener(this);
        fact.getBtnbuscarcliente().addActionListener(this);
        fact.getBtnGuardarVenta().addActionListener(this);
        agregardetalleventa.getBtnBuscarProducto().addActionListener(this);
        agregardetalleventa.getBtnagregardetalleventa().addActionListener(this);

        fact.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        user_table.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        cliente_table.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        verdetalleventa.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        agregardetalleventa.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        tableproducto.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        user_table.getTxtFiltro().getDocument().addDocumentListener(this);
        cliente_table.getTxtFiltro().getDocument().addDocumentListener(this);
        tableproducto.getTxtFiltro().getDocument().addDocumentListener(this);

        fact.addWindowListener(new WindowAdapter() {
            ;
        public void windowClosed(WindowEvent e) {
                ControladorPrincipal prin = new ControladorPrincipal();
                prin.iniciarPrincipal(5);
            }
        });

        user_table.addWindowListener(new WindowAdapter() {
            ;
        public void windowClosed(WindowEvent e) {
                fact.setVisible(true);
                user_table.setVisible(false);
            }
        });

        cliente_table.addWindowListener(new WindowAdapter() {
            ;
        public void windowClosed(WindowEvent e) {
                fact.setVisible(true);
                cliente_table.setVisible(false);
            }
        });

        verdetalleventa.addWindowListener(new WindowAdapter() {
            ;
        public void windowClosed(WindowEvent e) {
                ControladorPrincipal prin = new ControladorPrincipal();
                prin.iniciarPrincipal(5);
                verdetalleventa.setVisible(false);
            }
        });

        agregardetalleventa.addWindowListener(new WindowAdapter() {
            ;
        public void windowClosed(WindowEvent e) {
                ControladorPrincipal prin = new ControladorPrincipal();
                prin.iniciarPrincipal(5);
                agregardetalleventa.setVisible(false);
            }
        });
        
        tableproducto.addWindowListener(new WindowAdapter() {
            ;
        public void windowClosed(WindowEvent e) {
                ControladorPrincipal prin = new ControladorPrincipal();
                agregardetalleventa.setVisible(true);
                tableproducto.setVisible(false);
            }
        });

    }

    public void iniciarVenta() {
        prin.setVisible(false);
        fact.setVisible(true);
        fact.setLocationRelativeTo(null);
        fact.setTitle("Nueva Venta | Ventana");

    }

    public void actualizarVenta(int idfactura) {
        modven.buscarVenta(idfactura);
        fact.getTxtUsuario().setText(String.valueOf(modven.getIdusuario()));
        fact.getTxtcliente().setText(String.valueOf(modven.getIdcliente()));
        fact.getCbxtipodepago().setSelectedItem(modven.getTipodepago());
        fact.getTxtComprobante().setText(String.valueOf(modven.getNumerodecomprobante()));

        prin.setVisible(false);
        fact.getLbltitulo().setText("ACTUALIZAR VENTA");
        fact.setLocationRelativeTo(null);
        fact.getBtnGuardarVenta().setText("Actualizar");
        fact.setVisible(true);
        fact.setTitle("Actualizar Venta | Ventana");
        fact.getTxtComprobante().setEnabled(false);

    }

    public void ver_Venta(int idventa) {
        String dato[] = modven.buscarVentaDetalle(idventa, verdetalleventa.getJtDetalleVenta());
        verdetalleventa.getLblFacturaCompra().setText(String.valueOf(idventa));
        verdetalleventa.getLblCliente().setText(dato[1]);
        verdetalleventa.getLblUsuario().setText(dato[2]);
        verdetalleventa.getLbltipopago().setText(dato[3]);
        verdetalleventa.getLblNumeroComprobante().setText(dato[4]);
        verdetalleventa.getLblFecha().setText(dato[5]);
        verdetalleventa.getLblImpuesto().setText(dato[6]);
        verdetalleventa.getLblValoraPagar().setText(dato[7]);
        verdetalleventa.setLocationRelativeTo(null);
        verdetalleventa.setVisible(true);
    }

    public void agregarDetalleVenta(int venta) {
        agregardetalleventa.setVisible(true);
        agregardetalleventa.setLocationRelativeTo(null);
        agregardetalleventa.setTitle("Añadir Detalle Venta | Ventana");
        agregardetalleventa.getTxtidfactura().setText(String.valueOf(venta));

    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource().equals(fact.getBtnBuscarUsuario())) {
            fact.setVisible(false);
            user_table.setVisible(true);
            user_table.setLocationRelativeTo(null);
            moduser.mostrarTablaUsuario(user_table.getJtUsuario(), "", "");

            user_table.getJtUsuario().addMouseListener(new MouseAdapter() {
                @Override
                public void mouseClicked(MouseEvent e) {
                    int fila = user_table.getJtUsuario().rowAtPoint(e.getPoint());
                    int columna = user_table.getJtUsuario().columnAtPoint(e.getPoint());
                    moduser.setDoc(Integer.parseInt(user_table.getJtUsuario().getValueAt(fila, 0).toString()));
                    if (columna == 9) {
                        user_table.setVisible(false);
                        fact.setVisible(true);
                        Object idusuario = moduser.getDoc();
                        fact.getTxtUsuario().setText(idusuario.toString());
                    }

                }

            });

        }

        if (e.getSource().equals(fact.getBtnbuscarcliente())) {
            fact.setVisible(false);
            cliente_table.setVisible(true);
            cliente_table.setLocationRelativeTo(null);
            modcli.mostrarTablaCliente(cliente_table.getJtCliente(), "", "");

            cliente_table.getJtCliente().addMouseListener(new MouseAdapter() {
                @Override
                public void mouseClicked(MouseEvent e) {
                    int fila = cliente_table.getJtCliente().rowAtPoint(e.getPoint());
                    int columna = cliente_table.getJtCliente().columnAtPoint(e.getPoint());
                    modcli.setCdl(Integer.parseInt(cliente_table.getJtCliente().getValueAt(fila, 0).toString()));
                    if (columna == 8) {
                        cliente_table.setVisible(false);
                        fact.setVisible(true);
                        Object idcliente = modcli.getCdl();
                        fact.getTxtcliente().setText(idcliente.toString());
                    }

                }

            });
        }

        if (e.getSource().equals(fact.getBtnCancelar())) {
            fact.dispose();
        }

        if (e.getSource().equals(fact.getBtnGuardarVenta())) {
            if (fact.getCbxtipodepago().getSelectedItem().equals("Seleccionar:") || fact.getTxtUsuario().getText().isEmpty() || fact.getTxtcliente().getText().isEmpty() || fact.getTxtComprobante().getText().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Hace Falta Informacion");
            } else {
                modven.setIdcliente(Integer.parseInt(fact.getTxtcliente().getText()));
                modven.setIdusuario(Integer.parseInt(fact.getTxtUsuario().getText()));
                modven.setTipodepago(fact.getCbxtipodepago().getSelectedItem().toString());
                modven.setNumerodecomprobante(Integer.parseInt(fact.getTxtComprobante().getText()));

                if (fact.getBtnGuardarVenta().getText().equals("Guardar")) {

                    modven.insertarVenta();
                    modven.limpiarCasillas(fact.getJpVenta().getComponents());

                } else {
                    modven.actualizarVenta();
                    fact.setVisible(false);
                    prin.getJtPrincipal().setSelectedIndex(5);
                    modven.mostrarVentaTabla(prin.getJtVenta(), "", "Editar");
                    fact.dispose();

                }
            }
        }

        if (e.getSource().equals(agregardetalleventa.getBtnBuscarProducto())) {
            tableproducto.setVisible(true);
            tableproducto.setLocationRelativeTo(null);
            agregardetalleventa.setVisible(false);
            tableproducto.setTitle("Buscar Producto | Ventana");
            modproduc.mostrarTablaProducto(tableproducto.getJtproducto(), "", "");

            JButton agregar = new JButton("Añadir");
            agregar.setBounds(13, 80, 80, 20);
            tableproducto.getJpBuscarProducto().add(agregar);

            agregar.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    modven.agregardatos(tableproducto.getJtproducto(), agregardetalleventa.getJtDetalleVenta());
                    tableproducto.setVisible(false);
                    agregardetalleventa.setVisible(true);
                    agregardetalleventa.setLocationRelativeTo(null);
                }
            });

        }
        
        if (e.getSource().equals(agregardetalleventa.getBtnagregardetalleventa())) {
            if (agregardetalleventa.getTxtidfactura().getText().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Hace falta informacion");
            } else {
                agregardetalleventa.getBtnagregardetalleventa().addMouseListener(new MouseAdapter() {
                    @Override
                    public void mouseClicked(MouseEvent e) {
                        int fila = agregardetalleventa.getJtDetalleVenta().rowAtPoint(e.getPoint());
                        int columna = agregardetalleventa.getJtDetalleVenta().columnAtPoint(e.getPoint());
                        modven.setIdfactura(Integer.parseInt(agregardetalleventa.getTxtidfactura().getText()));
                        modven.setIdproducto(Integer.parseInt(agregardetalleventa.getJtDetalleVenta().getValueAt(fila, 0).toString()));
                        modven.setCantidad(Integer.parseInt(agregardetalleventa.getJtDetalleVenta().getValueAt(fila, 3).toString()));
                        modven.setDescuento(Float.parseFloat((agregardetalleventa.getJtDetalleVenta().getValueAt(fila, 4).toString())));
                        modven.insertarProductoFactura();
                    }
                });

            }
        }
    }

    @Override
    public void insertUpdate(DocumentEvent e) {
        moduser.mostrarTablaUsuario(user_table.getJtUsuario(), user_table.getTxtFiltro().getText(), "");
        modcli.mostrarTablaCliente(cliente_table.getJtCliente(), cliente_table.getTxtFiltro().getText(), "");
        modproduc.mostrarTablaProducto(tableproducto.getJtproducto(), tableproducto.getTxtFiltro().getText(), "");

    }

    @Override
    public void removeUpdate(DocumentEvent e) {
        moduser.mostrarTablaUsuario(user_table.getJtUsuario(), user_table.getTxtFiltro().getText(), "");
        modcli.mostrarTablaCliente(cliente_table.getJtCliente(), cliente_table.getTxtFiltro().getText(), "");
        modproduc.mostrarTablaProducto(tableproducto.getJtproducto(), tableproducto.getTxtFiltro().getText(), "");

    }

    @Override
    public void changedUpdate(DocumentEvent e) {
        moduser.mostrarTablaUsuario(user_table.getJtUsuario(), user_table.getTxtFiltro().getText(), "");
        modcli.mostrarTablaCliente(cliente_table.getJtCliente(), cliente_table.getTxtFiltro().getText(), "");
        modproduc.mostrarTablaProducto(tableproducto.getJtproducto(), tableproducto.getTxtFiltro().getText(), "");
    }
}
