package de.sand.utils;

import java.io.File;
import de.sand.main.myMain;

public class PropertiesHelper {
  public static void setDirectories() {
    setMyUserDir();
    setMyOutDir();
    setConfigDir();
    setCentralConfigDir();
  }

  public static String [][] getDirectories() {
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
    return erg;
  }
  public static String [][] getAbout(){
    String [] [] erg = new String[4][2];
    erg[0][0]="AppName";
    erg[1][0]="Version";
    erg[2][0]="Author";
    erg[3][0]="OS-Version";
    erg[0][1] = myMain.getAppName();
    erg[1][1] = myMain.getVersion();
    erg[2][1] = myMain.getAutor();
    erg[3][1] = System.getProperty("os.name");
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
      System.setProperty("central.config.dir", myUserDir.getParentFile().getAbsolutePath()+System.getProperty("file.separator")+"config");
    }
  }
}
