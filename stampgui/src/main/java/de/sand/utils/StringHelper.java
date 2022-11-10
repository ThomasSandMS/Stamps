package de.sand.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class StringHelper {
  public static String getRepString(String a, int n) {
    String erg = "";
    if (n > 0) {
      if (a.length() > 0) {
        for (int i = 0; i < n; i++) {
          erg += a;
        }
      }
    }
    return erg;
  }
  public static String aktuelleZeit(){
    Date jetzt = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("dd'.' 'MMMM' 'YYYY' 'hh:mm:ss");
    String erg = sdf.format(jetzt);
    return erg;
  }
}
