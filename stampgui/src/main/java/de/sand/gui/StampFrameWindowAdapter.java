package de.sand.gui;

import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import de.sand.work.Caller;

public class StampFrameWindowAdapter extends WindowAdapter{
  public StampFrameWindowAdapter(){

  }
  @Override
  public void windowClosing(WindowEvent e) {
    Caller.exit();
  }
}
