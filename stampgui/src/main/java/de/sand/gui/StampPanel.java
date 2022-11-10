package de.sand.gui;

import javax.swing.BorderFactory;
import javax.swing.border.TitledBorder;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

import java.awt.Color;
import java.awt.Font;
import java.awt.Component;
import java.awt.Container;
import java.awt.GridBagLayout;
import java.awt.GridBagConstraints;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import de.sand.work.Caller;

public class StampPanel extends JPanel{
  JLabel labelSql, labelImportart;
  JButton buttonDoSql;
  JTextField textSql, textImportart;
  final StampFrame PF;

  public StampPanel(final StampFrame parentFrame) {
    this.PF = parentFrame;
    labelSql = new JLabel("SQL-Statements");
    labelImportart = new JLabel("Import aus:");

    textSql = new JTextField();
    textImportart = new JTextField();
    textSql.getDocument().addDocumentListener(dlSql());
    textImportart.getDocument().addDocumentListener(dlImportart());

    buttonDoSql = new JButton("exportieren");
    buttonDoSql.addActionListener(alDoSql());
    this.setBorder(new TitledBorder(BorderFactory.createMatteBorder(1,1,0,0,Color.BLUE),"Einstellungen : ",TitledBorder.LEFT,PF.getDefaultCloseOperation(),new Font(Font.SERIF, Font.ITALIC,20),Color.BLUE));
    GridBagLayout gbl = new GridBagLayout();
    this.setLayout(gbl);
    addComponent(this,gbl,labelSql,0,1,1,1,0,0);
    addComponent(this,gbl,textSql,2,1,2,1,0,0);
    addComponent(this,gbl,labelImportart,0,2,1,1,0,0);
    addComponent(this,gbl,textImportart,2,2,2,1,0,0);
    addComponent(this,gbl,buttonDoSql,2,3,1,1,0,0);
    setCompVisible(false);
    initValues();
    setCompVisible(true);
  }
  private ActionListener alDoSql(){
    ActionListener erg = new ActionListener(){
      @Override
      public void actionPerformed(ActionEvent e) {
        Caller.export(PF.getImportart());
      }
    };
    return erg;
  }
  private DocumentListener dlSql(){
    DocumentListener erg = new DocumentListener(){
      @Override
      public void insertUpdate(DocumentEvent e) {
        PF.setSql(textSql.getText());
      }
      @Override
      public void removeUpdate(DocumentEvent e) {
        PF.setSql(textSql.getText());
      }
      @Override
      public void changedUpdate(DocumentEvent e) {
        PF.setSql(textSql.getText());
      }
    };
    return erg;
  }
  private DocumentListener dlImportart(){
    DocumentListener erg = new DocumentListener(){
      @Override
      public void insertUpdate(DocumentEvent e) {
        PF.setSql(textImportart.getText());
      }
      @Override
      public void removeUpdate(DocumentEvent e) {
        PF.setSql(textImportart.getText());
      }
      @Override
      public void changedUpdate(DocumentEvent e) {
        PF.setSql(textImportart.getText());
      }
    };
    return erg;
  }
  private void initValues(){
    textSql.setText(PF.getSql());
    textImportart.setText(PF.getImportart());
  }
  private void setCompVisible(boolean vis){
    labelSql.setVisible(vis);
    labelImportart.setVisible(vis);
    textSql.setVisible(vis);
    textImportart.setVisible(vis);
    buttonDoSql.setVisible(vis);
  }
  static void addComponent(Container cont, GridBagLayout gbl, Component c, int x, int y, int width, int height, double weightx, double weighty){
    GridBagConstraints gbc = new GridBagConstraints();
    gbc.fill = GridBagConstraints.BOTH;
    gbc.gridx = x;
    gbc.gridy = y;
    gbc.weightx = weightx;
    gbc.weighty = weighty;
    gbc.gridwidth = width;
    gbc.gridheight = height;
    gbl.setConstraints(c, gbc);
    cont.add(c);
  }
}
