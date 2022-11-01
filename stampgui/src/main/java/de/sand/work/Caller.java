package de.sand.work;

import de.sand.main.myMain;
import de.sand.utils.StringHelper;
import javax.swing.JOptionPane;

public class Caller {
  public static void showText(String[][] text, boolean gui){
    if(gui ==false){
      System.out.println(StringHelper.getRepString("#", 80));
      for(int i = 0; i < text.length; i++){
        System.out.println("# "+text[i][0].concat(StringHelper.getRepString(" ", 15)).substring(0, 15)+": "+text[i][1].concat(StringHelper.getRepString(" ", 59)).substring(0,59)+" #");
      }
      System.out.println(StringHelper.getRepString("#", 80));
    }else{
      String meldung ="";
      for(int i = 0; i < text.length; i++){
        if(i>0){
          meldung = meldung + "\n";
        }
        meldung+=text[i][0].concat(": ").concat("\t\t\t")+text[i][1];
      }
      JOptionPane.showMessageDialog(null,meldung,myMain.getAppName(),JOptionPane.INFORMATION_MESSAGE);
    }
  }
}
