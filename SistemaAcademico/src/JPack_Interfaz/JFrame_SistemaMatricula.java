package JPack_Interfaz;

import static JPack_Interfaz.JFrame_SistemaMatricula.Ventana;
import Conexion.ImagenFondo;
import java.util.Calendar;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Raymundo
 */
public class JFrame_SistemaMatricula extends javax.swing.JFrame {

    /**
     * Creates new form panel_control
     */
    public JFrame_SistemaMatricula() 
    {
        initComponents();
        Ventana.setBorder(new ImagenFondo());
        this.setExtendedState(JFrame_SistemaMatricula.MAXIMIZED_BOTH);
        
        //Mostrar la Fecha y Hora en el Sistema 
        Calendar cal=Calendar.getInstance();
        String fecha=cal.get(Calendar.DATE)+"/"+cal.get(Calendar.MONTH)+"/"+cal.get(cal.YEAR);
        String hora=cal.get(cal.HOUR_OF_DAY)+":"+cal.get(Calendar.MINUTE)+":"+cal.get(cal.SECOND); 
        this.lblfecha.setText(fecha); 
        this.lblhora.setText(hora);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        Ventana = new javax.swing.JDesktopPane();
        jPanel_HorayFecha = new javax.swing.JPanel();
        lblfecha = new javax.swing.JLabel();
        jLabel_Hora = new javax.swing.JLabel();
        lblhora = new javax.swing.JLabel();
        jLabel_Fecha = new javax.swing.JLabel();
        jLabel_Bienvenidos = new javax.swing.JLabel();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu_Registro = new javax.swing.JMenu();
        jMenuItem_EscuelaAcademica = new javax.swing.JMenuItem();
        jMenuItem_Docentes = new javax.swing.JMenuItem();
        jMenuItem_Alumnos = new javax.swing.JMenuItem();
        jMenuItem_Asignatura = new javax.swing.JMenuItem();
        jMenu_Matricula = new javax.swing.JMenu();
        jMenuItem1 = new javax.swing.JMenuItem();
        jMenu_EscuelaProfesional = new javax.swing.JMenu();
        jMenu_Alumnos = new javax.swing.JMenu();
        jMenu_Docentes = new javax.swing.JMenu();
        jMenuItem_DocentesEscuelaProf = new javax.swing.JMenuItem();
        jMenu_Asignaturas = new javax.swing.JMenu();
        jMenu_Reportes = new javax.swing.JMenu();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("UNIVERSIDAD NACIONAL MICAELA BASTIDAS DE APURIMAC");
        setBackground(new java.awt.Color(204, 204, 204));

        Ventana.setAutoscrolls(true);

        jPanel_HorayFecha.setBackground(java.awt.SystemColor.controlHighlight);
        jPanel_HorayFecha.setFont(new java.awt.Font("Calibri Light", 0, 14)); // NOI18N

        lblfecha.setFont(new java.awt.Font("Calibri Light", 0, 14)); // NOI18N
        lblfecha.setText("       00/00/00  ");

        jLabel_Hora.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel_Hora.setText(" Hora: ");

        lblhora.setFont(new java.awt.Font("Calibri Light", 0, 14)); // NOI18N
        lblhora.setText("  00/00/00   ");

        jLabel_Fecha.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel_Fecha.setText(" Fecha: ");

        jLabel_Bienvenidos.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        jLabel_Bienvenidos.setText(" Bienvenidos ");

        javax.swing.GroupLayout jPanel_HorayFechaLayout = new javax.swing.GroupLayout(jPanel_HorayFecha);
        jPanel_HorayFecha.setLayout(jPanel_HorayFechaLayout);
        jPanel_HorayFechaLayout.setHorizontalGroup(
            jPanel_HorayFechaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel_HorayFechaLayout.createSequentialGroup()
                .addGap(18, 18, 18)
                .addComponent(jLabel_Bienvenidos)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 312, Short.MAX_VALUE)
                .addComponent(jLabel_Fecha)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(lblfecha, javax.swing.GroupLayout.PREFERRED_SIZE, 93, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel_Hora)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(lblhora, javax.swing.GroupLayout.PREFERRED_SIZE, 82, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        jPanel_HorayFechaLayout.setVerticalGroup(
            jPanel_HorayFechaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel_HorayFechaLayout.createSequentialGroup()
                .addGroup(jPanel_HorayFechaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lblfecha)
                    .addComponent(jLabel_Hora)
                    .addComponent(lblhora)
                    .addComponent(jLabel_Fecha)
                    .addComponent(jLabel_Bienvenidos))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jMenuBar1.setBackground(java.awt.SystemColor.controlHighlight);
        jMenuBar1.setFont(new java.awt.Font("Calibri Light", 2, 18)); // NOI18N

        jMenu_Registro.setText("Registro");
        jMenu_Registro.setFont(new java.awt.Font("Calibri Light", 0, 18)); // NOI18N

        jMenuItem_EscuelaAcademica.setFont(new java.awt.Font("Calibri Light", 0, 14)); // NOI18N
        jMenuItem_EscuelaAcademica.setText("Escuela Academica");
        jMenuItem_EscuelaAcademica.setActionCommand("");
        jMenuItem_EscuelaAcademica.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem_EscuelaAcademicaActionPerformed(evt);
            }
        });
        jMenu_Registro.add(jMenuItem_EscuelaAcademica);

        jMenuItem_Docentes.setFont(new java.awt.Font("Calibri Light", 0, 14)); // NOI18N
        jMenuItem_Docentes.setText("Docentes");
        jMenuItem_Docentes.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem_DocentesActionPerformed(evt);
            }
        });
        jMenu_Registro.add(jMenuItem_Docentes);

        jMenuItem_Alumnos.setFont(new java.awt.Font("Calibri Light", 0, 14)); // NOI18N
        jMenuItem_Alumnos.setText("Alumnos");
        jMenuItem_Alumnos.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem_AlumnosActionPerformed(evt);
            }
        });
        jMenu_Registro.add(jMenuItem_Alumnos);

        jMenuItem_Asignatura.setFont(new java.awt.Font("Calibri Light", 0, 14)); // NOI18N
        jMenuItem_Asignatura.setText("Asignaturas");
        jMenuItem_Asignatura.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem_AsignaturaActionPerformed(evt);
            }
        });
        jMenu_Registro.add(jMenuItem_Asignatura);

        jMenuBar1.add(jMenu_Registro);

        jMenu_Matricula.setText("Matricula");
        jMenu_Matricula.setFont(new java.awt.Font("Calibri Light", 0, 18)); // NOI18N

        jMenuItem1.setText("Alumnos Matriculados");
        jMenuItem1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem1ActionPerformed(evt);
            }
        });
        jMenu_Matricula.add(jMenuItem1);

        jMenuBar1.add(jMenu_Matricula);

        jMenu_EscuelaProfesional.setText("Escuela Profesional");
        jMenu_EscuelaProfesional.setFont(new java.awt.Font("Calibri Light", 0, 18)); // NOI18N
        jMenuBar1.add(jMenu_EscuelaProfesional);

        jMenu_Alumnos.setText("Alumnos");
        jMenu_Alumnos.setFont(new java.awt.Font("Calibri Light", 0, 18)); // NOI18N
        jMenuBar1.add(jMenu_Alumnos);

        jMenu_Docentes.setText("Docentes");
        jMenu_Docentes.setFont(new java.awt.Font("Calibri Light", 0, 18)); // NOI18N

        jMenuItem_DocentesEscuelaProf.setText("Docentes por Escuela Prof.");
        jMenu_Docentes.add(jMenuItem_DocentesEscuelaProf);

        jMenuBar1.add(jMenu_Docentes);

        jMenu_Asignaturas.setText("Asignaturas");
        jMenu_Asignaturas.setFont(new java.awt.Font("Calibri Light", 0, 18)); // NOI18N
        jMenuBar1.add(jMenu_Asignaturas);

        jMenu_Reportes.setText("Reportes");
        jMenu_Reportes.setFont(new java.awt.Font("Calibri Light", 0, 18)); // NOI18N
        jMenuBar1.add(jMenu_Reportes);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel_HorayFecha, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(Ventana)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(Ventana, javax.swing.GroupLayout.DEFAULT_SIZE, 445, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel_HorayFecha, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jMenuItem_EscuelaAcademicaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem_EscuelaAcademicaActionPerformed
        // TODO add your handling code here:
        JInternalFrame_RegistroEscuelaProf REP=new JInternalFrame_RegistroEscuelaProf();
        Ventana.add(REP);
        REP.show();
    }//GEN-LAST:event_jMenuItem_EscuelaAcademicaActionPerformed

    private void jMenuItem_DocentesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem_DocentesActionPerformed
        // TODO add your handling code here:
        JInternalFrame_RegistrosDocentes RD=new JInternalFrame_RegistrosDocentes();
        Ventana.add(RD);
        RD.show();
    }//GEN-LAST:event_jMenuItem_DocentesActionPerformed

    private void jMenuItem_AlumnosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem_AlumnosActionPerformed
        // TODO add your handling code here:
        JInternalFrame_RegistroAlumnoss RA=new JInternalFrame_RegistroAlumnoss();
        Ventana.add(RA);
        RA.show();
    }//GEN-LAST:event_jMenuItem_AlumnosActionPerformed

    private void jMenuItem_AsignaturaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem_AsignaturaActionPerformed
        // TODO add your handling code here:
        JInternalFrame_RegistroAsignatura RAsig=new JInternalFrame_RegistroAsignatura();
        Ventana.add(RAsig);
        RAsig.show();
    }//GEN-LAST:event_jMenuItem_AsignaturaActionPerformed

    private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem1ActionPerformed
        // TODO add your handling code here:
        JInternalFrame_AlumnosMatriculados ALM=new JInternalFrame_AlumnosMatriculados();
        Ventana.add(ALM);
        ALM.show();
    }//GEN-LAST:event_jMenuItem1ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(JFrame_SistemaMatricula.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(JFrame_SistemaMatricula.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(JFrame_SistemaMatricula.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(JFrame_SistemaMatricula.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new JFrame_SistemaMatricula().setVisible(true);
            }
        });
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    public static javax.swing.JDesktopPane Ventana;
    private javax.swing.JLabel jLabel_Bienvenidos;
    private javax.swing.JLabel jLabel_Fecha;
    private javax.swing.JLabel jLabel_Hora;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem_Alumnos;
    private javax.swing.JMenuItem jMenuItem_Asignatura;
    private javax.swing.JMenuItem jMenuItem_Docentes;
    private javax.swing.JMenuItem jMenuItem_DocentesEscuelaProf;
    private javax.swing.JMenuItem jMenuItem_EscuelaAcademica;
    private javax.swing.JMenu jMenu_Alumnos;
    private javax.swing.JMenu jMenu_Asignaturas;
    private javax.swing.JMenu jMenu_Docentes;
    private javax.swing.JMenu jMenu_EscuelaProfesional;
    private javax.swing.JMenu jMenu_Matricula;
    private javax.swing.JMenu jMenu_Registro;
    private javax.swing.JMenu jMenu_Reportes;
    private javax.swing.JPanel jPanel_HorayFecha;
    private javax.swing.JLabel lblfecha;
    private javax.swing.JLabel lblhora;
    // End of variables declaration//GEN-END:variables
}
