class Shop {
  private int level;
  // Experience required for the next level
  private int nextLevelExp;
  // Factor that decides how much exp more you will need to level up again
  private float expRequiredFactor;
  private ArrayList<Table> tables = new ArrayList<Table>();
  
  public Shop(int startLevelExp, float expRequiredFactor) {
    this.level = 1;
    this.nextLevelExp = startLevelExp;
    this.expRequiredFactor = expRequiredFactor;
    this.addTable();
  }
  
  public int getLevel() {
    return this.level;
  }
  
  public int getRequiredExp() {
    return this.nextLevelExp;
  }
  
  public boolean canLevelUp(int experience) {
    return (experience >= this.nextLevelExp) && this.level < Constants.SHOP_MAX_LEVEL;
  }
  
  public int levelUp(int experience) {
    if (this.canLevelUp(experience)) {
      this.level++;
      // The nextLevelExp, if it was 100, now it will be 100 + 160 = 260
      this.nextLevelExp += (int)(this.nextLevelExp * this.expRequiredFactor);
      // Leveling up creates a new table.
      this.addTable();
      return (experience - this.nextLevelExp);
    }
    return experience;
  }
  
  public void draw() {
    pushMatrix();
    // Draw walls
    this.drawWalls();    
    // Draw tables
    this.drawTables();    
    popMatrix();
  }
  
  private void drawWalls() {
    stroke(255);
    int startX = (int)((Constants.WIDTH / 2)  - (Constants.SHOP_WALL_WIDTH / 2));
    int endX = (int)((Constants.WIDTH / 2) + (Constants.SHOP_WALL_WIDTH / 2));
    int endY = Constants.HEIGHT - Constants.SHOP_WALL_MARGIN_BOTTOM;
    int startY = endY - Constants.SHOP_WALL_HEIGHT;
    
    int endSmallX = startX + Constants.SHOP_SMALL_WALL_WIDTH;
    int startSmallX = endX - Constants.SHOP_SMALL_WALL_WIDTH;
    
    // Top left line
    line(startX, startY, endSmallX, startY);
    // Top right line
    line(startSmallX, startY, endX, startY);
    // Left line
    line(startX, startY, startX, endY);
    // Right line
    line(endX, startY, endX, endY);
    // Bottom line
    line(startX, endY, endX, endY);
  }
  
  private void drawTables() {
    for (Table table : tables) {
      table.draw();
    }
  }
  
  private void addTable() {
    int[] tablePosition = Constants.getTablePosition(this.level);
    this.tables.add(new Table(Constants.TABLE_START_EXP_REQUIRED, Constants.TABLE_EXP_REQUIRED_FACTOR, Constants.TABLE_STARTING_SIZE, tablePosition[0], tablePosition[1], tablePosition[2], tablePosition[3]));
  }
}
