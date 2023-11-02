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

public class ControladorProducto implements ActionListener {

    Producto pro = new Producto();
    Principal prin = new Principal();
    ModeloProducto modpro = new ModeloProducto();

    public ControladorProducto() {
        pro.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        pro.getBtnBuscarImagen().addActionListener(this);
        pro.getBtnGUardarProducto().addActionListener(this);

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
        
        if (e.getSource().equals(pro.getBtnGUardarProducto())) {
           modpro.setNom(pro.getTxtNombre().getText());
           modpro.setDesc(pro.getJtxtDescripcion().getText());
           modpro.setImagen(modpro.convertirImagenes(modpro.getRoute()));
           
           modpro.insertarProducto();
        }
    }

}
