package de.sand.gui;

import java.awt.event.WindowAdapter;

import javax.swing.JFrame;
import javax.swing.JMenuBar;

import de.sand.work.Algorithmus;

public class StampFrame extends JFrame {
  public static boolean processRunning = false;
  private Algorithmus alg;
  private WindowAdapter wa;
  public JMenuBar hMB;
  private StampPanel jp;
  private String importArt ="";
  private String sql = "";

  public StampFrame(boolean gui, Algorithmus algorithmus){
    initWindow(gui, algorithmus);
  }
  public void setImportart(String importart){
    this.importArt = importart;
  }
  public void setSql(String sql){
    this.sql = sql;
  }
  public String getImportart(){
    return this.importArt;
  }
  public String getSql(){
    return this.sql;
  }
  private void initWindow(boolean gui, Algorithmus algorithmus){
    setAlg(algorithmus);
    setWindowAdapter();
    setAttributes();
    setMenuBar();
    setGui(gui);
    setPanel();
  }
  private void setWindowAdapter(){
    setWA(new StampFrameWindowAdapter());
    setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
    setFocusable(true);
    addWindowListener(getWA());
  }
  private void setAttributes(){
    String appName = System.getProperty("app.name");
    String version = System.getProperty("app.version");
    setTitle(appName.concat(" ").concat(version));
    setSize(1200,1000);
    setLocationRelativeTo(null);
  }
  private void setMenuBar(){
    this.hMB = new StampMenuBar(this);
    setJMenuBar(this.hMB);
  }
  private void setGui(boolean gui){
    setVisible(gui);
  }
  private void setPanel(){
    jp = new StampPanel(this);
    add(jp);
  }
  private void setWA(WindowAdapter wa){
    this.wa = wa;
  }
  private WindowAdapter getWA(){
    return wa;
  }
  private void setAlg(Algorithmus algoritmus){
    this.alg = algoritmus;
  }
  public Algorithmus getAlg(){
    return this.alg;
  }
}
