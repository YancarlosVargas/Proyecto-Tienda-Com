/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.ModeloProducto;
import Vista.Principal;
import Vista.Producto;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.File;
import javax.swing.JFrame;

/**
 *
 * @author HuevosFundidos
 */
public class ControladorProducto implements ActionListener{
    Producto pro = new Producto();
    Principal prin = new Principal();
    ModeloProducto modpro = new ModeloProducto();

    public ControladorProducto() {
        pro.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        pro.getBtnBuscarImagen().addActionListener(this);
        pro.getBtnGuardarProducto().addActionListener(this);

        pro.addWindowListener(new WindowAdapter() {
            ;
        public void windowClosed(WindowEvent e) {
                ControladorPrincipal princ = new ControladorPrincipal();
                princ.iniciarPrincipal(0);
            }
        });
    }

    public void iniciarProducto() {
        pro.setVisible(true);
        pro.setLocationRelativeTo(null);
        prin.setVisible(false);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource().equals(pro.getBtnBuscarImagen())) {
            modpro.buscarImagen();
            File file = new File(modpro.getRoute());
            String archivo = file.getName();
            pro.getTxtImagen().setText(archivo);
        }
        
        if (e.getSource().equals(pro.getBtnGuardarProducto())){
           modpro.setNom(pro.getTxtNombre().getText());
           modpro.setDesc(pro.getJtxtDescripcion().getText());
           modpro.setImagen(modpro.convertirImagenes(modpro.getRoute()));
           
           modpro.insertarProducto();
           modpro.limpiarCasillas(pro.getJpPanelProducto().getComponents());
        }
    }
}

