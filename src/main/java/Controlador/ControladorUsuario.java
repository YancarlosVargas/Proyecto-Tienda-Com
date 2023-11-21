/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.ModeloUsuario;
import Vista.Principal;
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
    Principal prin = new Principal();

    public ControladorUsuario() {
        usu.getBtnGuardarUsuario().addActionListener(this);
        usu.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        usu.getBtnCancelar().addActionListener(this);
        usu.addWindowListener(new WindowAdapter() {
            ;
        @Override
            public void windowClosed(WindowEvent e) {
                ControladorPrincipal princ = new ControladorPrincipal();
                princ.iniciarPrincipal(0);
            }
        });
        usu.getBtnVisibilidad().addActionListener(this);
    }

    public void iniciarUsuario() {
        usu.setVisible(true);
        usu.setLocationRelativeTo(null);
        usu.setTitle("Añadir Nuevo Usuario | Ventana");

        usu.getJcbGenero().addItem("Seleccionar:");
        Map<String, Integer> dato = modusu.llenarCombo("sexo");
        for (String sexo : dato.keySet()) {
            usu.getJcbGenero().addItem(sexo);
        }

        usu.getJcbCargo().addItem("Seleccionar:");
        Map<String, Integer> datos = modusu.llenarCombo("cargo");
        for (String rol : datos.keySet()) {
            usu.getJcbCargo().addItem(rol);
        }
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == (usu.getBtnGuardarUsuario())) {
            if (usu.getCbxtipodedocumento().getSelectedItem().equals("Seleccionar:") || usu.getTxtDocumento().getText().isEmpty() || usu.getTxtNombre().getText().isEmpty() || usu.getTxtTelefono().getText().isEmpty() || usu.getTxtCorreo().getText().isEmpty() || usu.getJDFechadeNacimiento().getDate() == null || usu.getTxtDireccion().getText().isEmpty() || usu.getJcbGenero().getSelectedItem().equals("Seleccionar:") || usu.getJcbCargo().getSelectedItem().equals("Seleccionar:") || usu.getTxtLogin().getText().isEmpty() || usu.getJpClave().getText().isEmpty()) {
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

                ControladorPrincipal princ = new ControladorPrincipal();
                if (princ.validacioncorreo(modusu.getCor()) == true) {
                    if (usu.getBtnGuardarUsuario().getText().equals("Guardar")) {

                        modusu.insertarUsuario();
                        modusu.limpiarCasillas(usu.getJpPanelUsuario().getComponents());

                    } else {

                        modusu.actualizarUsuario();

                        usu.setVisible(false);
                        prin.getJtPrincipal().setSelectedIndex(1);
                        modusu.mostrarTablaUsuario(prin.getJtUsuario(), "", "usuario");
                        usu.dispose();

                    }
                }else{
                    JOptionPane.showMessageDialog(null, "Correo Invalido");
                }
            }

        }

        if (e.getSource() == (usu.getBtnCancelar())) {
            usu.dispose();
        }

        if (e.getSource() == (usu.getBtnVisibilidad())) {
            if (usu.getJpClave().getEchoChar() == '\u2022') {
                usu.getJpClave().setEchoChar((char) 0);
                usu.getBtnVisibilidad().setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/Ojo-Abierto.png")));
            } else {
                usu.getJpClave().setEchoChar('\u2022');
                usu.getBtnVisibilidad().setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/Ojo-Cerrado.png")));
            }
        }
    }

    public void actualizarUsuario(int Doc) {
        modusu.buscarUsuario(Doc);
        usu.getTxtDocumento().setEnabled(false);
        usu.getTxtDocumento().setText(String.valueOf(Doc));
        usu.getTxtLogin().setEnabled(false);
        usu.getTxtCorreo().setText(modusu.getCor());
        usu.getTxtDireccion().setText(modusu.getDir());
        usu.getTxtTelefono().setText(modusu.getTel());
        usu.getJpClave().setText(modusu.getCl());
        usu.getTxtNombre().setText(modusu.getNom());
        usu.getJDFechadeNacimiento().setDate(modusu.getFec());
        usu.getTxtLogin().setText(modusu.getLo());
        usu.getCbxtipodedocumento().setSelectedItem(modusu.getTipodedoc());

        Map<String, Integer> datos = modusu.llenarCombo("sexo");
        for (String sexo : datos.keySet()) {
            usu.getJcbGenero().addItem(sexo);
        }

        String valorSexo = modusu.obtenerSeleccion(datos, modusu.getSex());
        usu.getJcbGenero().setSelectedItem(valorSexo);

        Map<String, Integer> datosc = modusu.llenarCombo("cargo");
        for (String cargo : datosc.keySet()) {
            usu.getJcbCargo().addItem(cargo);
        }

        String valorCargo = modusu.obtenerSeleccion(datosc, modusu.getRol());
        usu.getJcbCargo().setSelectedItem(valorCargo);

        prin.setVisible(false);
        usu.getLblNuevoUsuario().setText("ACTUALIZAR USUARIO");
        usu.setLocationRelativeTo(null);
        usu.getBtnGuardarUsuario().setText("Actualizar");
        usu.setVisible(true);
        usu.setTitle("Actualizar Usuario | Ventana");

    }

    public void eliminarUsuario(int Doc) {
        int resp = JOptionPane.showConfirmDialog(null, "Eliminar Usuario? \n" + Doc,
                "Eliminar Usuario", JOptionPane.YES_OPTION);
        if (resp == JOptionPane.YES_OPTION) {
            modusu.setDoc(Doc);
            modusu.eliminarUsuario();
            modusu.mostrarTablaUsuario(prin.getJtUsuario(), "", "Usuario");

        }

    }

}
