package de.sand.main;

import de.sand.work.Algorithmus;
public class myMain {
  public static void main(String[] args) {
    boolean gui= false;
    //Argumente auswerten
    if (args.length > 0) {
      for (int i = 0; i < args.length; i++) {
        if (args[i].equalsIgnoreCase("-gui")) {
          gui = true;
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
      gui = true;
    }
    initAppProperties(gui);
    @SuppressWarnings("unused")
    Algorithmus alg= new Algorithmus();
  }
  private static void initAppProperties(boolean gui){
    System.setProperty("app.version", "1.0.0");
    System.setProperty("app.name", "Briefmarken");
    System.setProperty("app.author", "Thomas Sand");
    System.setProperty("app.gui", String.valueOf(gui));
  }
}
