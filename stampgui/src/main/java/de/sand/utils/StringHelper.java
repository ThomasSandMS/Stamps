package de.sand.utils;

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
}
