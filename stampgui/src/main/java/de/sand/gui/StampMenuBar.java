package de.sand.gui;

import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;
import javax.swing.Action;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;

import de.sand.main.myMain;
import de.sand.utils.PropertiesHelper;
import de.sand.work.Caller;

public class StampMenuBar extends JMenuBar{
  private StampFrame parentFrame;
  private JMenuItem jmi;

  public StampMenuBar(StampFrame frame){
    setParentFrame(frame);
    this.add(menuEnd());
  }
  private JMenu menuEnd() {
    JMenu end = new JMenu(myMain.getAppName());
    jmi = end.add(new JMenuItem(actionAbout()));
    jmi.setText("über " + myMain.getAppName());
    jmi = end.add(new JMenuItem(actionDirectories()));
    jmi.setText("Pfade "+ myMain.getAppName());
    jmi = end.add(new JMenuItem(actionEnd()));
    jmi.setText(myMain.getAppName().concat(" beenden"));
    return end;
  }
  private Action actionEnd(){
    Action erg = new AbstractAction() {
      @Override
      public void actionPerformed(ActionEvent e) {
        Caller.exit();;
      };
    } ;
    return erg;
  }
  private Action actionAbout(){
    Action erg = new AbstractAction() {
      @Override
      public void actionPerformed(ActionEvent e) {
        Caller.showText(PropertiesHelper.getAbout(), myMain.getGui());;
      }
    };
    return erg;
  }
  private Action actionDirectories(){
    Action erg = new AbstractAction() {
      @Override
      public void actionPerformed(ActionEvent e) {
        Caller.showText(PropertiesHelper.getDirectories(), myMain.getGui());;
      }
    };
    return erg;
  }
  public StampFrame getParentFrame(){
    return parentFrame;
  }
  private void setParentFrame(StampFrame frame){
    this.parentFrame = frame;
  }
}
