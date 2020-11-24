static class Constants {
  static final int WIDTH = 1080;
  static final int HEIGHT = 720;
  
  static boolean setupDone = false;
  
  // Person
  static float PERSON_PERCENT = 0.01;
  static float PERSON_IN_SHOP_PERCENT = 0.25;
  static final int PERSON_BOX_SIZE = 24;
  
  // Shop
  static final int SHOP_START_EXP_REQUIRED = 1000;
  static final float SHOP_EXP_REQUIRED_FACTOR = 1.6;
  static final int SHOP_MAX_LEVEL = 10;
  static final int SHOP_WALL_HEIGHT = 480;
  static final int SHOP_WALL_WIDTH = 800;
  static final int SHOP_SMALL_WALL_WIDTH = 350;
  static final int SHOP_WALL_MARGIN_BOTTOM = 50;
  
  // Table
  static final int TABLE_START_EXP_REQUIRED = 250;
  static final float TABLE_EXP_REQUIRED_FACTOR = 1.4;
  static final int TABLE_STARTING_SIZE = 3;
  static final int TABLE_MAX_LEVEL = 7;
  static int TABLE_ID = 1;
  static final int TABLE_SIZE_W = 128;
  static final int TABLE_SIZE_H = 48;
  static final int TABLE_TEXT_SIZE = 14;
  static final int TABLE_MARGIN = 50;
  
  /*
  * Coordinates for the tables depending on the level of the shop.
  * The position + 1 is the level representing.
  * On the int[]:
  *   - 0: x
  *   - 1: y
  *   - 2: w
  *   - 3: h
  */
  static final ArrayList<int[]> tablePositions = new ArrayList<int[]>(){{
    // The bottom one
    add(new int[] { (int)((WIDTH / 2) - (TABLE_SIZE_W / 2)), (int)(HEIGHT - TABLE_MARGIN  - SHOP_WALL_MARGIN_BOTTOM - TABLE_SIZE_H), TABLE_SIZE_W, TABLE_SIZE_H });
    
    // The two around the center bottom one
    add(new int[] { (int)((Constants.WIDTH / 2) - (Constants.SHOP_WALL_WIDTH / 2) + TABLE_MARGIN), (HEIGHT - TABLE_MARGIN  - SHOP_WALL_MARGIN_BOTTOM - TABLE_SIZE_H), TABLE_SIZE_W, TABLE_SIZE_H });
    add(new int[] { (int)((Constants.WIDTH / 2) + (Constants.SHOP_WALL_WIDTH / 2) - TABLE_MARGIN - TABLE_SIZE_W), (HEIGHT - TABLE_MARGIN  - SHOP_WALL_MARGIN_BOTTOM - TABLE_SIZE_H), TABLE_SIZE_W, TABLE_SIZE_H });
    
    // The two at the top of the shop
    add(new int[] { (int)((Constants.WIDTH / 2) - (Constants.SHOP_WALL_WIDTH / 2) + TABLE_MARGIN), (HEIGHT - SHOP_WALL_MARGIN_BOTTOM - SHOP_WALL_HEIGHT + TABLE_MARGIN), TABLE_SIZE_W, TABLE_SIZE_H });
    add(new int[] { (int)((Constants.WIDTH / 2) + (Constants.SHOP_WALL_WIDTH / 2) - TABLE_MARGIN - TABLE_SIZE_W), (HEIGHT - SHOP_WALL_MARGIN_BOTTOM - SHOP_WALL_HEIGHT + TABLE_MARGIN), TABLE_SIZE_W, TABLE_SIZE_H });
    
    // The two on the middle of the shop
    add(new int[] { (int)((Constants.WIDTH / 2) - Constants.TABLE_MARGIN - TABLE_SIZE_W), (int)(((HEIGHT - SHOP_WALL_MARGIN_BOTTOM - SHOP_WALL_HEIGHT) + (SHOP_WALL_HEIGHT / 2)) - (TABLE_SIZE_H / 2)), TABLE_SIZE_W, TABLE_SIZE_H });
    add(new int[] { (int)((Constants.WIDTH / 2) + Constants.TABLE_MARGIN), (int)(((HEIGHT - SHOP_WALL_MARGIN_BOTTOM - SHOP_WALL_HEIGHT) + (SHOP_WALL_HEIGHT / 2)) - (TABLE_SIZE_H / 2)), TABLE_SIZE_W, TABLE_SIZE_H });
    
    // These two ones are "flipped", so I use the table h instead of w, and vice-versa.
    add(new int[] { (int)((Constants.WIDTH / 2) - (Constants.SHOP_WALL_WIDTH / 2) + TABLE_MARGIN),(int)(((HEIGHT - SHOP_WALL_MARGIN_BOTTOM - SHOP_WALL_HEIGHT) + (SHOP_WALL_HEIGHT / 2)) - (TABLE_SIZE_W / 2)), TABLE_SIZE_H, TABLE_SIZE_W });
    add(new int[] { (int)((Constants.WIDTH / 2) + (Constants.SHOP_WALL_WIDTH / 2) - TABLE_MARGIN - TABLE_SIZE_H), (int)(((HEIGHT - SHOP_WALL_MARGIN_BOTTOM - SHOP_WALL_HEIGHT) + (SHOP_WALL_HEIGHT / 2)) - (TABLE_SIZE_W / 2)), TABLE_SIZE_H, TABLE_SIZE_W });
  }};
  
  // Item
  static int ITEM_ID = 1;
  
  /** COMMON STATIC FUNCTIONS **/
  
  static int[] getTablePosition(int level) {
    return tablePositions.get(level - 1);
  }
  
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
    return (dist(mouseX, mouseY, x, y) < diameter * 0.5);
  }
   
  static boolean mouseOverRect(int mouseX, int mouseY, int x, int y, int w, int h) {
    return (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h);
  }
  
  static boolean isNullOrBlankSpace(String text) {
    return text == null || text.isEmpty() || text == " ";
  }
}
