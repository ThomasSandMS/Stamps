package de.sand.main;

import de.sand.utils.PropertiesHelper;
import de.sand.work.Caller;
import de.sand.gui.StampFrame;

public class myMain {

  static boolean gui;
  public static void main(String[] args) {
    if (args.length > 0) {
      setGui(false);
      for (int i = 0; i < args.length; i++) {
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
    Caller.showText(PropertiesHelper.getAbout(), false);
    Caller.showText(PropertiesHelper.getDirectories(), false);
    Caller.showText(PropertiesHelper.getDbProperties(), false);
    @SuppressWarnings("unused")
    final StampFrame frame = new StampFrame(getGui());
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

  public static boolean getGui(){
    return gui;
  }

  private static void setGui(boolean inGui){
    gui = inGui;
  }

}
