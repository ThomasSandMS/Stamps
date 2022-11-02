package de.sand.work;

import de.sand.main.myMain;
import de.sand.utils.StringHelper;
import javax.swing.JOptionPane;

public class Caller {
  public static void showText(String[][] text, boolean gui){
    int width1 = Integer.parseInt(System.getProperty("message.column1.widths"));
    int width2 = Integer.parseInt(System.getProperty("message.column2.widths"));
    int widthGes = Math.max(width1+width2+5, 80);
    width2 = widthGes-(width1+5);
    String message = "";
    if(gui=false){
      message = StringHelper.getRepString("#", widthGes);
    }
    for(int i = 0 ; i < text.length; i++){
      message += "\n";
      if(gui=false){
        message+= "# ";
      }
      message += text[i][0].concat(StringHelper.getRepString(" ", width1)).substring(0,width1);
      message += " ";
      message += text[i][1].concat(StringHelper.getRepString(" ", width2)).substring(0,width2);
      if(gui=false){
        message+= " #";
      }
    }
    if(gui=false){
      message += "\n";
      message = StringHelper.getRepString("#", widthGes);
    }
    if(gui ==false){
      System.out.println(message);
    }else{
      JOptionPane.showMessageDialog(null,message,myMain.getAppName(),JOptionPane.INFORMATION_MESSAGE);
    }
  }
}
