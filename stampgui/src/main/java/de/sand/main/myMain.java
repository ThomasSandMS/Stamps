package de.sand.main;

import de.sand.utils.PropertiesHelper;
import de.sand.work.Caller;

public class myMain {

    static boolean gui = false;
    static boolean vers = false;
  public static void main(String[] args) {
    if (args.length > 0) {
      for (int i = 0; i < args.length; i++) {
        if (args[i].equalsIgnoreCase("-vers")) {
          setVers(true);
        }
        if (args[i].equalsIgnoreCase("-gui")) {
          setGui(true);
        }
        if (args[i].equalsIgnoreCase("-pfad")) {
          System.setProperty("myUser.dir", args[i + 1]);
        }
        if (args[i].equalsIgnoreCase("-pfadAus")) {
          System.setProperty("myOut.dir", args[i + 1]);
        }
        if (args[i].equalsIgnoreCase("-pfadK")) {
          System.setProperty("config.dir", args[i + 1]);
        }
        if (args[i].equalsIgnoreCase("-pfadD")) {
          System.setProperty("central.config.dir", args[i + 1]);
        }
      }

    } else {
      setGui(true);
    }
    PropertiesHelper.setDirectories();
    if(getVers()==true){
      Caller.showText(PropertiesHelper.getAbout(), getGui());
    }
    Caller.showText(PropertiesHelper.getDirectories(), getGui());
  }

  public static String getVersion() {
    return "1.0.0";
  }

  public static String getAppName() {
    return "STAMPS GUI";
  }

  public static String getAutor() {
    return "Thomas Sand";
  }

  private static void setVers(boolean inVers){
    vers = inVers;
  }
  private static boolean getVers(){
    return vers;
  }
  private static void setGui(boolean inGui){
    gui = inGui;
  }
  private static boolean getGui(){
    return gui;
  }
}
