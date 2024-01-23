package de.sand.db;

import java.util.Properties;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.xml.datatype.DatatypeConfigurationException;
import de.sand.utils.PropertiesHelper;

public class DbConnection {
  private static DbConnection instance = null;
  private DbArt database;
  private Connection conn;
  private String treiber;
  private String url;
  private Properties properties;
  private DbConnection() throws DatatypeConfigurationException{
    try{
      setProperties(PropertiesHelper.setDbProperties());
      setDatabase(Integer.parseInt(properties.getProperty("dbType")));
      setTreiber();
      setUrl();
      Class.forName(treiber);
      conn = DriverManager.getConnection( getUrl(), getProperties() );
      System.setProperty("DBTYPE",database.toString());
    }catch (NumberFormatException e) {
      throw new DatatypeConfigurationException("db_type ist keine Nummer: ", e);
    } catch (IllegalArgumentException e) {
      throw new DatatypeConfigurationException(e.getMessage());
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
      throw new DatatypeConfigurationException(e.getMessage());
    } catch (SQLException e) {
      e.printStackTrace();
      throw new DatatypeConfigurationException(e.getMessage());
    }
  }
  public DbConnection getInstance() throws DatatypeConfigurationException{
    if (instance == null) {
      instance = new DbConnection();
    }
    return instance;
  }
  private void setDatabase(int dbArt){
    this.database = DbArt.getSorteFromInt(dbArt);
  }
  public DbArt getDatabase(){
    return this.database;
  }
  private void setProperties(Properties prop){
    this.properties = prop;
  }
  public Properties getProperties(){
    return this.properties;
  }
  private void setTreiber(){
    this.treiber = database.getKlasse();
  };
  public String getTreiber(){
    return this.treiber;
  }
  public Connection getConn(){
    return this.conn;
  }
  private void setUrl(){
    this.url = "jdbc:"+database.getTyp()+"//" + properties.getProperty("server")
              + ";databaseName=" + properties.getProperty("database");
  }
  public String getUrl(){
    return url;
  }
}