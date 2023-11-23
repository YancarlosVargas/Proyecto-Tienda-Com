/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Vista.Clientes_Tabla;
import Vista.Factura;
import Vista.Principal;
import Vista.Usuarios_Tabla;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.JFrame;

/**
 *
 * @author SENA
 */
public class ControladorVenta implements ActionListener{

    Principal prin = new Principal();
    Factura fact = new Factura();
    Usuarios_Tabla user_table = new Usuarios_Tabla();
    Clientes_Tabla cliente_table = new Clientes_Tabla();

    public ControladorVenta() {
        fact.getBtnCancelar().addActionListener(this);
        fact.getBtnBuscarUsuario().addActionListener(this);
        fact.getBtnbuscarcliente().addActionListener(this);
        
        fact.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        user_table.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        cliente_table.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        
        
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
    }

    public void iniciarVenta() {
        prin.setVisible(false);
        fact.setVisible(true);
        fact.setLocationRelativeTo(null);
        fact.setTitle("Nueva Venta | Ventana");
        

    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource().equals(fact.getBtnBuscarUsuario())){
            fact.setVisible(false);
            user_table.setVisible(true);
            user_table.setLocationRelativeTo(null);
        }
        
        if(e.getSource().equals(fact.getBtnbuscarcliente())){
            fact.setVisible(false);
            cliente_table.setVisible(true);
            cliente_table.setLocationRelativeTo(null);
        }
        
        if(e.getSource().equals(fact.getBtnCancelar())){
            fact.dispose();
        }
    }
}
