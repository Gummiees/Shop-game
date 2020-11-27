class Character {
  private int x;
  private int y;
  private float experience;
  private color mainColor;
  private String name;
  
  private Inventory inventory = new Inventory(Constants.MONEY_START);
  private ArrayList<RPGClass> unlockedClasses = new ArrayList<RPGClass>();
  
  public Character(RPGClass defaultClass) {
    this.experience = 0;
    this.x  = 16;
    this.y = 16;
    
    // By default, the Aventurer is unlocked.
    this.unlockedClasses.add(defaultClass);
    // TODO: Setup an initial random inventory
  }
  
  public void draw() {
    pushMatrix();
    noStroke();
    fill(this.mainColor);
    rect(0,0, x, y);
    popMatrix();
  }
  
  public void setUsername(String name) {
    this.name = name;
  }
  
  public void setExperience(float experience) {
    this.experience = experience;
  }
  
  public double getExperience() {
    return this.experience;
  }
  
  public String getUsername() {
    return this.name;
  }
  
  public void setColor(color mainColor) {
    this.mainColor = mainColor;
  }
  
  public color getColor() {
    return this.mainColor;
  }
  
  public void setInventory(Inventory inventory) {
    this.inventory = inventory;
  }
  
  public Inventory getInventory() {
    return this.inventory;
  }
  
  public ArrayList<RPGClass> getUnlockedClasses() {
    return this.unlockedClasses;
  }
  
  public void addClass(RPGClass rpgClass) {
    this.unlockedClasses.add(rpgClass);
  }
  
  public boolean isClassUnlocked(RPGClass newRpgClass) {
    for (RPGClass rpgClass : this.unlockedClasses) {
      if (rpgClass.getId() == newRpgClass.getId()) {
        return true;
      }
    }
    return false;
  }
}
