static class Constants {
  static final int WIDTH = 1080;
  static final int HEIGHT = 720;
  
  static boolean setupDone = false;
  
  // Inventory
  static final float INVENTORY_RANDOM_ITEM_CHANCES = 0.5;
  static final float INVENTORY_CHANCES_RARITY_1 = 1;
  static final float INVENTORY_CHANCES_RARITY_2 = 0.75;
  static final float INVENTORY_CHANCES_RARITY_3 = 0.5;
  static final float INVENTORY_CHANCES_RARITY_4 = 0.25;
  static final float INVENTORY_CHANCES_RARITY_5 = 0.1;
  
  // Person
  static int PERSON_ID = 1;
  static final int PERSON_MONEY_START = 1000;
  static final int PERSON_BOX_SIZE = 24;
  static float PERSON_IN_SHOP_PERCENT = 0.25;
  
  // Shop
  static final int SHOP_START_EXP_REQUIRED = 1000;
  static final float SHOP_EXP_REQUIRED_FACTOR = 1.6;
  static final int SHOP_MAX_LEVEL = 10;
  static final int SHOP_WALL_HEIGHT = 480;
  static final int SHOP_WALL_WIDTH = 800;
  static final int SHOP_SMALL_WALL_WIDTH = 350;
  static final int SHOP_WALL_MARGIN_BOTTOM = 50;
  
  // Table
  static int TABLE_ID = 1;
  static final int TABLE_START_EXP_REQUIRED = 250;
  static final float TABLE_EXP_REQUIRED_FACTOR = 1.4;
  static final int TABLE_STARTING_SIZE = 3;
  static final int TABLE_MAX_LEVEL = 7;
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
    add(new int[] { Math.round((WIDTH / 2) - (TABLE_SIZE_W / 2)), Math.round(HEIGHT - TABLE_MARGIN  - SHOP_WALL_MARGIN_BOTTOM - TABLE_SIZE_H), TABLE_SIZE_W, TABLE_SIZE_H });
    
    // The two around the center bottom one
    add(new int[] { Math.round((Constants.WIDTH / 2) - (Constants.SHOP_WALL_WIDTH / 2) + TABLE_MARGIN), (HEIGHT - TABLE_MARGIN  - SHOP_WALL_MARGIN_BOTTOM - TABLE_SIZE_H), TABLE_SIZE_W, TABLE_SIZE_H });
    add(new int[] { Math.round((Constants.WIDTH / 2) + (Constants.SHOP_WALL_WIDTH / 2) - TABLE_MARGIN - TABLE_SIZE_W), (HEIGHT - TABLE_MARGIN  - SHOP_WALL_MARGIN_BOTTOM - TABLE_SIZE_H), TABLE_SIZE_W, TABLE_SIZE_H });
    
    // The two at the top of the shop
    add(new int[] { Math.round((Constants.WIDTH / 2) - (Constants.SHOP_WALL_WIDTH / 2) + TABLE_MARGIN), (HEIGHT - SHOP_WALL_MARGIN_BOTTOM - SHOP_WALL_HEIGHT + TABLE_MARGIN), TABLE_SIZE_W, TABLE_SIZE_H });
    add(new int[] { Math.round((Constants.WIDTH / 2) + (Constants.SHOP_WALL_WIDTH / 2) - TABLE_MARGIN - TABLE_SIZE_W), (HEIGHT - SHOP_WALL_MARGIN_BOTTOM - SHOP_WALL_HEIGHT + TABLE_MARGIN), TABLE_SIZE_W, TABLE_SIZE_H });
    
    // The two on the middle of the shop
    add(new int[] { Math.round((Constants.WIDTH / 2) - Constants.TABLE_MARGIN - TABLE_SIZE_W), Math.round(((HEIGHT - SHOP_WALL_MARGIN_BOTTOM - SHOP_WALL_HEIGHT) + (SHOP_WALL_HEIGHT / 2)) - (TABLE_SIZE_H / 2)), TABLE_SIZE_W, TABLE_SIZE_H });
    add(new int[] { Math.round((Constants.WIDTH / 2) + Constants.TABLE_MARGIN), Math.round(((HEIGHT - SHOP_WALL_MARGIN_BOTTOM - SHOP_WALL_HEIGHT) + (SHOP_WALL_HEIGHT / 2)) - (TABLE_SIZE_H / 2)), TABLE_SIZE_W, TABLE_SIZE_H });
    
    // These two ones are "flipped", so I use the table h instead of w, and vice-versa.
    add(new int[] { Math.round((Constants.WIDTH / 2) - (Constants.SHOP_WALL_WIDTH / 2) + TABLE_MARGIN),Math.round(((HEIGHT - SHOP_WALL_MARGIN_BOTTOM - SHOP_WALL_HEIGHT) + (SHOP_WALL_HEIGHT / 2)) - (TABLE_SIZE_W / 2)), TABLE_SIZE_H, TABLE_SIZE_W });
    add(new int[] { Math.round((Constants.WIDTH / 2) + (Constants.SHOP_WALL_WIDTH / 2) - TABLE_MARGIN - TABLE_SIZE_H), Math.round(((HEIGHT - SHOP_WALL_MARGIN_BOTTOM - SHOP_WALL_HEIGHT) + (SHOP_WALL_HEIGHT / 2)) - (TABLE_SIZE_W / 2)), TABLE_SIZE_H, TABLE_SIZE_W });
  }};
  
  // Item
  static int ITEM_ID = 1;
  
  
  static boolean itemExists(ArrayList<Item> items, Item newItem) {
    for (Item item : items) {
      if (item.getId() == newItem.getId()) {
        return true;
      }
    }
    return false;
  }
  
  static Item getItem(ArrayList<Item> items, Item newItem) {
    for (Item item : items) {
      if (item.getId() == newItem.getId()) {
        return item;
      }
    }
    return null;
  }
  
  static Item getItemByName(ArrayList<Item> items, String itemName) {
    for (Item item : items) {
      if (item.getItemName().equals(itemName)) {
        return item;
      }
    }
    return null;
  }
  
  // RPG Classes
  static int RPGCLASS_ID = 1;
  static float ADVENTURER_PERCENT = 0.01;
  static float WIZARD_PERCENT = 0.005;
  
  static RPGClass getClass(ArrayList<RPGClass> rpgClasses, RPGClass newRpgClass) {
    for (RPGClass rpgClass : rpgClasses) {
      if (rpgClass == newRpgClass) {
        return rpgClass;
      }
    }
    return null;
  }
  
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
