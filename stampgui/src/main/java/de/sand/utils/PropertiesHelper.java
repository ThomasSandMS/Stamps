package de.sand.utils;

import java.io.File;
import java.io.FileInputStream;
import java.util.Enumeration;
import java.util.Properties;
import java.util.Set;
import de.sand.work.Algorithmus;

public class PropertiesHelper {
  Properties dbProperties;
  public static String [][] getDbProperties(Algorithmus alg){
    initWidths();
    Properties dbProp = setDbProperties();
    alg.setDbProperties(dbProp);
    final Set<String> setDbProp = dbProp.stringPropertyNames();
    int anzDbProp = setDbProp.size();
    String [][] dbProperties = new String[anzDbProp][2];
    int propNum = 0;
    for (Enumeration<?> enumDbProp = dbProp.propertyNames(); enumDbProp.hasMoreElements();){
      String key =(String) enumDbProp.nextElement();
      dbProperties[propNum][0] = key;
      if(dbProperties[propNum][0].length()>Integer.parseInt(System.getProperty("message.column1.widths"))){
        System.setProperty("message.column1.widths", String.valueOf(dbProperties[propNum][0].length()));
      }
      dbProperties[propNum][1] = dbProp.getProperty(key);
      if(dbProperties[propNum][1].length()>Integer.parseInt(System.getProperty("message.column2.widths"))){
        System.setProperty("message.column2.widths", String.valueOf(dbProperties[propNum][1].length()));
      }
      propNum++;
    }
    return dbProperties;
  }
  public static String [][] getDirectories() {
    initWidths();
    setDirectories();
    String [] [] erg = new String[5][2];
    erg[0][0]="User Dir";
    erg[1][0]="MyUser Dir";
    erg[2][0]="MyOut Dir";
    erg[3][0]="Conf Dir";
    erg[4][0]="Centr Conf Dir";
    erg[0][1]=System.getProperty("user.dir");
    erg[1][1]=System.getProperty("myUser.dir");
    erg[2][1]=System.getProperty("myOut.dir") ;
    erg[3][1]=System.getProperty("config.dir");
    erg[4][1]=System.getProperty("central.config.dir");
    for (int i=0;i<erg.length;i++) {
      if (erg[i][0].length() > Integer.parseInt(System.getProperty("message.column1.widths"))){
        System.getProperty("message.column1.widths", String.valueOf(erg[i][0].length()));
      }
      if (erg[i][1].length() > Integer.parseInt(System.getProperty("message.column2.widths"))){
        System.getProperty("message.column2.widths", String.valueOf(erg[i][1].length()));
      }
    }
    return erg;
  }
  public static String [][] getAbout(){
    initWidths();
    String [] [] erg = new String[4][2];
    erg[0][0]="AppName";
    erg[1][0]="Version";
    erg[2][0]="Author";
    erg[3][0]="OS-Version";
    erg[0][1] = System.getProperty("app.name");
    erg[1][1] = System.getProperty("app.version");
    erg[2][1] = System.getProperty("app.author");
    erg[3][1] = System.getProperty("os.name");
    for (int i=0;i<erg.length;i++) {
      if (erg[i][0].length() > Integer.parseInt(System.getProperty("message.column1.widths"))){
        System.getProperty("message.column1.widths", String.valueOf(erg[i][0].length()));
      }
      if (erg[i][1].length() > Integer.parseInt(System.getProperty("message.column2.widths"))){
        System.getProperty("message.column2.widths", String.valueOf(erg[i][1].length()));
      }
    }
    return erg;
  }
  private static void setMyUserDir() {
    if (System.getProperty("myUser.dir") ==null) {
      System.setProperty("myUser.dir", System.getProperty("user.dir"));
    }
  }
  private static void setMyOutDir() {
    if (System.getProperty("myOut.dir") == null) {
      System.setProperty("myOut.dir", System.getProperty("myUser.dir"));
    }
  }
  private static void setConfigDir() {
    if (System.getProperty("config.dir") == null) {
      File myUserDir = new File(System.getProperty("myUser.dir"));
      System.setProperty("config.dir", myUserDir.getAbsolutePath() + System.getProperty("file.separator") + "config");
    }
  }
  private static void setCentralConfigDir(){
    if(System.getProperty("central.config.dir")== null){
      File myUserDir = new File(System.getProperty("myUser.dir"));
      System.setProperty("central.config.dir", myUserDir.getParentFile().getAbsolutePath()+System.getProperty("file.separator")+"centralConfig");
    }
  }
  private static void initWidths() {
    if (System.getProperty("message.column1.widths") == null) {
      System.setProperty("message.column1.widths", "0");
    }
    if (System.getProperty("message.column2.widths") == null) {
      System.setProperty("message.column2.widths", "0");
    }
  }
  public static Properties setDbProperties(){
    Properties erg = new Properties();
    FileInputStream dbProp;
    try{
      String filename = System.getProperty("central.config.dir").concat(System.getProperty("file.separator")).concat("db.config");
      if (new File(filename).isFile()){
        dbProp = new FileInputStream(filename);
        erg.load(dbProp);
        dbProp.close();
      }else{
        System.out.println("Datei nicht gefunden: "+filename);
      }
      filename = System.getProperty("config.dir").concat(System.getProperty("file.separator")).concat("db.config");
      if (new File(filename).isFile()){
        dbProp = new FileInputStream(filename);
        erg.load(dbProp);
        dbProp.close();
      }else{
        System.out.println("Datei nicht gefunden: "+filename);
      }
    }catch(Exception e){
      e.printStackTrace();
    }
    return erg;
  }
  private static void setDirectories() {
    setMyUserDir();
    setMyOutDir();
    setConfigDir();
    setCentralConfigDir();
  }
  /*

    } catch (FileNotFoundException e) {
      throw new DatatypeConfigurationException(e.getMessage());
    } catch (IOException e) {
      throw new DatatypeConfigurationException(e.getMessage());
    } catch (WrongConfigException e) {
      throw new DatatypeConfigurationException(
          "die parameter in cfg file sind nicht vollstaendig. Passwort wird nicht angezeigt!\nuser: "
              + e.getUser() + " DBTYPE: " + e.getDbType() + " hostAndPort: " + e.getHostAndPort()
              + "\n",
          e);
   *
   */
}
