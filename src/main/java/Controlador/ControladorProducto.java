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
import javax.swing.JOptionPane;

/**
 *
 * @author HuevosFundidos
 */
public class ControladorProducto implements ActionListener {

    Producto pro = new Producto();
    Principal prin = new Principal();
    ModeloProducto modpro = new ModeloProducto();

    public ControladorProducto() {
        pro.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        pro.getBtnBuscarImagen().addActionListener(this);
        pro.getBtnGuardarProducto().addActionListener(this);
        pro.getBtnCancelar().addActionListener(this);

        pro.addWindowListener(new WindowAdapter() {
            ;
        public void windowClosed(WindowEvent e) {
                ControladorPrincipal princ = new ControladorPrincipal();
                princ.iniciarPrincipal(3);
            }
        });
    }

    public void iniciarProducto() {
        pro.setVisible(true);
        pro.setLocationRelativeTo(null);
        prin.setVisible(false);
        prin.setExtendedState(JFrame.MAXIMIZED_BOTH);
        pro.setTitle("Añadir Nuevo Producto | Ventana");
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource().equals(pro.getBtnBuscarImagen())) {
            modpro.buscarImagen();
            File file = new File(modpro.getRoute());
            String archivo = file.getName();
            pro.getTxtImagen().setText(archivo);
        }

        if (e.getSource().equals(pro.getBtnGuardarProducto())) {
            if (pro.getTxtNombre().getText().isEmpty() || pro.getTxtImagen().getText().isEmpty() || pro.getJtxtDescripcion().getText().isEmpty()){
                JOptionPane.showMessageDialog(null, "Hace Falta Informacion");
            } else {

                modpro.setNom(pro.getTxtNombre().getText());
                modpro.setDesc(pro.getJtxtDescripcion().getText());
                modpro.setImagen(modpro.convertirImagenes(modpro.getRoute()));

                if (pro.getBtnGuardarProducto().getText().equals("Guardar")) {
                    modpro.insertarProducto();
                    modpro.limpiarCasillas(pro.getJpPanelProducto().getComponents());
                } else {

                    modpro.actualizarProducto();

                    pro.setVisible(false);
                    prin.getJtPrincipal().setSelectedIndex(1);
                    modpro.mostrarTablaProducto(prin.getJtProducto(), "", "Producto");
                    pro.dispose();

                }
            }
        }

        if (e.getSource().equals(pro.getBtnCancelar())) {
            pro.dispose();
        }

    }

    public void actualizarProducto(int idpro) {
        modpro.buscarProducto(idpro);
        pro.getTxtNombre().setText(modpro.getNom());
        pro.getTxtImagen().setEnabled(false);
        pro.getJtxtDescripcion().setText(modpro.getDesc());
        pro.getLblTitulo().setText("ACTUALIZAR PRODUCTO");
        prin.setVisible(false);
        pro.setLocationRelativeTo(null);
        pro.getBtnGuardarProducto().setText("Actualizar");
        pro.setVisible(true);

        File file = new File(modpro.getRoute());
        String archivo = file.getName();
        pro.getTxtImagen().setText(archivo);
        pro.setTitle("Actualizar Producto | Ventana");
    }

    public void eliminarProducto(int idpro) {
        int resp = JOptionPane.showConfirmDialog(null, "Eliminar Producto? \n" + idpro,
                "Eliminar Producto", JOptionPane.YES_OPTION);
        if (resp == JOptionPane.YES_OPTION) {
            modpro.setIdpro(idpro);
            modpro.eliminarProducto();
            modpro.mostrarTablaProducto(prin.getJtProducto(), "", "Producto");

        }

    }

}
