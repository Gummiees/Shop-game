static class Constants {
  static final int WIDTH = 1920;
  static final int HEIGHT = 1080;
  
  static boolean setupDone = false;
  
  static String processInput(String text, int keyCode, char key) {
    if (keyCode == BACKSPACE) {
      if (text.length() > 0) {
        text = text.substring(0, text.length()-1);
      }
    } else if (keyCode == DELETE) {
      text = "";
    } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
      text = text + key;
    }
    return text;
  }
  
  static boolean mouseOverCircle(int mouseX, int mouseY, int x, int y, float diameter) {
    return (dist(mouseX, mouseY, x, y) < diameter*0.5);
  }
   
  static boolean mouseOverRect(int mouseX, int mouseY, int x, int y, int w, int h) {
    return (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h);
  }
}
