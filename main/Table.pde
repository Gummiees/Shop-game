class Table {
  private int level;
  // Experience required for the next level
  private int nextLevelExp;
  // Factor that decides how much exp more you will need to level up again
  private float expRequiredFactor;
  
  private int x;
  private int y;
  private int boxWidth;
  private int boxHeight;
  
  private ArrayList<Item> items = new ArrayList<Item>();
  private int size;
  private int id;
  
  public Table(int startLevelExp, float expRequiredFactor, int size, int x, int y, int w, int h) {
    this.level = 1;
    
    this.size = size;
    this.x = x;
    this.y = y;
    this.boxWidth = w;
    this.boxHeight = h;
    this.nextLevelExp = startLevelExp;
    this.expRequiredFactor = expRequiredFactor;
    
    this.id = Constants.TABLE_ID;
    Constants.TABLE_ID++;
  }
  
  public int getId() {
    return this.id;
  }
  
  public boolean canAddItem(Item item) {
    return item.getSize() <= this.getSizeLeft();
  }
  
  public void addItem(Item item) {
    // Can only add the item if it is not already on the table and there is enough size left on it.
    if (!Constants.itemExists(this.items, item) && this.canAddItem(item)) {
      this.items.add(item);
    }
  }
  
  public void removeItem(Item item) {
    if (Constants.itemExists(this.items, item)) {
      Item existentItem = Constants.getItem(this.items, item);
      this.items.remove(existentItem);
    }
  }
  
  public ArrayList<Item> getItems() {
    return this.items;
  }
  
  public void setSize(int size) {
    this.size = size;
  }
  
  public int getTotalSize() {
    return this.size;
  }
  
  public int getSizeLeft() {
    int sizeLeft = this.size;
    for (Item item : items) {
      sizeLeft -= item.getSize(); 
    }
    
    return sizeLeft;
  }
  
  public int getSizeOccupied() {
    return this.size - this.getSizeLeft();
  }
  
  public int getLevel() {
    return this.level;
  }
  
  public int getRequiredExp() {
    return this.nextLevelExp;
  }
  
  public boolean canLevelUp(int experience) {
    // Can only level up if the experience is enough and the level is not the max level.
    return (experience >= this.nextLevelExp) && this.level < Constants.TABLE_MAX_LEVEL;
  }
  
  public int levelUp(int experience) {
    if (this.canLevelUp(experience)) {
      this.level++;
      // The nextLevelExp, if it was 100, now it will be 100 + 160 = 260
      this.nextLevelExp +=Math.round(this.nextLevelExp * this.expRequiredFactor);
      // Leveling up adds one space to the table.
      this.size++;
      return (experience - this.nextLevelExp);
    }
    return experience;
  }
  
  public void draw() {
    pushMatrix();
    noFill();
    stroke(255);
    rect(this.x, this.y, this.boxWidth, this.boxHeight);
    popMatrix();
    
    pushMatrix();
    fill(255);
    textSize(Constants.TABLE_TEXT_SIZE);
    textAlign(CENTER, CENTER);
    text(str(this.getSizeLeft()), this.x, this.y, this.boxWidth, this.boxHeight);
    popMatrix();
  }
}
