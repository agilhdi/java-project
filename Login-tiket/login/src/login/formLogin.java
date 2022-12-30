package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

/**
 *
 * @author DanangSk
 */
public class formLogin extends javax.swing.JFrame {
    Connection kon;
    ResultSet rs;
    PreparedStatement pst;
    Statement st;

    public formLogin() {
        initComponents();
    }
    
    public void cek(){
        kon = koneksi.koneksiDb();
        
        try {
            st = kon.createStatement();
            String sql = "SELECT * FROM login where username = '"+input_username.getText()+"' and password = '"+input_password.getText()+"'";
            rs = st.executeQuery(sql);
            
            if(rs.next()){
                if(rs.getString("role").equals("administrator")){
                    administrator fa = new administrator();
                    fa.show();
                    this.dispose();
                }else if(rs.getString("role").equals("costumer")){
                    costumer fu = new costumer();
                    fu.show();
                    this.dispose();
                }else if(rs.getString("role").equals("manajemen")){
                    manajemen fu = new manajemen();
                    fu.show();
                    this.dispose();
                }
            }else{
                JOptionPane.showMessageDialog(null, "Maaf password atau username yang anda masukan salah!");
                input_username.setText("");
                input_password.setText("");
                input_username.requestFocus();
            }
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, e);
        }
    }
    
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        tombol_login = new javax.swing.JButton();
        tombol_reset = new javax.swing.JButton();
        input_username = new javax.swing.JTextField();
        input_password = new javax.swing.JPasswordField();
        label_username = new javax.swing.JLabel();
        label_password = new javax.swing.JLabel();
        judul_halaman = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        tombol_login.setText("Login");
        tombol_login.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tombol_loginActionPerformed(evt);
            }
        });

        tombol_reset.setText("Reset");
        tombol_reset.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tombol_resetActionPerformed(evt);
            }
        });

        input_password.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                input_passwordActionPerformed(evt);
            }
        });

        label_username.setText("Username");

        label_password.setText("Password");

        judul_halaman.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        judul_halaman.setText("Login dulu okehhh");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap(101, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(label_username)
                    .addComponent(label_password))
                .addGap(49, 49, 49)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(input_username, javax.swing.GroupLayout.PREFERRED_SIZE, 107, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(input_password, javax.swing.GroupLayout.PREFERRED_SIZE, 107, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(95, 95, 95))
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(125, 125, 125)
                        .addComponent(judul_halaman))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(105, 105, 105)
                        .addComponent(tombol_login, javax.swing.GroupLayout.PREFERRED_SIZE, 87, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(tombol_reset, javax.swing.GroupLayout.PREFERRED_SIZE, 87, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(62, Short.MAX_VALUE)
                .addComponent(judul_halaman)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(label_username)
                    .addComponent(input_username, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(input_password, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(label_password))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(tombol_login)
                    .addComponent(tombol_reset))
                .addGap(109, 109, 109))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void tombol_loginActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_tombol_loginActionPerformed
        cek();
    }//GEN-LAST:event_tombol_loginActionPerformed

    private void tombol_resetActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_tombol_resetActionPerformed
        input_username.setText("");
                input_password.setText("");
                input_username.requestFocus();
    }//GEN-LAST:event_tombol_resetActionPerformed

    private void input_passwordActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_input_passwordActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_input_passwordActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPasswordField input_password;
    private javax.swing.JTextField input_username;
    private javax.swing.JLabel judul_halaman;
    private javax.swing.JLabel label_password;
    private javax.swing.JLabel label_username;
    private javax.swing.JButton tombol_login;
    private javax.swing.JButton tombol_reset;
    // End of variables declaration//GEN-END:variables
}
