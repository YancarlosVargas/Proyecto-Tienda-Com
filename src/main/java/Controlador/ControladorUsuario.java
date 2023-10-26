/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.ModeloUsuario;
import Vista.Usuario;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Date;
import java.util.Map;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

/**
 *
 * @author HuevosFundidos
 */
public class ControladorUsuario implements ActionListener {

    Usuario usu = new Usuario();
    ModeloUsuario modusu = new ModeloUsuario();

    public ControladorUsuario() {
        usu.getBtnGuardarUsuario().addActionListener(this);
        usu.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        usu.addWindowListener(new WindowAdapter() {
            ;
        public void windowClosed(WindowEvent e) {
                ControladorPrincipal princ = new ControladorPrincipal();
                princ.iniciarPrincipal();
            }
        });
        usu.getBtnVisibilidad().addActionListener(this);
    }

    public void iniciarUsuario() {
        usu.setVisible(true);
        usu.setLocationRelativeTo(null);
        usu.setTitle("Añadir Nuevo Usuario | Ventana");

        usu.getJcbGenero().addItem("Seleccione...");
        Map<String, Integer> dato = modusu.llenarCombo("sexo");
        for (String sexo : dato.keySet()) {
            usu.getJcbGenero().addItem(sexo);
        }

        usu.getJcbCargo().addItem("Seleccione...");
        Map<String, Integer> datos = modusu.llenarCombo("cargo");
        for (String rol : datos.keySet()) {
            usu.getJcbCargo().addItem(rol);
        }
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == (usu.getBtnGuardarUsuario())) {

            if (usu.getTxtDocumento().getText().isEmpty() || (usu.getJcbGenero().getSelectedItem().equals("Seleccione...") || (usu.getTxtNombre().getText().isEmpty()) || (usu.getTxtTelefono().getText().isEmpty()) || (usu.getTxtCorreo().getText().isEmpty()) || (usu.getTxtDireccion().getText().isEmpty() || (usu.getTxtLogin().getText().isEmpty() || (usu.getJpClave().getPassword() == null || (usu.getJcbCargo().getSelectedItem().equals("Seleccione..."))) || (usu.getJDFechadeNacimiento().getDate() == null)))) || (usu.getCbxtipodedocumento().getSelectedItem().equals("Seleccionar:"))) {
                JOptionPane.showMessageDialog(null, "Hace Falta Informacion");
            } else {
                JOptionPane.showMessageDialog(null, "Exito");
                String valorSexo = usu.getJcbGenero().getSelectedItem().toString();
                String valorCargo = usu.getJcbCargo().getSelectedItem().toString();
                int sexo = modusu.llenarCombo("sexo").get(valorSexo);
                int cargo = modusu.llenarCombo("cargo").get(valorCargo);
                java.util.Date fec = usu.getJDFechadeNacimiento().getDate();
                long fe = fec.getTime();
                java.sql.Date fecha = new Date(fe);

                char[] contra = usu.getJpClave().getPassword();
                String contrasena = String.valueOf(contra);

                modusu.setDoc(Integer.parseInt(usu.getTxtDocumento().getText()));
                modusu.setNom(usu.getTxtNombre().getText());
                modusu.setFec(fecha);
                modusu.setDir(usu.getTxtDireccion().getText());
                modusu.setTecl(usu.getTxtTelefono().getText());
                modusu.setCor(usu.getTxtCorreo().getText());
                modusu.setLo(usu.getTxtLogin().getText());
                modusu.setCl(contrasena);
                modusu.setSex(sexo);
                modusu.setRol(cargo);
                modusu.setTipodedoc(usu.getCbxtipodedocumento().getSelectedItem().toString());

                modusu.insertarUsuario();
                modusu.limpiarCasillas(usu.getJpPanelUsuario().getComponents());
            }
        }

        if (e.getSource() == (usu.getBtnVisibilidad())) {
            if (usu.getJpClave().getEchoChar() == '\u2022') {
                usu.getJpClave().setEchoChar((char) 0);
                usu.getBtnVisibilidad().setIcon(new javax.swing.ImageIcon(
                        getClass().getResource("/img/Ojo-Abierto.png")));
            } else {
                usu.getJpClave().setEchoChar('\u2022');
                usu.getBtnVisibilidad().setIcon(new javax.swing.ImageIcon(
                        getClass().getResource("/img/Ojo-Cerrado.png")));
            }
        }

    }

    void actualizarUsuario(int Doc) {
        modusu.buscarUsuario(Doc);
        usu.getTxtDocumento().setEnabled(false);
        usu.getTxtDocumento().setText(String.valueOf(Doc));
        usu.getTxtLogin().setEnabled(false);
        usu.getCbxtipodedocumento().setEnabled(false);
        usu.getTxtCorreo().setText(modusu.getCor());
        usu.getTxtDireccion().setText(modusu.getDir());
        usu.getTxtTelefono().setText(modusu.getTel());
        usu.getJpClave().setText(modusu.getCl());
        usu.getTxtNombre().setText(modusu.getNom());
        usu.getJDFechadeNacimiento().setDate(modusu.getFec());
        usu.getLblNuevoUsuario().setText("ACTUALIZAR USUARIO");
        usu.getBtnGuardarUsuario().setText("Actualizar");
        
        
        Map <String, Integer> datos = modusu.llenarCombo("sexo");
        for(String sexo : datos.keySet()){
            usu.getJcbGenero().addItem(sexo);
        }
        
        String valorSexo = modusu.obtenerSeleccion(datos, modusu.getSex());
        usu.getJcbGenero().setSelectedItem(valorSexo);
       
        Map <String, Integer> datosc = modusu.llenarCombo("cargo");
        for(String cargo : datosc.keySet()){
            usu.getJcbCargo().addItem(cargo);
        }
        
        String valorCargo = modusu.obtenerSeleccion(datosc, modusu.getRol());
        usu.getJcbCargo().setSelectedItem(valorCargo);
        
        usu.getCbxtipodedocumento().setSelectedItem(modusu.getTipodedoc());
        
        
    }

}