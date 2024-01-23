package de.sand.work;

import java.util.Properties;
import java.io.IOException;
import java.sql.Connection;

import de.sand.utils.PropertiesHelper;
import de.sand.db.DbConnector;
import de.sand.gui.StampFrame;

public class Algorithmus {
  Properties dbProperties;
  Connection conn;
  boolean gui;
  public Algorithmus (){
    init();
    setConn();
    if (conn.equals(null)){
      System.out.println("Conn is NULL");
    }else{
      System.out.println("Conn is not NULL");
    }
     @SuppressWarnings("unused")
    final StampFrame frame = new StampFrame(getGui(), this);
  }
  private void init(){
    setGui(String.valueOf(true).equalsIgnoreCase(System.getProperty("app.gui")));
    Caller.showText(PropertiesHelper.getAbout(), false);
    Caller.showText(PropertiesHelper.getDirectories(), false);
    Caller.showText(PropertiesHelper.getDbProperties(this), false);
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
  public void setConn(){
    try{
      Connection connect = DbConnector.getSQLConnection(dbProperties);
      this.conn = connect;
    }catch(IOException e){
      System.out.println(e.getMessage());
      //System.exit(0);
    }
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
