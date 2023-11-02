/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.ModeloUsuario;
import Vista.Cliente;
import Vista.Factura;
import Vista.Factura_Compra;
import Vista.Login;
import Vista.Principal;
import Vista.Producto;
import Vista.Proveedor;
import Vista.Usuario;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.JFrame;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

/**
 *
 * @author HuevosFundidos
 */
public class ControladorPrincipal implements ActionListener, ChangeListener, DocumentListener {
    
    Login log = new Login();
    Principal prin = new Principal();
    ModeloUsuario modusu = new ModeloUsuario();
    ControladorUsuario usu = new ControladorUsuario();
    Usuario user = new Usuario();
    Cliente cli = new Cliente();
    ControladorCliente clic = new ControladorCliente();
    Proveedor pro = new Proveedor();
    ControladorProveedor proc = new ControladorProveedor();
    Producto produc = new Producto();
    Factura_Compra factucom = new Factura_Compra();
    Factura factu = new Factura();
    ControladorProducto conpro = new ControladorProducto();
    
    public ControladorPrincipal() {
        prin.getBtnNuevoUsuario().addActionListener(this);
        user.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        
        prin.getBtnNuevoCliente().addActionListener(this);
        cli.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        
        prin.getBtnAñadirProveedor().addActionListener(this);
        pro.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        
        prin.getJtPrincipal().addChangeListener(this);
        prin.getBtnNuevoUsuario().addChangeListener(this);
        
        prin.getBtnNuevoProducto().addActionListener(this);
        produc.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        
        prin.getBtnNuevaFactura().addActionListener(this);
        produc.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        
        prin.getBtnNuevaVenta().addActionListener(this);
        produc.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        
        prin.getTxtFiltro().getDocument().addDocumentListener(this);
        
    }
    
    public void iniciarPrincipal(int valor) {
        log.setVisible(false);
        prin.setLocationRelativeTo(null);
        prin.setVisible(true);
        prin.setTitle("Panel Principal | Ventana");
        prin.setExtendedState(JFrame.MAXIMIZED_BOTH);
        gestionarceldas();
        prin.getJtPrincipal().setSelectedIndex(valor);
        
    }
    
    public void gestionarceldas() {
        if (prin.getJtPrincipal().getSelectedIndex() == 0) {
            gestionarUsuario();
            
        }
        
        if (prin.getJtPrincipal().getSelectedIndex() == 4) {
            gestionarFactura();
            
        }
        
    }
    
    public void gestionarUsuario() {
        
        modusu.mostrarTablaUsuario(prin.getJtUsuario(), "", "Usuario");
        
        prin.getTxtFiltro().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                prin.getTxtFiltro().setText("");
                prin.getTxtFiltro().setForeground(Color.black);
            }
            
        });
        
        prin.getJtUsuario().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int fila = prin.getJtUsuario().rowAtPoint(e.getPoint());
                int columna = prin.getJtUsuario().columnAtPoint(e.getPoint());
                modusu.setDoc(Integer.parseInt(prin.getJtUsuario().getValueAt(fila, 0).toString()));
                
                if (columna == 9) {
                    prin.setVisible(false);
                    usu.actualizarUsuario(modusu.getDoc());
                }
                
                if (columna == 10) {
                    
                    usu.eliminarUsuario(modusu.getDoc());
                    modusu.mostrarTablaUsuario(prin.getJtUsuario(), "", "Usuario");
                }
                
            }
            
        });
    }
    
    public void gestionarFactura() {
        
        modusu.mostrarTablaUsuario(prin.getJtFactura(), "", "Factura");
        
        prin.getTxtFiltro().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                prin.getTxtFiltro().setText("");
                prin.getTxtFiltro().setForeground(Color.black);
            }
            
        });
        
        prin.getJtFactura().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int fila = prin.getJtFactura().rowAtPoint(e.getPoint());
                int columna = prin.getJtFactura().columnAtPoint(e.getPoint());
                modusu.setDoc(Integer.parseInt(prin.getJtFactura().getValueAt(fila, 1).toString()));
                if (columna == 8) {
                    
                }
                
            }
            
        });
    }
    
    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == (prin.getBtnNuevoUsuario())) {
            usu.iniciarUsuario();
            prin.setVisible(false);
            
        }
        
        if (e.getSource() == (prin.getBtnNuevoCliente())) {
            clic.iniciarCliente();
            prin.setVisible(false);
            
        }
        
        if (e.getSource() == (prin.getBtnAñadirProveedor())) {
            proc.iniciarProveedor();
            prin.setVisible(false);
            
        }
        
        if (e.getSource() == (prin.getBtnNuevoProducto())) {
            prin.setVisible(false);
            conpro.iniciarProducto();
            
        }
        
        if (e.getSource() == (prin.getBtnNuevaFactura())) {
            factucom.setVisible(true);
            factucom.setLocationRelativeTo(null);
            prin.setVisible(false);
        }
        
        if (e.getSource() == (prin.getBtnNuevaVenta())) {
            factu.setVisible(true);
            factu.setLocationRelativeTo(null);
            prin.setVisible(false);
        }
        
    }
    
    @Override
    public void stateChanged(ChangeEvent e) {
        int seleccion = prin.getJtPrincipal().getSelectedIndex();
        if (seleccion == 0) {
            gestionarceldas();
        }
        
        if (seleccion == 4) {
            gestionarceldas();
        }
    }
    
    @Override
    public void insertUpdate(DocumentEvent e) {
        modusu.mostrarTablaUsuario(prin.getJtUsuario(), prin.getTxtFiltro().getText(), "Usuario");
    }
    
    @Override
    public void removeUpdate(DocumentEvent e) {
        modusu.mostrarTablaUsuario(prin.getJtUsuario(), prin.getTxtFiltro().getText(), "Usuario");
    }
    
    @Override
    public void changedUpdate(DocumentEvent e) {
        modusu.mostrarTablaUsuario(prin.getJtUsuario(), prin.getTxtFiltro().getText(), "Usuario");
    }
}
