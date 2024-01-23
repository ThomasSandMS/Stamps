package de.sand.gui;

import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;
import javax.swing.Action;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;

import de.sand.utils.PropertiesHelper;
import de.sand.work.Algorithmus;
import de.sand.work.Caller;

public class StampMenuBar extends JMenuBar{
  private JMenuItem jmi;
  private Algorithmus alg;
  private String appName = System.getProperty("app.name");
  private boolean gui;
  public StampMenuBar(StampFrame frame){
    alg = frame.getAlg();
    gui =alg.getGui();
    this.add(menuDB());
    this.add(menuAbout());
  }
  private JMenu menuDB(){
    JMenu db = new JMenu("Datenbank");
    jmi = db.add(new JMenuItem(actionDbParam()));
    jmi.setText("DB Parameter");
    jmi = db.add(new JMenuItem(actionConnect()));
    jmi.setText("DB verbinden");
    jmi = db.add(new JMenuItem(actionDisconnect()));
    jmi.setText("DB trennen");
    jmi = db.add(new JMenuItem(actionEnd()));
    jmi.setText(appName.concat(" beenden"));
    return db;
  }
  private JMenu menuAbout() {
    JMenu about = new JMenu(appName);
    jmi = about.add(new JMenuItem(actionAbout()));
    jmi.setText("über " + appName);
    jmi = about.add(new JMenuItem(actionDirectories()));
    jmi.setText("Pfade "+ appName);
    return about;
  }
  private Action actionConnect(){
    Action erg = new AbstractAction() {
      @Override
      public void actionPerformed(ActionEvent e) {
        Caller.connect();;
      };
    } ;
    return erg;
  }
  private Action actionDisconnect(){
    Action erg = new AbstractAction() {
      @Override
      public void actionPerformed(ActionEvent e) {
        Caller.disConnect();
      };
    } ;
    return erg;
  }
  private Action actionEnd(){
    Action erg = new AbstractAction() {
      @Override
      public void actionPerformed(ActionEvent e) {
        Caller.exit();;
      };
    } ;
    return erg;
  }
  private Action actionAbout(){
    Action erg = new AbstractAction() {
      @Override
      public void actionPerformed(ActionEvent e) {
        Caller.showText(PropertiesHelper.getAbout(), gui);;
      }
    };
    return erg;
  }
  private Action actionDirectories(){
    Action erg = new AbstractAction() {
      @Override
      public void actionPerformed(ActionEvent e) {
        Caller.showText(PropertiesHelper.getDirectories(), gui);;
      }
    };
    return erg;
  }
   private Action actionDbParam(){
    Action erg = new AbstractAction() {
      @Override
      public void actionPerformed(ActionEvent e) {
        Caller.showText(PropertiesHelper.getDbProperties(alg), gui);;
      }
    };
    return erg;
  }
}
