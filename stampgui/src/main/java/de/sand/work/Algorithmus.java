package de.sand.work;

import java.util.Properties;
import java.sql.Connection;

import de.sand.utils.PropertiesHelper;
import de.sand.gui.StampFrame;

public class Algorithmus {
  Properties dbProperties;
  Connection conn;
  boolean gui;
  public Algorithmus (){
    init();
  }
  private void init(){
    setGui(String.valueOf(true).equalsIgnoreCase(System.getProperty("app.gui")));
    Caller.showText(PropertiesHelper.getAbout(), false);
    Caller.showText(PropertiesHelper.getDirectories(), false);
    Caller.showText(PropertiesHelper.getDbProperties(this), false);
    @SuppressWarnings("unused")
    final StampFrame frame = new StampFrame(getGui(), this);
  }
  public void setDbProperties(Properties prop){
    this.dbProperties = prop;
  }
  public Properties getDbProperties(){
    return this.dbProperties;
  }
  public void setConn(Connection connection){
    this.conn = connection;
  }
  public Connection getConn(){
    return this.conn;
  }
  private void setGui(boolean inGui){
    this.gui = inGui;
  }
  public boolean getGui(){
    return this.gui;
  }
}
